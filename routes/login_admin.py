from flask import Blueprint, request, session, jsonify, redirect, url_for
from db.connection import get_db_connection
from werkzeug.security import check_password_hash
from routes.funcionesAdmin import obtener_todos_los_usuarios, obtener_plantas, obtener_comentarios_por_usuario


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
    if 'admin_id' not in session:
        return redirect('/admin/login')
    try:
        plantas = obtener_plantas()
        return jsonify(plantas)
    except Exception as e:
        print("Error al obtener plantas:", e)
        return jsonify({"error": "No se pudieron obtener las plantas"}), 500

@admin_bp.route('/comentarios_usuario/<int:id_usuario>', methods=['GET'])
def comentarios_usuario(id_usuario):
    if 'admin_id' not in session:
        return redirect('/admin/login')
    try:
        comentarios = obtener_comentarios_por_usuario(id_usuario)
        return jsonify(comentarios), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@admin_bp.route('/desactivar_planta', methods=['POST'])
def desactivar_planta():
    if 'admin_id' not in session:
        return jsonify({"error": "No autorizado"}), 401

    data = request.get_json()
    id_planta = data.get('IdPlanta')

    if not id_planta:
        return jsonify({'success': False, 'error': 'Falta IdPlanta'}), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("UPDATE Plantas SET Activo = 0 WHERE IdPlanta = %s", (id_planta,))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'success': True})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@admin_bp.route('/activar_planta', methods=['POST'])
def activar_planta():
    if 'admin_id' not in session:
        return jsonify({"error": "No autorizado"}), 401

    data = request.get_json()
    id_planta = data.get('IdPlanta')

    if not id_planta:
        return jsonify({'success': False, 'error': 'Falta IdPlanta'}), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("UPDATE Plantas SET Activo = 1 WHERE IdPlanta = %s", (id_planta,))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'success': True})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500