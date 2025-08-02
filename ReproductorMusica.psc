// ****** Definici�n de Funciones del Reproductor de M�sica ******
// Prop�sito: Notifica al usuario que el comando ingresado no es v�lido y limpia la pantalla.
Funcion valorReproductor <- comandoNoEncontrado()
	Escribir "Comando no encontrado, favor de colocar uno correcto" // Mensaje de error al usuario
	Esperar 3 Segundos // Pausa para que el usuario lea el mensaje
	valorReproductor <- Verdadero
Fin Funcion
// Prop�sito: Simula el apagado del reproductor y muestra un mensaje de despedida.
Funcion valorReproductor <- apagarReproductor ( )
	Escribir "Reproductor apagandose ..."  // Mensaje de apagado
	Esperar 2 Segundos
	Escribir "Hasta luego."
	Esperar 1 Segundos
	valorReproductor <- Falso// Establece el valor de retorno para salir del bucle principal
Fin Funcion
// Prop�sito: Cambia el estado de reproducci�n de la canci�n entre "Reproduciendo" y "Pausado".
Funcion estadoReproduccion <- pausarMusica(estadoReproduccion)
	Si estadoReproduccion = "Reproduciendo" Entonces // Si la canci�n est� reproduci�ndose...
		estadoReproduccion <- "Pausado"
		Escribir "Canci�n pausada."
		Esperar 2 Segundos
	Sino // Si no est� reproduciendo (es decir, est� "Pausado" o "Espera...")
		Si estadoReproduccion = "Pausado" Entonces// Si estaba pausada...
			estadoReproduccion <- "Reproduciendo"
			Escribir "Reanudando reproducci�n."
		Sino// Si est� en cualquier otro estado (ej. "Espera...")
			estadoReproduccion <- "Espera..."
			
		Fin Si
	Fin Si
	Esperar 2 Segundos
Fin Funcion

// Funci�n para verificar si una cadena de texto representa un n�mero v�lido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	Definir valorE Como Entero // Variable para almacenar la longitud del valor escrito
	valorE <- Longitud(valorEscrito)
	
	
	esNumero <- Verdadero // Asume que la cadena es un n�mero hasta que se demuestre lo contrario.
	contador <- 0// Contador para llevar el control de los puntos decimales.
	
	
	// Itera sobre cada car�cter de la cadena de texto.
	Para i <- 1 Hasta valorE Hacer // El ciclo recorre cada car�cter de la cadena.
		valorRevisar <- Subcadena(valorEscrito, i, i) // Extrae un solo car�cter en la posici�n actual 'i'.
		
		// Eval�a el car�cter extra�do.
		Segun valorRevisar Hacer
			"0","1","2","3","4","5","6","7","8","9": // Si el car�cter es un d�gito del 0 al 9, no hace nada.
			De Otro Modo: // Si el car�cter no es un d�gito ni un punto.
				esNumero <- Falso // La cadena no es un n�mero.
		Fin Segun
	FinPara
Fin Funcion
// Prop�sito: Permite al usuario ajustar el volumen del reproductor, validando la entrada.
Funcion valorVolumen <- volumenMusica()
	Definir esVolumenCorrecto Como Logico // Variable para controlar la validez de la entrada
	esVolumenCorrecto <- Falso
	Repetir  // Bucle para pedir el volumen hasta que sea v�lido
		
		Escribir "Volumen:"
		Escribir "Puede ser de 1 al 30"
		Leer ingresaValor // Lee la entrada del usuario para el volumen
		esNumero <- revisarNumero ( ingresaValor)
		
		Si esNumero = Verdadero Entonces // Si la entrada es un n�mero...
			Si ConvertirANumero(ingresaValor) > 0 Y ConvertirANumero(ingresaValor) < 30 Entonces
				Escribir "Valor correcto, se cambia el volumen."
				Esperar 2 Segundos
				esVolumenCorrecto <- Verdadero // La entrada es correcta, sale del bucle
			SiNo
				Escribir "Ingrese un valor correcto"
				Esperar 2 Segundos
				esVolumenCorrecto <- Falso // La entrada es incorrecta, contin�a en el bucle
				
			Fin Si
		SiNo
			Escribir "Ingrese un valor correcto"
			Esperar 2 Segundos
			esVolumenCorrecto <- Falso // La entrada es incorrecta, contin�a en el bucle
			
		Fin Si
		
	Hasta Que esVolumenCorrecto = Verdadero // Repetir hasta que el volumen sea correcto
	valorVolumen <- ConvertirANumero(ingresaValor) // Retorna el valor num�rico del volumen validado
Fin Funcion

// Prop�sito: Muestra la interfaz principal del reproductor con la informaci�n actual de la canci�n y los comandos disponibles.
Funcion Inicio(cancion, artista, genero, volumen, estadoReproduccion )
	Limpiar Pantalla
	Escribir "*********************************"
	Escribir "     Reproductor De Musica"
	Escribir "*********************************"
	// Muestra la informaci�n de la canci�n actual
	Escribir "     Cancion: ",cancion
	Escribir "     Artista: ",artista
	Escribir "     Genero: ",genero
	Escribir "     Estado: ",estadoReproduccion
	Escribir  ""
	Escribir "     Volumen:", volumen
	Si volumen = 0 Entonces
		Escribir  " "
	SiNo
		Para i <- 1 Hasta volumen Hacer
			Escribir "=" Sin Saltar
		Fin Para
	Fin Si
	// Lista de comandos disponibles
	Escribir  ""
	Escribir "---------------------------------" // Separador
	Escribir "Comandos:"
	Escribir "  BUSCAR: Busqueda de canciones"
	Escribir "  LISTA: Muestra lista de canciones"
	Escribir "  PAUSA: pausa o reanuda la canciones"
	Escribir "  VOLUMEN: Subir el volumen del reproductor"
	Escribir " 	 APAGAR: Salir del reproductor"
	Escribir "---------------------------------" // Separador
	Escribir "Ingresa un comando:"  // Petici�n de entrada al usuario
	
Fin Funcion

// ****** Proceso Principal del Reproductor de M�sica ******
Proceso ReproductorMusica
	// Definici�n de variables globales para el estado del reproductor
	Definir genero, cancion, artista Como Caracter;
	Definir volumen Como Entero
	Definir continuar Como Logico
	// Inicializaci�n de variables
	genero<- "-"
	cancion<- "-"
	artista <- "-"
	estadoReproduccion <- "Espera..."
	volumen <- 0
	continuar <- Verdadero
	// Definici�n e inicializaci�n de los arreglos con la colecci�n musical
	// Arreglo para los g�neros de las canciones
	Dimension generoMusical[16]
	generoMusical[1]="pop"
	generoMusical[2]="pop"
	generoMusical[3]="rock"
	generoMusical[4]="rock"
	generoMusical[5]="hip hop"
	generoMusical[6]="hip hop"
	generoMusical[7]="electronica"
	generoMusical[8]="electronica"
	generoMusical[9]="jazz"
	generoMusical[10]="jazz"
	generoMusical[11]="reggaeton"
	generoMusical[12]="reggaeton"
	generoMusical[13]="cumbia"
	generoMusical[14]="cumbia"
	generoMusical[15]="salsa"
	generoMusical[16]="salsa"
	// Arreglo para los t�tulos de las canciones
	Dimension cancionMusical[16]
	cancionMusical[1]="blinding lights"
	cancionMusical[2]="rolling in the deep"
	cancionMusical[3]="bohemian rhapsody"
	cancionMusical[4]="come as you are"
	cancionMusical[5]="lose yourself"
	cancionMusical[6]="sicko mode"
	cancionMusical[7]="levels"
	cancionMusical[8]="faded" 
	cancionMusical[9]="so shat"
	cancionMusical[10]="at last"
	cancionMusical[11]="yo perreo sola"
	cancionMusical[12]="con calma"
	cancionMusical[13]="como te voy a olvidar"
	cancionMusical[14]="oye"
	cancionMusical[15]="la vida es un carnaval"
	cancionMusical[16]="yo no se ma�ana"
	// Arreglo para los artistas de las canciones
	Dimension artistaMusical[16]
	artistaMusical[1]="the weeknd"
	artistaMusical[2]="adele"
	artistaMusical[3]="queen"
	artistaMusical[4]="nirvana"
	artistaMusical[5]="eminem"
	artistaMusical[6]="travis scott"
	artistaMusical[7]="avicii"
	artistaMusical[8]="alan walker"
	artistaMusical[9]="miles davis"
	artistaMusical[10]="etta james"
	artistaMusical[11]="bad bunny"
	artistaMusical[12]="daddy yankee"
	artistaMusical[13]="los angeles azules"
	artistaMusical[14]="kumbia kings"
	artistaMusical[15]="celia cruz"
	artistaMusical[16]="luis enrique"
	// Bucle principal del reproductor: se repite hasta que el usuario decida apagarlo
	Repetir
		Inicio(cancion, artista, genero, volumen, estadoReproduccion )
		Leer valorSeleccionado // Lee el comando ingresado por el usuario
		// Estructura de control para manejar los diferentes comandos
		Segun valorSeleccionado Hacer
			"BUSCAR":  // Comando para buscar canciones
				Definir busqueda Como Logico // Variable para validar el tipo de b�squeda
				Repetir
					Escribir "Ingresa el numero de como quieres realizar la busqueda"
					Escribir "1. Genero"
					Escribir "2. Artista"
					Escribir "3. Cancion"
					Leer tipoBusqueda
					Segun tipoBusqueda Hacer
						"1","2","3":
							busqueda <- Verdadero
						De Otro Modo:
							busqueda <- Falso
					Fin Segun
				Hasta Que busqueda == Verdadero
				
				
				Segun tipoBusqueda Hacer // Procesa la b�squeda seg�n el tipo elegido
					"1": // B�squeda por G�nero
						Repetir
							Escribir "--- Lista de Genero Cancion ---"
							Para i = 1 Hasta 16 Con Paso 2 Hacer
								Escribir "*", generoMusical[i] // Muestra los g�neros disponibles
							Fin Para
							Escribir "--------------------------"
							Escribir "Ingresa el genero que quieres realizar la busqueda"
							Leer  generoSeleccionado // Lee el g�nero a buscar
							
							Segun generoSeleccionado Hacer // Valida si el g�nero es uno de los conocidos
								"pop","rock","hip hop","electronica","jazz","reggaeton","cumbia","salsa":
									busquedaGenero <- Verdadero
								De Otro Modo:
									busquedaGenero <- Falso
							Fin Segun
						Hasta Que busquedaGenero == Verdadero // Sale cuando el g�nero es v�lido
						
						// Se procesa la selecci�n de g�nero
						Segun Minusculas(generoSeleccionado) Hacer // Convierte a min�sculas para la comparaci�n
							"pop": // Si el g�nero es "pop"
								genero<- generoMusical[1]
								Escribir "--- Lista de Canciones ---"
								Para i = 1 Hasta 2 Hacer // Muestra las canciones de ese g�nero
									Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
								Fin Para
								Escribir "--------------------------"
								continuar <- Verdadero
								Repetir
									// Bucle para validar la entrada del n�mero de canci�n
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									
									esNumero <- revisarNumero(cancionReproducida) // Valida si es un n�mero
								Hasta Que esNumero == Verdadero
								
								// Actualiza la informaci�n del reproductor con la canci�n seleccionada
								genero<- generoMusical[cancionReproducida]
								cancion<- cancionMusical[cancionReproducida]
								artista <- artistaMusical[cancionReproducida]
								volumen <- 20
								estadoReproduccion <- pausarMusica("Pausado")
								
								
								
							"rock":
								genero<- generoMusical[3]
								Escribir "--- Lista de Canciones ---"
								Para i = 3 Hasta 4 Hacer
									Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
								Fin Para
								Escribir "--------------------------"
								continuar <- Verdadero
								Repetir
									// Bucle para validar la entrada del n�mero de canci�n
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									
									esNumero <- revisarNumero(cancionReproducida) // Valida si es un n�mero
								Hasta Que esNumero == Verdadero
								
								// Actualiza la informaci�n del reproductor con la canci�n seleccionada
								genero<- generoMusical[cancionReproducida]
								cancion<- cancionMusical[cancionReproducida]
								artista <- artistaMusical[cancionReproducida]
								volumen <- 20
								estadoReproduccion <- pausarMusica("Pausado")
								
							"hip hop":
								genero<- generoMusical[5]
								Escribir "--- Lista de Canciones ---"
								Para i = 5 Hasta 6 Hacer
									Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
								Fin Para
								Escribir "--------------------------"
								continuar <- Verdadero
								Repetir
									// Bucle para validar la entrada del n�mero de canci�n
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									
									esNumero <- revisarNumero(cancionReproducida) // Valida si es un n�mero
								Hasta Que esNumero == Verdadero
								
								// Actualiza la informaci�n del reproductor con la canci�n seleccionada
								genero<- generoMusical[cancionReproducida]
								cancion<- cancionMusical[cancionReproducida]
								artista <- artistaMusical[cancionReproducida]
								volumen <- 20
								estadoReproduccion <- pausarMusica("Pausado")
								
							"electronica":
								genero<- generoMusical[7]
								Escribir "--- Lista de Canciones ---"
								Para i = 7 Hasta 8 Hacer
									Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
								Fin Para
								Escribir "--------------------------"
								continuar <- Verdadero
								Repetir
									// Bucle para validar la entrada del n�mero de canci�n
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									
									esNumero <- revisarNumero(cancionReproducida) // Valida si es un n�mero
								Hasta Que esNumero == Verdadero
								
								// Actualiza la informaci�n del reproductor con la canci�n seleccionada
								genero<- generoMusical[cancionReproducida]
								cancion<- cancionMusical[cancionReproducida]
								artista <- artistaMusical[cancionReproducida]
								volumen <- 20
								estadoReproduccion <- pausarMusica("Pausado")
								
							"jazz":
								genero<- generoMusical[9]
								Escribir "--- Lista de Canciones ---"
								Para i = 9 Hasta 10 Hacer
									Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
								Fin Para
								Escribir "--------------------------"
								continuar <- Verdadero
								Repetir
									// Bucle para validar la entrada del n�mero de canci�n
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									
									esNumero <- revisarNumero(cancionReproducida) // Valida si es un n�mero
								Hasta Que esNumero == Verdadero
								
								// Actualiza la informaci�n del reproductor con la canci�n seleccionada
								genero<- generoMusical[cancionReproducida]
								cancion<- cancionMusical[cancionReproducida]
								artista <- artistaMusical[cancionReproducida]
								volumen <- 20
								estadoReproduccion <- pausarMusica("Pausado")
								
							"reggaeton":
								genero<- generoMusical[11]
								Escribir "--- Lista de Canciones ---"
								Para i = 11 Hasta 12 Hacer
									Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
								Fin Para
								Escribir "--------------------------"
								continuar <- Verdadero
								Repetir
									// Bucle para validar la entrada del n�mero de canci�n
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									
									esNumero <- revisarNumero(cancionReproducida) // Valida si es un n�mero
								Hasta Que esNumero == Verdadero
								
								// Actualiza la informaci�n del reproductor con la canci�n seleccionada
								genero<- generoMusical[cancionReproducida]
								cancion<- cancionMusical[cancionReproducida]
								artista <- artistaMusical[cancionReproducida]
								volumen <- 20
								estadoReproduccion <- pausarMusica("Pausado")
								
							"cumbia":
								genero<- generoMusical[13]
								Escribir "--- Lista de Canciones ---"
								Para i = 13 Hasta 14 Hacer
									Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
								Fin Para
								Escribir "--------------------------"
								continuar <- Verdadero
								Repetir
									// Bucle para validar la entrada del n�mero de canci�n
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									
									esNumero <- revisarNumero(cancionReproducida) // Valida si es un n�mero
								Hasta Que esNumero == Verdadero
								
								// Actualiza la informaci�n del reproductor con la canci�n seleccionada
								genero<- generoMusical[cancionReproducida]
								cancion<- cancionMusical[cancionReproducida]
								artista <- artistaMusical[cancionReproducida]
								volumen <- 20
								estadoReproduccion <- pausarMusica("Pausado")
								
							"salsa":
								genero<- generoMusical[15]
								Escribir "--- Lista de Canciones ---"
								Para i = 15 Hasta 16 Hacer
									Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
								Fin Para
								Escribir "--------------------------"
								continuar <- Verdadero
								Repetir
									// Bucle para validar la entrada del n�mero de canci�n
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									
									esNumero <- revisarNumero(cancionReproducida) // Valida si es un n�mero
								Hasta Que esNumero == Verdadero
								
								// Actualiza la informaci�n del reproductor con la canci�n seleccionada
								genero<- generoMusical[cancionReproducida]
								cancion<- cancionMusical[cancionReproducida]
								artista <- artistaMusical[cancionReproducida]
								volumen <- 20
								estadoReproduccion <- pausarMusica("Pausado")
								
							De Otro Modo:
								Escribir "No se encuentra valor"
						Fin Segun
						Esperar Tecla
					"2": // B�squeda por Artista
						Repetir  // Bucle para asegurar que el artista sea v�lido
							
							Escribir "--- Lista de Artistas  ---"
							Para i <- 1 Hasta 16 Con Paso 1 Hacer
								Escribir "*", artistaMusical[i]  // Muestra la lista de artistas disponibles
							Fin Para
							Escribir "--------------------------"
							Escribir ""
							Escribir "Ingresa el artista que desea buscar:"
							Leer palabraBuscada // Lee el nombre del artista a buscar
							// Busca el artista en el arreglo
							Dimension arregloArtistas[1]
							contador<-0
							Para i <- 1 Hasta 16 Con Paso 1 Hacer
								Si Minusculas(artistaMusical[i]) = Minusculas(palabraBuscada) Entonces
									contador<-contador+1
									arregloArtistas[contador] <- i 
								FinSi
							FinPara
							
							Escribir "Buscando ..."
							Esperar 2 segundos
							Si contador >0 Entonces // Si se encontr� al menos una canci�n del artista
								
								artistaBuscado <- Verdadero 
							SiNo // Si no se encontr� el artista
								Escribir "No se encontro artista"
								Esperar 2 Segundos
								artistaBuscado <- Falso 
							Fin Si
						Hasta Que artistaBuscado = Verdadero 
						
						Escribir "--- Lista de Canciones ---"
						Para i = 1 Hasta 1 Hacer // Muestra la(s) canci�n(es) del artista encontrado
							numeroCancion <- arregloArtistas[i]
							Escribir (numeroCancion), ". ", cancionMusical[numeroCancion]," - ",  artistaMusical[numeroCancion]  
						Fin Para
						Escribir "--------------------------"
						continuar <- Verdadero
						Esperar Tecla
						Repetir  // Bucle para validar la entrada del n�mero de canci�n
							
							Escribir "Ingresa el numero de la cancion que quieres reproducir"
							Leer cancionReproducida // Lee la entrada del usuario
							
							esNumero <- revisarNumero(cancionReproducida)
						Hasta Que esNumero == Verdadero
						
						// Actualiza la informaci�n del reproductor
						genero<- generoMusical[cancionReproducida]
						cancion<- cancionMusical[cancionReproducida]
						artista <- artistaMusical[cancionReproducida]
						volumen <- 20
						estadoReproduccion <- pausarMusica("Pausado")
					"3": // B�squeda por Canci�n
						Escribir "Ingresa la cancion que desea buscar:"
						Leer palabraBuscada
						Dimension arregloMusica[1]
						contador<-0
						Para i <- 1 Hasta 16 Con Paso 1 Hacer // Recorre la lista de canciones
							Si Minusculas(cancionMusical[i]) = Minusculas(palabraBuscada) Entonces
								contador<-contador+1
								arregloMusica[contador] <- i   // Guarda el �ndice de la canci�n encontrada
							FinSi
						FinPara
						
						Escribir "--- Lista de Canciones ---"
						Para i = 1 Hasta 1 Hacer
							numeroCancion <- arregloMusica[i]
							Escribir (numeroCancion), ". ", cancionMusical[numeroCancion]," - ",  artistaMusical[numeroCancion]  
						Fin Para
						Escribir "--------------------------"
						continuar <- Verdadero
						Esperar Tecla
						
						Repetir
							Escribir "Ingresa el numero de la cancion que quieres reproducir"
							Leer cancionReproducida // Lee la entrada del usuario
							
							esNumero <- revisarNumero(cancionReproducida)
						Hasta Que esNumero == Verdadero
						// Actualiza la informaci�n del reproductor
						genero<- generoMusical[cancionReproducida]
						cancion<- cancionMusical[cancionReproducida]
						artista <- artistaMusical[cancionReproducida]
						volumen <- 20
						estadoReproduccion <- pausarMusica("Pausado")
						
					De Otro Modo:
						Escribir "Ingresa un numero correcto" // Mensaje de error
				Fin Segun
				
				continuar <- Verdadero
			"LISTA":  // Comando para mostrar la lista completa de canciones
				Escribir "--- Lista de Canciones ---"
                Para i = 1 Hasta 16 Hacer // Recorre y muestra todas las canciones
                    Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
                Fin Para
                Escribir "--------------------------"
				continuar <- Verdadero
				Repetir
					
					Escribir "Ingresa el numero de la cancion que quieres reproducir"
					Leer cancionReproducida // Lee la entrada del usuario
					
					
					esNumero <- revisarNumero(cancionReproducida)
					
				Hasta Que esNumero == Verdadero y ConvertirANumero(cancionReproducida) <= 16 Y ConvertirANumero(cancionReproducida) >= 1
				// Actualiza la informaci�n del reproductor con la canci�n seleccionada
				genero<- generoMusical[cancionReproducida]
				cancion<- cancionMusical[cancionReproducida]
				artista <- artistaMusical[cancionReproducida]
				volumen <- 20
				estadoReproduccion <- pausarMusica("Pausado")
				
			"PAUSA": // Comando para pausar o reanudar la m�sica
				estadoReproduccion <- pausarMusica(estadoReproduccion)
				continuar <- Verdadero
			"VOLUMEN":  // Comando para ajustar el volumen
				volumen <- volumenMusica()
				continuar <- Verdadero
			"APAGAR": // Comando para apagar el reproductor
				continuar <- apagarReproductor()
			De Otro Modo: // Si el comando ingresado no es ninguno de los anteriores
				continuar <- comandoNoEncontrado()
		Fin Segun
	Hasta Que continuar = Falso
	
FinProceso
	