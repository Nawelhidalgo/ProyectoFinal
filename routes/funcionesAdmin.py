from db.connection import get_db_connection

def obtener_todos_los_usuarios():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT IdUsuario, NombreUsuario, Mail, FotoUsuario FROM Usuarios")
    usuarios = cursor.fetchall()
    conn.close()
    return usuarios
