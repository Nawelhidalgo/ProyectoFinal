from flask import Blueprint, request, session, jsonify, redirect, url_for
from db.connection import get_db_connection
from werkzeug.security import check_password_hash

admin_bp = Blueprint('admin', __name__, url_prefix='/admin')

@admin_bp.route('/login', methods=['POST'])
def login_admin():
    data = request.get_json()
    correo = data.get('correo')
    contrasena = data.get('contrasena')

    if not correo or not contrasena:
        return jsonify({"error": "Faltan campos"}), 400

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Admin WHERE Correo = %s", (correo,))
    admin = cursor.fetchone()

    if not admin:
        return jsonify({"error": "Correo no registrado"}), 404

    if not check_password_hash(admin['Contraseña'], contrasena):
        return jsonify({"error": "Contraseña incorrecta"}), 401

    session['admin_id'] = admin['IdAdmin']
    return jsonify({"mensaje": "Login exitoso"}), 200