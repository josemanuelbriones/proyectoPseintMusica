<<<<<<< HEAD
=======

>>>>>>> manuel
Funcion valorReproductor <- comandoNoEncontrado()
	Escribir "Comando no encontrado, favor de colocar uno correcto"
	Esperar 3 Segundos
	Limpiar Pantalla
	valorReproductor <- Verdadero
Fin Funcion

Funcion valorReproductor <- apagarReproductor ( )
	Escribir "Reproductor apagandose ..."
<<<<<<< HEAD
	Esperar 5 Segundos
	Escribir "Hasta luego."
	Esperar 2 Segundos
	valorReproductor <- Falso
Fin Funcion

Funcion valorMusica <- busquedaMusica ()
	
	valorMusica <- "sin nombre"
Fin Funcion
=======
	Esperar 2 Segundos
	Escribir "Hasta luego."
	Esperar 1 Segundos
	valorReproductor <- Falso
Fin Funcion

Funcion estadoReproduccion <- pausarMusica(estadoReproduccion)
	Si estadoReproduccion = "Reproduciendo" Entonces
		estadoReproduccion <- "Pausado"
		Escribir "Canción pausada."
		Esperar 2 Segundos
	Sino 
		Si estadoReproduccion = "Pausado" Entonces
			estadoReproduccion <- "Reproduciendo"
			Escribir "Reanudando reproducción."
		Sino
			estadoReproduccion <- "Espera..."
			
		Fin Si
	Fin Si
	Esperar 2 Segundos
Fin Funcion

>>>>>>> manuel
// Función para verificar si una cadena de texto representa un número válido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	Definir valorE Como Entero // Variable para almacenar la longitud del valor escrito
	valorE <- Longitud(valorEscrito)
	
<<<<<<< HEAD
	esNumero <- Verdadero // Asume que la cadena es un número hasta que se demuestre lo contrario.
	contador <- 0// Contador para llevar el control de los puntos decimales.
	
=======
	
	esNumero <- Verdadero // Asume que la cadena es un número hasta que se demuestre lo contrario.
	contador <- 0// Contador para llevar el control de los puntos decimales.
	
	
>>>>>>> manuel
	// Itera sobre cada carácter de la cadena de texto.
	Para i <- 1 Hasta valorE Hacer // El ciclo recorre cada carácter de la cadena.
		valorRevisar <- Subcadena(valorEscrito, i, i) // Extrae un solo carácter en la posición actual 'i'.
		
		// Evalúa el carácter extraído.
		Segun valorRevisar Hacer
			"0","1","2","3","4","5","6","7","8","9": // Si el carácter es un dígito del 0 al 9, no hace nada.
			De Otro Modo: // Si el carácter no es un dígito ni un punto.
				esNumero <- Falso // La cadena no es un número.
		Fin Segun
	FinPara
Fin Funcion

Funcion valorVolumen <- volumenMusica()
	Definir esVolumenCorrecto Como Logico
	esVolumenCorrecto <- Falso
	Repetir
		Limpiar Pantalla
		Escribir "Volumen:"
		Escribir "Puede ser de 1 al 30"
		Leer ingresaValor
		esNumero <- revisarNumero ( ingresaValor)
		
		Si esNumero = Verdadero Entonces
			Si ConvertirANumero(ingresaValor) > 0 Y ConvertirANumero(ingresaValor) < 30 Entonces
				Escribir "Valor correcto, se cambia el volumen."
<<<<<<< HEAD
				Esperar 3 Segundos
				esVolumenCorrecto <- Verdadero
			SiNo
				Escribir "Ingrese un valor correcto"
				Esperar 3 Segundos
=======
				Esperar 2 Segundos
				esVolumenCorrecto <- Verdadero
			SiNo
				Escribir "Ingrese un valor correcto"
				Esperar 2 Segundos
>>>>>>> manuel
				esVolumenCorrecto <- Falso
				
			Fin Si
		SiNo
			Escribir "Ingrese un valor correcto"
<<<<<<< HEAD
			Esperar 3 Segundos
			esVolumenCorrecto <- Falso
			
		Fin Si
				
=======
			Esperar 2 Segundos
			esVolumenCorrecto <- Falso
			
		Fin Si
		
>>>>>>> manuel
	Hasta Que esVolumenCorrecto = Verdadero
	valorVolumen <- ConvertirANumero(ingresaValor)
Fin Funcion

<<<<<<< HEAD
Funcion Inicio(cancion, artista, genero, volumen )
=======
Funcion Inicio(cancion, artista, genero, volumen, estadoReproduccion )
	Limpiar Pantalla
>>>>>>> manuel
	Escribir "*********************************"
	Escribir "     Reproductor De Musica"
	Escribir "*********************************"
	
	Escribir "     Cancion: ",cancion
	Escribir "     Artista: ",artista
	Escribir "     Genero: ",genero
<<<<<<< HEAD
	Escribir  ""
	Escribir "     Volumen:", volumen
	Escribir "      "Sin Saltar
=======
	Escribir "     Estado: ",estadoReproduccion
	Escribir  ""
	Escribir "     Volumen:", volumen
>>>>>>> manuel
	Si volumen = 0 Entonces
		Escribir  " "
	SiNo
		Para i <- 1 Hasta volumen Hacer
			Escribir "=" Sin Saltar
		Fin Para
	Fin Si
	
	Escribir  ""
<<<<<<< HEAD
	Escribir "Comandos:"
	Escribir "  BUSCAR: Busqueda de canciones"
	Escribir "  VOLUMEN: Subir el volumen del reproductor"
	Escribir " 	 APAGAR: Salir del reproductor"
Fin Funcion


Funcion valorSeleccionado <- ingresoValor( )
	Leer valorSeleccionado
=======
	Escribir "---------------------------------" // Separador
	Escribir "Comandos:"
	Escribir "  BUSCAR: Busqueda de canciones"
	Escribir "  LISTA: Muestra lista de canciones"
	Escribir "  PAUSA: pausa o reanuda la canciones"
	Escribir "  VOLUMEN: Subir el volumen del reproductor"
	Escribir " 	 APAGAR: Salir del reproductor"
	Escribir "---------------------------------" // Separador
	Escribir "Ingresa un comando:"
	
>>>>>>> manuel
Fin Funcion

Proceso ReproductorMusica
	
	Definir genero, cancion, artista Como Caracter;
	Definir volumen Como Entero
	Definir continuar Como Logico
	
	genero<- "-"
	cancion<- "-"
	artista <- "-"
<<<<<<< HEAD
	volumen <- 0
	continuar <- Verdadero
	
	
	Repetir
		Inicio(cancion, artista, genero, volumen )
		valorSeleccionado <- ingresoValor( )
		Segun valorSeleccionado Hacer
			"BUSCAR": 
				
=======
	estadoReproduccion <- "Espera..."
	volumen <- 0
	continuar <- Verdadero
	
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
	cancionMusical[16]="yo no se mañana"
	
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
	
	
	
	
	
	Repetir
		Inicio(cancion, artista, genero, volumen, estadoReproduccion )
		Leer valorSeleccionado
		Segun valorSeleccionado Hacer
			"BUSCAR":
				Definir busqueda Como Logico
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
				
				
				Segun tipoBusqueda Hacer
					"1":
						Repetir
							Escribir "--- Lista de Genero Cancion ---"
							Para i = 1 Hasta 16 Con Paso 2 Hacer
								Escribir "*", generoMusical[i]
							Fin Para
							Escribir "--------------------------"
							Escribir "Ingresa el genero que quieres realizar la busqueda"
							Leer  generoSeleccionado
							
							Segun generoSeleccionado Hacer
								"pop","rock","hip hop","electronica","jazz","reggaeton","cumbia","salsa":
									busquedaGenero <- Verdadero
								De Otro Modo:
									busquedaGenero <- Falso
							Fin Segun
						Hasta Que busquedaGenero == Verdadero
						
						
						
						
						Segun Minusculas(generoSeleccionado) Hacer
							"pop":
								
								genero<- generoMusical[1]
								Escribir "--- Lista de Canciones ---"
								Para i = 1 Hasta 2 Hacer
									Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
								Fin Para
								Escribir "--------------------------"
								continuar <- Verdadero
								Esperar Tecla
								Repetir
									// Pide al usuario que ingrese el valor especificado:"base" o "altura".
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									// Llama a la función revisarNumero para validar la entrada.
									esNumero <- revisarNumero(cancionReproducida)
								Hasta Que esNumero == Verdadero
								
								
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
								Esperar Tecla
								Repetir
									// Pide al usuario que ingrese el valor especificado:"base" o "altura".
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									// Llama a la función revisarNumero para validar la entrada.
									esNumero <- revisarNumero(cancionReproducida)
								Hasta Que esNumero == Verdadero
								
								
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
								Esperar Tecla
								Repetir
									// Pide al usuario que ingrese el valor especificado:"base" o "altura".
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									// Llama a la función revisarNumero para validar la entrada.
									esNumero <- revisarNumero(cancionReproducida)
								Hasta Que esNumero == Verdadero
								
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
								Esperar Tecla
								Repetir
									// Pide al usuario que ingrese el valor especificado:"base" o "altura".
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									// Llama a la función revisarNumero para validar la entrada.
									esNumero <- revisarNumero(cancionReproducida)
								Hasta Que esNumero == Verdadero
								
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
								Esperar Tecla
								Repetir
									// Pide al usuario que ingrese el valor especificado:"base" o "altura".
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									// Llama a la función revisarNumero para validar la entrada.
									esNumero <- revisarNumero(cancionReproducida)
								Hasta Que esNumero == Verdadero
								
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
								Esperar Tecla
								Repetir
									// Pide al usuario que ingrese el valor especificado:"base" o "altura".
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									// Llama a la función revisarNumero para validar la entrada.
									esNumero <- revisarNumero(cancionReproducida)
								Hasta Que esNumero == Verdadero
								
								
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
								Esperar Tecla
								Repetir
									// Pide al usuario que ingrese el valor especificado:"base" o "altura".
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									// Llama a la función revisarNumero para validar la entrada.
									esNumero <- revisarNumero(cancionReproducida)
								Hasta Que esNumero == Verdadero
								
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
								Esperar Tecla
								
								Repetir
									// Pide al usuario que ingrese el valor especificado:"base" o "altura".
									Escribir "Ingresa el numero de la cancion que quieres reproducir"
									Leer cancionReproducida // Lee la entrada del usuario
									// Llama a la función revisarNumero para validar la entrada.
									esNumero <- revisarNumero(cancionReproducida)
								Hasta Que esNumero == Verdadero
								
								
								genero<- generoMusical[cancionReproducida]
								cancion<- cancionMusical[cancionReproducida]
								artista <- artistaMusical[cancionReproducida]
								volumen <- 20
								estadoReproduccion <- pausarMusica("Pausado")
								
							De Otro Modo:
								Escribir "No se encuentra valor"
						Fin Segun
						Esperar Tecla
					"2":
						Repetir
							
							Escribir "--- Lista de Artistas  ---"
							Para i <- 1 Hasta 16 Con Paso 1 Hacer
								Escribir "*", artistaMusical[i]
							Fin Para
							Escribir "--------------------------"
							Escribir ""
							Escribir "Ingresa el artista que desea buscar:"
							Leer palabraBuscada
							
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
							Si contador >0 Entonces
								
								artistaBuscado <- Verdadero 
							SiNo
								Escribir "No se encontro artista"
								Esperar 2 Segundos
								artistaBuscado <- Falso 
							Fin Si
						Hasta Que artistaBuscado = Verdadero 
						
						Escribir "--- Lista de Canciones ---"
						Para i = 1 Hasta 1 Hacer
							numeroCancion <- arregloArtistas[i]
							Escribir (numeroCancion), ". ", cancionMusical[numeroCancion]," - ",  artistaMusical[numeroCancion]  
						Fin Para
						Escribir "--------------------------"
						continuar <- Verdadero
						Esperar Tecla
						Repetir
							// Pide al usuario que ingrese el valor especificado:"base" o "altura".
							Escribir "Ingresa el numero de la cancion que quieres reproducir"
							Leer cancionReproducida // Lee la entrada del usuario
							// Llama a la función revisarNumero para validar la entrada.
							esNumero <- revisarNumero(cancionReproducida)
						Hasta Que esNumero == Verdadero
						
						
						genero<- generoMusical[cancionReproducida]
						cancion<- cancionMusical[cancionReproducida]
						artista <- artistaMusical[cancionReproducida]
						volumen <- 20
						estadoReproduccion <- pausarMusica("Pausado")
					"3":
						Escribir "Ingresa la cancion que desea buscar:"
						Leer palabraBuscada
						Dimension arregloMusica[1]
						contador<-0
						Para i <- 1 Hasta 16 Con Paso 1 Hacer
							Si Minusculas(cancionMusical[i]) = Minusculas(palabraBuscada) Entonces
								contador<-contador+1
								arregloMusica[contador] <- i 
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
							// Pide al usuario que ingrese el valor especificado:"base" o "altura".
							Escribir "Ingresa el numero de la cancion que quieres reproducir"
							Leer cancionReproducida // Lee la entrada del usuario
							// Llama a la función revisarNumero para validar la entrada.
							esNumero <- revisarNumero(cancionReproducida)
						Hasta Que esNumero == Verdadero
						
						genero<- generoMusical[cancionReproducida]
						cancion<- cancionMusical[cancionReproducida]
						artista <- artistaMusical[cancionReproducida]
						volumen <- 20
						estadoReproduccion <- pausarMusica("Pausado")
						
					De Otro Modo:
						Escribir "Ingresa un numero correcto"
				Fin Segun
				
				continuar <- Verdadero
			"LISTA": 
				Escribir "--- Lista de Canciones ---"
                Para i = 1 Hasta 16 Hacer
                    Escribir (i), ". ", cancionMusical[i]," - ",  artistaMusical[i]  
                Fin Para
                Escribir "--------------------------"
				continuar <- Verdadero
				Esperar Tecla
				
				Repetir
					// Pide al usuario que ingrese el valor especificado:"base" o "altura".
					Escribir "Ingresa el numero de la cancion que quieres reproducir"
					Leer cancionReproducida // Lee la entrada del usuario
					// Llama a la función revisarNumero para validar la entrada.
					esNumero <- revisarNumero(cancionReproducida)
				Hasta Que esNumero == Verdadero
				
				genero<- generoMusical[cancionReproducida]
				cancion<- cancionMusical[cancionReproducida]
				artista <- artistaMusical[cancionReproducida]
				volumen <- 20
				estadoReproduccion <- pausarMusica("Pausado")
				
			"PAUSA":
				estadoReproduccion <- pausarMusica(estadoReproduccion)
>>>>>>> manuel
				continuar <- Verdadero
			"VOLUMEN":
				volumen <- volumenMusica()
				continuar <- Verdadero
			"APAGAR":
<<<<<<< HEAD
				continuar <- apagarReproductor ()
=======
				continuar <- apagarReproductor()
>>>>>>> manuel
			De Otro Modo:
				continuar <- comandoNoEncontrado()
		Fin Segun
	Hasta Que continuar = Falso
	
FinProceso
	