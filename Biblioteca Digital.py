#Importamos un JSON que guarda los Libros agregados en la Biblioteca
import json

#Abre el archivo JSON para escribir los datos correspondientes al guardar Libros
try:
    with open("libro.json", "r", encoding="utf-8") as f:
        libroguardados=json.load(f)
except FileNotFoundError:
    libroguardados=[]

#Indicamos que los Libros se guardaran en una Lista
libroencontrado=False

#Se crea un Menu de Opciones
while(True):
    print("BIENVENIDO A LA BIBLIOTECA DIGITAL")
    print("1. Agregar un Nuevo Libro")
    print("2. Buscar un Libro dentro de la Biblioteca")
    print("3. Mostrar todos los Libros guardados en la Biblioteca")
    print("4. Pedir prestado un Libro de la Biblioteca")
    print("5. Devoler un Libro prestado")
    print("6. Salir de la Biblioteca Digital")

    #El usuario selecciona una opcion del Menu para operar en la Biblioteca
    opcionmenu=int(input("Seleccione una opcion del menu de la Biblioteca: "))

    #Dependiendo la Opcion seleccionada por el usuario se ejecuta una operacion
    match opcionmenu:

        #Al seleccionar la Opcion N°1 el cliente agregara un nuevo libro en
        #la biblioteca en caso de que este vacia, sino simplemente indicamos
        #que la biblioteca esta llena
        case 1:
            if len(libroguardados)<10:
                libro={
                    "Nombre del Libro": input("Indique el Nombre del Libro: "),
                    "Autor del Libro": input("¿Quien es el Autor del Libro?: "),
                    "Año de Lanzamiento": int(input("¿Cuando fue lanzado este Libro?: ")),
                    "Estado de Disponibilidad": input("Indique el estado de Disponibilidad del Libro: ")
                }

                libroguardados.append(libro)
                print("El Libro fue guardado correctamente")
            else:
                print("La Biblioteca supera la maxima cantidad de Libros guardados")

        #Al seleccionar la Opcion N°2 el cliente buscara un libro guardado
        #en la biblioteca segun el nombre por el cual el libro fue guardado
        #inicialmente
        case 2:
            librobuscado=input("¿Como se llama el Libro que busca?: ")

            libroencontrado=False

            for libro in libroguardados:
                if libro["Nombre del Libro"]==librobuscado:
                    libroencontrado=True

                    print("Libro encontrado")
                    print(f"Nombre del Libro: {libro['Nombre del Libro']}")
                    print(f"Autor: {libro['Autor del Libro']}")
                    print(f"Año de Lanzamiento: {libro['Año de Lanzamiento']}")
                    print(f"Estado de Disponibilidad del Libro: {libro['Estado de Disponibilidad']}")
                    break
                else:
                    print("El Libro que busca esta, pero fue prestado")
            else:
                print("El Libro que busca no se encuentra dentro de la Biblioteca")

        #Al seleccionar la Opcion N°3 se le muestra al cliente todos los
        #libros que han sido guardados en la Biblioteca
        case 3:
            if len(libroguardados)==0:
                print("No hay Libros guardados dentro de la Biblioteca")
            else:
                for i, libro in enumerate(libroguardados, 1):
                    print(f"Libros guardados dentro de la Biblioteca: {i}")
                    print(f"Nombre del Libro | Autor del Libro | Año de Lanzamiento | Estado de Disponibilidad")
                    print(f"{libro['Nombre del Libro']} | {libro['Autor del Libro']} | {libro['Año de Lanzamiento']} | {libro['Estado de Disponibilidad']}")
                    break

        #Al seleccionar la Opcion N°4 el cliente podra pedir un libro
        #prestado de la Bilioteca segun el nombre por el cual este se
        #agrego en la Biblioteca inicialmente
        case 4:
            librobuscado=input("¿Cual es el Libro que quiere pedir prestado?")

            libroencontrado=False

            for libro in libroguardados:
                if librobuscado==libro["Nombre del Libro"]:
                    libroencontrado=True

                    if libro["Estado de Disponibilidad"]=="Disponible":
                        libro["Estado de Disponibilidad"]="Prestado"

                        nombrecliente=input("Indique su Nombre: ")

                        print(f"El libro {libro['Nombre del Libro']} se ha prestado a {nombrecliente}")
                        break
                else:
                    print("El Libro que quiere pedir prestado si esta en la Biblioteca, pero fue prestado")

        #Al seleccionar la Opcion N°5 el cliente podra devolver un libro
        #que pidio prestado por el nombre de dicho libro y este debe coincidir
        #con el nombre por el cual se agrego inicialmente en la Biblioteca
        case 5:
            librobuscado=input("¿Como se llama el Libro que va a devolver?: ")

            libroencontrado=False

            for libro in libroguardados:
                if libro["Nombre del Libro"]==librobuscado:
                    libroencontrado=True

                    if libro["Estado de Disponibilidad"]=="Prestado":
                        libro["Estado de Disponibilidad"]="Disponible"

                        print(f"Nombre del Libro: {libro['Nombre del Libro']}")
                        print(f"Devuelto por: {nombrecliente}")
                        print("Gracias por haber devuelto el Libro")
                        break

        #Al seleccionar la Opcion N°6 el cliente abandona la Biblioteca
        case 6:
            #Al finalizar el programa, los datos correspondientes a los Libros agregados se guardan en el JSON manteniendo estructura
            with open("libro.json", "w", encoding="utf-8") as f:
                json.dump(libroguardados, f, ensure_ascii=False, indent=4)
            print("Saliendo de la Biblioteca Digital")
            break