from db.connection import get_db_connection

def obtener_todos_los_usuarios():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT IdUsuario, NombreUsuario, Mail, FotoUsuario FROM Usuarios")
    usuarios = cursor.fetchall()
    conn.close()
    return usuarios

def obtener_plantas():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT IdPlanta, Nombre, Foto, Activo FROM Plantas") 
    plantas = cursor.fetchall()
    cursor.close()
    conn.close()
    return plantas

def cambiar_estado_planta(id_planta, estado):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE Plantas SET Activo = %s WHERE IdPlanta = %s", (estado, id_planta))
    conn.commit()
    cursor.close()
    conn.close()

def obtener_comentarios_por_usuario(id_usuario):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT cu.Foto, cu.Texto AS comentario, cu.Fecha, p.Nombre
        FROM ComentarioUsuario cu
        JOIN Plantas p ON cu.IdPlanta = p.IdPlanta
        WHERE cu.IdUsuario = %s
        ORDER BY cu.Fecha DESC
    """, (id_usuario,))
    comentarios = cursor.fetchall()
    cursor.close()
    conn.close()
    return comentarios
