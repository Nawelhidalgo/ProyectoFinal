from flask import Blueprint, jsonify, request,session,current_app
from db.connection import get_db_connection
import os
import uuid
from datetime import datetime
from werkzeug.utils import secure_filename


detalle_bp = Blueprint('api_detalles', __name__, url_prefix='/api')

@detalle_bp.route('/planta/<id_planta>', methods=['GET'])
def get_planta(id_planta):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT Foto, Descripcion, Nombre FROM Plantas WHERE IdPlanta = %s", (id_planta,))
    planta = cursor.fetchone()
    cursor.close()
    conn.close()

    if planta:
        return jsonify(planta)
    else:
        return jsonify({"error": "Planta no encontrada"}), 404
    
@detalle_bp.route('/ciclo/<id_planta>', methods=['GET'])
def api_ciclo_planta(id_planta):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT e.NombreEtapa, cp.Duracion, cp.Descripcion, cp.Estacion
        FROM CiclosPlantas cp
        JOIN Etapas e ON cp.IdEtapa = e.IdEtapa
        WHERE cp.IdPlanta = %s
        ORDER BY cp.IdEtapa
    """, (id_planta,))
    etapas = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(etapas)

@detalle_bp.route('/cuidados/<idPlanta>')
def obtener_cuidados(idPlanta):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT Sustrato, Riego, Luz, Temperatura, Fertilizacion, Mantenimiento, Conservacion, Semillas
        FROM Plantas
        WHERE IdPlanta = %s
    """, (idPlanta,))
    cuidados = cursor.fetchone()

    conn.close()
    return jsonify(cuidados)

@detalle_bp.route('/comentariousuario', methods=['POST'])
def comentariousuario():
    if 'usuario_id' not in session:
        return jsonify({"error": "No autorizado"}), 401

    id_usuario = session['usuario_id']
    id_planta = request.form.get('idPlanta')
    comentario = request.form.get('comentario')
    fecha = datetime.now()

    if not id_planta or not comentario:
        return jsonify({"error": "Datos incompletos"}), 400

    ruta_foto_relativa = None
    foto = request.files.get('foto')

    if foto:
        extension = os.path.splitext(foto.filename)[1]
        nombre_archivo = f"{uuid.uuid4().hex}{extension}"

        # Usar current_app.root_path para la ruta absoluta
        upload_folder_abs = os.path.join(current_app.root_path, 'static', 'imagenes_comentarios')
        os.makedirs(upload_folder_abs, exist_ok=True)

        ruta_foto_absoluta = os.path.join(upload_folder_abs, nombre_archivo)
        foto.save(ruta_foto_absoluta)

        # Esta es la ruta que guardarás en la base para usar como src en HTML
        ruta_foto_relativa = f"/static/imagenes_comentarios/{nombre_archivo}"

    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO ComentarioUsuario (IdPlanta, IdUsuario, Fecha, Foto, Texto)
            VALUES (%s, %s, %s, %s, %s)
        """, (id_planta, id_usuario, fecha, ruta_foto_relativa, comentario))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"success": True})
    except Exception as e:
        return jsonify({"error": str(e)}), 500