from app import app
from db.connection import get_db_connection
from werkzeug.security import generate_password_hash

def crear_admin():
    with app.app_context():
      nombre = input("Nombre del administrador: ")
      correo = input("Correo electrónico: ")
      contrasena = input("Contraseña: ")

      contrasena_hash = generate_password_hash(contrasena)

      conn = get_db_connection()
      cursor = conn.cursor()

      try:
        cursor.execute("""
            INSERT INTO Administrador (Nombre, Email, contrasena)
            VALUES (%s, %s, %s)
        """, (nombre, correo, contrasena_hash))
        conn.commit()
        print("✅ Admin creado con éxito.")
      except Exception as e:
        print("❌ Error al crear el admin:", e)
      finally:
        cursor.close()
        conn.close()

def listar_admins():
    with app.app_context():
      conn = get_db_connection()
      cursor = conn.cursor(dictionary=True)
      cursor.execute("SELECT IdAdmin, Nombre, Email FROM Administrador")
      admins = cursor.fetchall()
      cursor.close()
      conn.close()

      if admins:
        print("\nAdmins registrados:")
        for admin in admins:
            print(f"ID: {admin['IdAdmin']}, Nombre: {admin['Nombre']}, Correo: {admin['Email']}")
      else:
        print("No hay admins registrados.")

def borrar_admin():
    with app.app_context():
     listar_admins()
     id_borrar = input("Ingresá el ID del admin a borrar: ")
     conn = get_db_connection()
     cursor = conn.cursor()
     try:
         cursor.execute("DELETE FROM Administrador WHERE IdAdmin = %s", (id_borrar,))
         if cursor.rowcount == 0:
            print("No se encontró admin con ese ID.")
         else:
            conn.commit()
            print("✅ Admin borrado.")
     except Exception as e:
        print("❌ Error al borrar admin:", e)
     finally:
        cursor.close()
        conn.close()

def menu():
    while True:
        print("""
        ==== ADMIN CONSOLE ====
        1) Crear admin
        2) Listar admins
        3) Borrar admin
        4) Salir
        """)
        opcion = input("Elegí una opción: ")

        if opcion == "1":
            crear_admin()
        elif opcion == "2":
            listar_admins()
        elif opcion == "3":
            borrar_admin()
        elif opcion == "4":
            print("Saliendo...")
            break
        else:
            print("Opción inválida, probá de nuevo.")

if __name__ == "__main__":
    menu()