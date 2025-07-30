Funcion valorReproductor <- comandoNoEncontrado()
	Escribir "Comando no encontrado, favor de colocar uno correcto"
	Esperar 3 Segundos
	Limpiar Pantalla
	valorReproductor <- Verdadero
Fin Funcion

Funcion valorReproductor <- apagarReproductor ( )
	Escribir "Reproductor apagandose ..."
	Esperar 5 Segundos
	Escribir "Hasta luego."
	Esperar 2 Segundos
	valorReproductor <- Falso
Fin Funcion

Funcion valorMusica <- busquedaMusica ()
	
	valorMusica <- "sin nombre"
Fin Funcion
// Función para verificar si una cadena de texto representa un número válido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	Definir valorE Como Entero // Variable para almacenar la longitud del valor escrito
	valorE <- Longitud(valorEscrito)
	
	esNumero <- Verdadero // Asume que la cadena es un número hasta que se demuestre lo contrario.
	contador <- 0// Contador para llevar el control de los puntos decimales.
	
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
				Esperar 3 Segundos
				esVolumenCorrecto <- Verdadero
			SiNo
				Escribir "Ingrese un valor correcto"
				Esperar 3 Segundos
				esVolumenCorrecto <- Falso
				
			Fin Si
		SiNo
			Escribir "Ingrese un valor correcto"
			Esperar 3 Segundos
			esVolumenCorrecto <- Falso
			
		Fin Si
				
	Hasta Que esVolumenCorrecto = Verdadero
	valorVolumen <- ConvertirANumero(ingresaValor)
Fin Funcion

Funcion Inicio(cancion, artista, genero, volumen )
	Escribir "*********************************"
	Escribir "     Reproductor De Musica"
	Escribir "*********************************"
	
	Escribir "     Cancion: ",cancion
	Escribir "     Artista: ",artista
	Escribir "     Genero: ",genero
	Escribir  ""
	Escribir "     Volumen:", volumen
	Escribir "      "Sin Saltar
	Si volumen = 0 Entonces
		Escribir  " "
	SiNo
		Para i <- 1 Hasta volumen Hacer
			Escribir "=" Sin Saltar
		Fin Para
	Fin Si
	
	Escribir  ""
	Escribir "Comandos:"
	Escribir "  BUSCAR: Busqueda de canciones"
	Escribir "  VOLUMEN: Subir el volumen del reproductor"
	Escribir " 	 APAGAR: Salir del reproductor"
Fin Funcion


Funcion valorSeleccionado <- ingresoValor( )
	Leer valorSeleccionado
Fin Funcion

Proceso ReproductorMusica
	
	Definir genero, cancion, artista Como Caracter;
	Definir volumen Como Entero
	Definir continuar Como Logico
	
	genero<- "-"
	cancion<- "-"
	artista <- "-"
	volumen <- 0
	continuar <- Verdadero
	
	Repetir
		Inicio(cancion, artista, genero, volumen )
		valorSeleccionado <- ingresoValor( )
		Segun valorSeleccionado Hacer
			"BUSCAR": 
				
				continuar <- Verdadero
			"VOLUMEN":
				volumen <- volumenMusica()
				continuar <- Verdadero
			"APAGAR":
				continuar <- apagarReproductor ()
			De Otro Modo:
				continuar <- comandoNoEncontrado()
		Fin Segun
	Hasta Que continuar = Falso
	
FinProceso
	