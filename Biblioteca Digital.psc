Algoritmo GestionBiblioteca
	Definir nombrelibro, autorlibro, solicitante, estado, librobuscado, nombresolicitante Como Texto
	Definir añopublico, opcionmenu, i, librosguardados Como Entero
	Definir libroencontrado Como Logico
	
	i=1
	
	//Indicamos la cantidad maxima de libros que se guardaran en la Biblioteca
	Dimension nombrelibro[5], autorlibro[5], añopublico[5], estado[5], solicitante[5]
	
	librosguardados=1
	
	Repetir
		//Ejecutamos un Menu de Opciones para que el cliente seleccione si va a
		//agregar, buscar, mostrar, pedir o devolver un libro o si este saldra
		//de la Biblioteca
		Escribir "BIENVENIDO A LA BIBLIOTECA"
		Escribir "1. Agregar un Libro"
		Escribir "2. Buscar un Libro"
		Escribir "3. Mostrar todos los Libros"
		Escribir "4. Prestar un Libro"
		Escribir "5. Devolver un Libro"
		Escribir "6. Salir de la Biblioteca"
		
		//Dependiendo la Opcion seleccionada por el cliente, se ejecuta una instruccion
		//u otra
		Escribir "Seleccione una Opcion del Menu"
		Leer opcionmenu
		
		Segun opcionmenu Hacer
			//Al seleccionar la Opcion N°1 el cliente indica el: Titulo, Autor y Año de
			//lanzamiento del libro a agregar y este es almacenado en la Biblioteca
			Caso 1:
				Si librosguardados<5 Entonces
					Escribir "¿Como se llama el titulo del Libro?"
					Leer nombrelibro[librosguardados]
					Escribir "¿Quien es el autor del libro?"
					Leer autorlibro[librosguardados]
					Escribir "¿En que año se publico este libro?"
					Leer añopublico[librosguardados]
					
					estado[librosguardados]="Disponible"
					librosguardados=librosguardados+1
					
					Escribir "Libro guardado"
				SiNo
					Escribir "Biblioteca llena"
				FinSi
				
			Caso 2:
				//Al seleccionar la Opcion N°2 el se consulta al cliente que libro esta
				//buscando segun el titulo por el cual este lo agrego en la Biblioteca
				//inicialmente
				Escribir "¿Que libro esta buscando?"
				Leer librobuscado
				
				libroencontrado=Falso
				
				//Si el libro a buscar esta dentro de la Biblioteca se muestra cual es:
				//su Nombre, su Autor, su Año de Lanzamiento y Estado de Uso
				Para i=1 Hasta librosguardados-1 Con Paso 1 Hacer
					Si nombrelibro[i]=librobuscado Entonces
						Escribir "Nombre: ", nombrelibro[i]
						Escribir "Autor: ", autorlibro[i]
						Escribir "Año de Publicacion: ", añopublico[i]
						Escribir "Estado: ", estado[i]
						
						//Dependiendo el estado de uso del Libro se indica si este fue
						//prestado y a quien fue prestado
						Si estado[i]="Prestado" Entonces
							Escribir "Prestado a: ", solicitante[i]
						FinSi
						
						libroencontrado=Verdadero
					FinSi
				FinPara
				
				Si libroencontrado=Falso Entonces
					Escribir "El libro no se encontro"
				FinSi
				
			Caso 3:
				//Al seleccionar la Opcion N°3 se muestra si hay libros guardados en la
				//Biblioteca mostrando: su Nombre, su Autor, su Año de Lanzamiento y
				//Estado de Uso
				Si librosguardados=0 Entonces
					Escribir "No hay libros guardados en la Biblioteca"
				SiNo
					Escribir "Hay ", librosguardados, " libros guardados"
					Para i=1 Hasta librosguardados-1 Con Paso 1 Hacer
						Escribir nombrelibro[i], " | ", autorlibro[i], " | ", añopublico[i], " | ", estado[i]
					FinPara
				FinSi
				
			Caso 4:
				//Al seleccionar la Opcion N°4 consultamos al cliente que libro va a
				//llevar segun el Nombre por el cual se guardo este Libro inicialmente
				//en la Biblioteca y consultamos el nombre del cliente que lo va a llevar
				Escribir "¿Que Libro va a llevar?"
				Leer librobuscado
				Escribir "Indique su Nombre"
				Leer nombresolicitante
				libroencontrado=Falso
				
				//Si el libro se encuentra disponible en la Biblioteca se indica que este
				//fue prestado y a quien fue prestado
				Para i=1 Hasta librosguardados Con Paso 1 Hacer
					Si nombrelibro[i]=librobuscado Entonces
						libroencontrado=Verdadero
						Si estado[i]="Disponible" Entonces
							estado[i]="Prestado"
							solicitante[i]=nombresolicitante
							Escribir "Libro ", nombrelibro[i], " prestado a ", solicitante[i]
						SiNo
							Escribir "El libro solicitado no se encuentra disponible, se presto a ", solicitante[i]
						FinSi
					FinSi
				FinPara
				
				Si libroencontrado=Falso Entonces
					Escribir "El libro solicitado no se encontro"
				FinSi
				
			Caso 5:
				//Al seleccionar la Opcion N°5 consultamos al cliente que libro va a devolver
				//por el Nombre del cual este lo habia pedido prestado y solicitamos el nombre
				//del cliente el cual pidio ese libro anteriormente
				Escribir "¿Que libros va a devolver?"
				Leer librobuscado
				
				libroencontrado=Falso
				
				//Si el nombre del libro a devolver coincide con el nombre del libro que fue
				//prestado inicialmente esta cambia su estado de uso y se indica quien lo devolvio
				Para i=1 Hasta librosguardados-1 Con Paso 1 Hacer
					Si nombrelibro[i]=librobuscado Entonces
						Si estado[i]="Prestado" Entonces
							libroencontrado=Verdadero
							
							Escribir "Libro devuelto: ", nombrelibro[i]
							Escribir "Estado del Libro: ", estado[i]
							Escribir "Devuelto por: ", solicitante[i]
							estado[i]="Disponible"
							solicitante[i]=" "
						SiNo
							Escribir "El libro esta, pero fue prestado"
						FinSi
					FinSi
				FinPara
				
				Si libroencontrado=Falso Entonces
					Escribir "No se encontro el Libro que fue prestado"
				FinSi
				
			Caso 6:
				//Al seleccionar la Opcion N°6 el cliente abandona la Biblioteca
				Escribir "Saliendo de la Biblioteca"
				
			De Otro Modo:
				Escribir "Opcion Invalida. Seleccione nuevamente"
		FinSegun
	Hasta Que (opcionmenu=6)
FinAlgoritmo