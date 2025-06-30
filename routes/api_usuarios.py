import os
from flask import session
import uuid
from flask import Blueprint, request, jsonify
from werkzeug.utils import secure_filename
from flask_bcrypt import Bcrypt
from db.connection import get_db_connection

api_usuarios_bp = Blueprint('api_usuarios', __name__)
bcrypt = Bcrypt()

RUTA_RELATIVA = 'static/Imagenes/img_perfil'

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
UPLOAD_FOLDER = os.path.join(BASE_DIR, '..', RUTA_RELATIVA)
os.makedirs(UPLOAD_FOLDER, exist_ok=True) 

@api_usuarios_bp.route("/upload_foto", methods=["POST"])
def upload_foto():
    if 'foto' not in request.files:
        return jsonify({'error': 'No se envió ninguna imagen'}), 400
    
    archivo = request.files['foto']
    if archivo.filename == '':
        return jsonify({'error': 'Nombre de archivo vacío'}), 400
    
    extension = os.path.splitext(secure_filename(archivo.filename))[1]
    nombre_archivo = f"{uuid.uuid4().hex}{extension}"
    ruta_completa = os.path.join(UPLOAD_FOLDER, nombre_archivo)

    try:
        archivo.save(ruta_completa)
        ruta_relativa = os.path.join('/', RUTA_RELATIVA, nombre_archivo).replace("\\", "/")
        return jsonify({'ruta': ruta_relativa})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@api_usuarios_bp.route("/logout", methods=["POST"])
def logout():
    session.clear()
    return jsonify({"mensaje": "Sesión cerrada correctamente"}), 200

@api_usuarios_bp.route("/usuario_actual", methods=["GET"])
def obtener_usuario_actual():
    if 'usuario_id' not in session:
        return jsonify({"error": "No hay sesión activa"}), 401

    return jsonify({
        "id": session['usuario_id'],
        "nombre": session['nombre'],
        "mail": session['mail'],
        "foto": session['foto']
    }), 200


@api_usuarios_bp.route("/register", methods=["POST"])
def registrar_usuario():
    data = request.get_json()
    mail = data.get("mail")
    contrasena = data.get("contrasena")
    nombre_usuario = data.get("nombreusuario")
    foto_usuario = data.get("fotousuario")

    if not mail or not contrasena or not nombre_usuario:
        return jsonify({"error": "Faltan campos obligatorios"}), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Usuarios WHERE Mail = %s", (mail,))
        if cursor.fetchone() is not None:
            return jsonify({"error": "El correo ya está registrado"}), 409

        contrasena_hash = bcrypt.generate_password_hash(contrasena).decode('utf-8')

        cursor.execute(
            "INSERT INTO Usuarios (Mail, Contrasena, NombreUsuario, FotoUsuario) VALUES (%s, %s, %s, %s)",
            (mail, contrasena_hash, nombre_usuario, foto_usuario)
        )
        conn.commit()
        return jsonify({"mensaje": "Usuario registrado correctamente"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        conn.close()

@api_usuarios_bp.route("/login", methods=["POST"])
def login_usuario():
    data = request.get_json()
    mail = data.get("mail")
    contrasena = data.get("contrasena")

    if not mail or not contrasena:
        return jsonify({"error": "Faltan el mail o la contraseña"}), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Usuarios WHERE Mail = %s", (mail,))
        usuario = cursor.fetchone()

        if not usuario:
            return jsonify({"error": "El correo no está registrado"}), 404

        if not bcrypt.check_password_hash(usuario["Contrasena"], contrasena):
            return jsonify({"error": "Contraseña incorrecta"}), 401

        session['usuario_id'] = usuario["IdUsuario"]
        session['nombre'] = usuario["NombreUsuario"]
        session['mail'] = usuario["Mail"]
        session['foto'] = usuario["FotoUsuario"]
        return jsonify({"mensaje": "Login exitoso"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        conn.close()

