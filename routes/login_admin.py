from flask import Blueprint, request, session, jsonify, redirect, url_for
from db.connection import get_db_connection
from werkzeug.security import check_password_hash
from routes.funcionesAdmin import obtener_todos_los_usuarios
from routes.funcionesAdmin import obtener_plantas

admin_bp = Blueprint('admin', __name__,)

@admin_bp.route('/login', methods=['POST'])
def login_admin():
    data = request.get_json()
    correo = data.get('Email')
    contrasena = data.get('contrasena')

    if not correo or not contrasena:
        return jsonify({"error": "Faltan campos"}), 400

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Administrador WHERE Email = %s", (correo,))
    admin = cursor.fetchone()

    if not admin:
        return jsonify({"error": "Correo no registrado"}), 404

    if not check_password_hash(admin['contrasena'], contrasena):
        return jsonify({"error": "Contraseña incorrecta"}), 401

    session['admin_id'] = admin['IdAdmin']
    return jsonify({"mensaje": "Login exitoso"}), 200

@admin_bp.route('/usuarios', methods=['GET'])
def listar_usuarios():
    if 'admin_id' not in session:
        return redirect('/admin/login')
    usuarios = obtener_todos_los_usuarios()
    return jsonify(usuarios)

@admin_bp.route('/plantas', methods=['GET'])
def listar_plantas():
    try:
        plantas = obtener_plantas()
        return jsonify(plantas)
    except Exception as e:
        print("Error al obtener plantas:", e)
        return jsonify({"error": "No se pudieron obtener las plantas"}), 500
