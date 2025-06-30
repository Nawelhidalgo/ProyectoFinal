from flask import Blueprint, jsonify, request,session
from db.connection import get_db_connection


galeria_bp = Blueprint('api_galeria', __name__, url_prefix='/api')


@galeria_bp.route('/comentarios', methods=['GET'])
def obtener_comentarios_usuario():
    if 'usuario_id' not in session:
        return jsonify({"error": "No autorizado"}), 401

    id_usuario = session['usuario_id']

    try:
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
        return jsonify(comentarios)
    except Exception as e:
        return jsonify({"error": str(e)}), 500