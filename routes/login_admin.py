from flask import Blueprint, request, session, jsonify, redirect, url_for
from db.connection import get_db_connection
from werkzeug.security import check_password_hash

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