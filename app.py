from flask import Flask
from config import Config
from flask_bcrypt import Bcrypt
from routes.api_usuarios import api_usuarios_bp
from routes.galeria import galeria_bp
from routes.home import home_bp
from routes.detalle import detalle_bp
from flask import Flask,render_template,redirect
import os
from flask_cors import CORS
from routes.login_admin import admin_bp


app = Flask(__name__, static_folder='static')
app.config.from_object(Config)
bcrypt = Bcrypt(app)
app.secret_key = "7f2e9d4cfa1b3e1a98b2cbe5a1a44ff9c7d8a1"
CORS(app, supports_credentials=True)

@app.route("/")
def inicio():
    from flask import session
    if 'usuario_id' in session:
        return redirect("/home")
    return redirect("/login")


@app.route("/login")
def login():
    return render_template("login.html")


@app.route("/register")
def register():
    return render_template("crearUsuario.html")


@app.route("/home")
def home():
    from flask import session
    if 'usuario_id' not in session:
        return redirect("/login")
    return render_template("home.html")

@app.route("/detalle")
def detalle():
    from flask import session
    if 'usuario_id' not in session:
        return redirect("/login")
    return render_template("detallePlanta.html")


@app.route("/galeria")
def galeria():
    from flask import session
    if 'usuario_id' not in session:
        return redirect("/login")
    return render_template("galeria.html")

@app.route("/admin/login")
def mostrar_login_admin():
    return render_template('loginAdmin.html')

@app.route("/admin/panel")
def admin_panel():
    from flask import session
    if 'admin_id' not in session:
        return redirect("/admin/login")
    return render_template("admin.html")

app.register_blueprint(api_usuarios_bp, url_prefix="/api/usuarios")
app.register_blueprint(home_bp, url_prefix="/api/home")
app.register_blueprint(detalle_bp, url_prefix='/api/detalles')
app.register_blueprint(galeria_bp, url_prefix='/api/galeria')
app.register_blueprint(admin_bp, url_prefix="/admin")

if __name__ == "__main__":
    app.run(debug=True)