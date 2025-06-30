import os
import uuid
from flask import Blueprint, request, jsonify, session,current_app
from werkzeug.utils import secure_filename
from db.connection import get_db_connection
from datetime import datetime

home_bp = Blueprint('api_home', __name__)
UPLOAD_SUBFOLDER = 'Imagenes/img_PlantasUsuario' 

@home_bp.route("/obtener_plantas", methods=["GET"])
def obtener_plantas():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT IdPlanta, Nombre FROM Plantas")
    plantas = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(plantas)

@home_bp.route('/agregar_planta', methods=['POST'])
def agregar_planta():
    if 'usuario_id' not in session:
        return jsonify({"error": "Usuario no autenticado"}), 401

    id_usuario = session['usuario_id']
    nombre = request.form.get('nombre')
    id_planta = request.form.get('idPlanta')
    archivo = request.files.get('foto')

    if not all([id_planta, nombre, archivo]):
        return jsonify({"error": "Faltan datos"}), 400

    nombre_archivo = secure_filename(archivo.filename)
    nombre_aleatorio = f"{uuid.uuid4().hex}_{nombre_archivo}"

    carpeta_static = os.path.join(current_app.root_path, 'static', UPLOAD_SUBFOLDER)

    if not os.path.exists(carpeta_static):
        os.makedirs(carpeta_static)

    ruta_guardado = os.path.join(carpeta_static, nombre_aleatorio)
    archivo.save(ruta_guardado)

    ruta_db = f"/static/{UPLOAD_SUBFOLDER}/{nombre_aleatorio}"

    fecha_actual = datetime.now()

    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO PlantaUsuarios (IdPlanta, IdUsuario, Foto, Nombre, FechaCreacion)
            VALUES (%s, %s, %s, %s, %s)
        """, (id_planta, id_usuario, ruta_db, nombre, fecha_actual))
        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({"mensaje": "Planta agregada correctamente", "ruta": ruta_db, "nombre": nombre})
    except Exception as e:
        print("Error al guardar en DB:", e)
        return jsonify({"error": "Error en el servidor"}), 500
    

@home_bp.route('/obtener_plantas_usuario', methods=['GET'])
def obtener_plantas_usuario():
    try:
        if 'usuario_id' not in session:
            return jsonify({"error": "Usuario no autenticado"}), 401

        id_usuario = session['usuario_id']
        orden = request.args.get('orden', 'fecha_desc')

        if orden == 'fecha_asc':
            orden_sql = 'FechaCreacion ASC'
        else:
            orden_sql = 'FechaCreacion DESC'

        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(f"""
            SELECT IdPlanta, Foto, Nombre, FechaCreacion
            FROM PlantaUsuarios
            WHERE IdUsuario = %s
            ORDER BY {orden_sql}
        """, (id_usuario,))
        plantas_usuario = cursor.fetchall()
        cursor.close()
        conn.close()

        return jsonify(plantas_usuario)
    except Exception as e:
        print("Error al obtener plantas del usuario:", e)
        return jsonify({"error": "Error al cargar las plantas"}), 500