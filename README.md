## Proyecto Lotus - Aplicación Web de Plantas

📄 Descripción

Lotus es una aplicación web que permite a los usuarios:

 .Registrarse e iniciar sesión.

 .Subir una foto de perfil.

 .Agregar plantas con una imagen personalizada.

 .Visualizar las plantas que tiene registradas.

Todo esto se guarda y gestiona en una base de datos MySQL.

## Ejecución del Proyecto

1. Editar config.py con los datos de tu conexión local.

2. Crear y poblar la base de datos
   Ejecutá el script cargar_base_datos.py para crear automáticamente las tablas e insertar los datos iniciales:
   python cargar_base_datos.py

3. Ejecutar la app:
     python app.py

4. Abrir en el navegador:http://localhost:5000/login

##  Descripción de Archivos Clave

# app.py

 .Inicia la aplicación Flask.

 .Registra los blueprints para separar lógicas (api_usuarios y home).

 .Usa CORS para permitir sesiones entre frontend y backend.

 .Sirve archivos HTML desde /templates para navegadores.

 .Contiene la clave secreta para sesiones y configuración


# config.py

  .Guarda configuración como datos de conexión MySQL.

# db/connection.py

 .Contiene la función get_db_connection() que abre una conexión a la base de datos.

 .Usa los valores definidos en config.py a través de current_app.config. 



# routes/api_usuarios.py

Este archivo contiene las rutas relacionadas con el usuario:

- **@api_usuarios_bp.route("/register", methods=["POST"])**

  .Registra un nuevo usuario en la base de datos.

  .Valida que no exista el mail.

  .Encripta la contraseña con bcrypt.

  .Guarda nombre, mail, contraseña hasheada y foto.



- **@api_usuarios_bp.route("/login", methods=["POST"])**

  .Verifica las credenciales y guarda información del usuario en session.

  .Guarda también usuario_id, nombre, mail y foto para usar en otras rutas.


- **@api_usuarios_bp.route("/usuario_actual", methods=["GET"])**

  .Devuelve la info del usuario actualmente logueado (extraída de la sesión).

  .Se utiliza en frontend para mostrar nombre y foto.


- **@api_usuarios_bp.route("/upload_foto", methods=["POST"])**

  .Guarda una imagen de perfil en la carpeta correspondiente y devuelve su ruta.

  .Le agrega un nombre aleatorio con uuid para evitar colisiones de nombres.

  .Es utilizada durante el registro de usuario para que la foto quede lista antes de enviar el formulario.

- **@api_usuarios_bp.route("/logout", methods=["POST"])** 
  - Elimina la sesión activa (`session.clear()`).
  - Se usa para cerrar la sesión del usuario desde el frontend.

# routes/home.py
 
Este archivo contiene rutas relacionadas con las plantas del usuario:

-  **@home_bp.route("/obtener_plantas", methods=["GET"])**

  .Devuelve los tipos de planta disponibles desde la tabla Plantas.

  .Sirve para poblar el selector en el formulario de agregar planta.

-  **@home_bp.route("/agregar_planta", methods=["POST"])**

  .Permite al usuario subir una planta personalizada (nombre + imagen).

  .Verifica si el usuario está logueado mediante la sesión (session['usuario_id']).

  .Guarda la imagen con un nombre aleatorio generado con uuid.

  .Guarda los datos en la tabla PlantaUsuarios.

  .Devuelve un mensaje de éxito con la ruta de imagen y nombre ingresado.

- **@home_bp.route("/obtener_plantas_usuario", methods=["GET"])**

  .Devuelve las plantas registradas por el usuario autenticado (filtrando por IdUsuario).
 
  .Usa session['usuario_id'] para identificar al usuario.

  .Se utiliza para mostrar las plantas personalizadas en el home.
  
  .Soporta ordenamiento por fecha de creación a través del parámetro `orden` (`fecha_desc` o `fecha_asc`).



# JavaScript

- **usuarios.js**

  Este archivo JavaScript gestiona el proceso de registro y login de usuarios, incluyendo la subida de la foto de perfil.

  - Subida de foto (previa al registro):
    .Escucha el evento change del input de tipo file.

    .Usa FormData para enviar la imagen a /api/usuarios/upload_foto.

    .Al subir correctamente, guarda la ruta devuelta (rutaFotoSubida) y actualiza la imagen de preview (preview.src).

    .Si ocurre un error, muestra una alerta con el mensaje.

  -  Registro de usuario:

     .Captura el envío del formulario de creación (crear-usuario-form).

     .Valida que todos los campos estén completos, incluyendo la foto ya subida.

     .Envía un POST a /api/usuarios/register con los datos del usuario y la ruta de la foto.

     .Si el registro es exitoso:

       .Muestra una alerta.

       .Limpia el formulario.

       .Restaura la imagen por defecto (default-profile.png).

       .Redirige al usuario a /login.

  - Inicio de sesión:

     .Captura el envío del formulario de login (login-form), si existe en la página.

     .Envía un POST a /api/usuarios/login con mail y contraseña.

     .Si las credenciales son válidas:

       .Muestra una alerta de éxito.

       .Redirige al usuario a la página /home.

     .Si hay error (credenciales inválidas o servidor), lo muestra en una alerta.    
     
- **home.js**

 - Carga inicial:

  .Obtiene vía fetch la lista de tipos de plantas disponibles (/api/home/obtener_plantas) para llenar el selector del formulario.

  .Carga y muestra las plantas personalizadas del usuario desde /api/home/obtener_plantas_usuario, con ordenamiento por fecha (ascendente o descendente).

 - Formulario para agregar planta:

  .Muestra/oculta el formulario de agregar planta al hacer clic en el botón "+".

  .Valida que se completen todos los campos: nombre, foto y tipo de planta.

  .Envía la imagen y datos del formulario como FormData vía fetch POST a /api/home/agregar_planta.

  .Actualiza la lista de plantas del usuario dinámicamente tras el agregado exitoso.

 - Interactividad:

  .Permite cerrar el formulario haciendo clic fuera del mismo.

  .Escucha cambios en el selector de orden para recargar la lista con el orden seleccionado.

  - Estructura DOM:

  .Inserta dinámicamente elementos <a> con clase linkPlanta, que contienen la imagen y nombre de cada planta del usuario, dentro del contenedor principal.

- **infoUsuario.js**

 Este archivo JavaScript se encarga de:

 - Mostrar datos del usuario logueado en la interfaz:

   .Al cargar la página, hace un fetch a /api/usuarios/usuario_actual para obtener la información del usuario en sesión.

   .Si el usuario está logueado, muestra su nombre y foto en los elementos con id nombre-usuario y foto-usuario.

   .Si no hay sesión activa, muestra una alerta y redirige a la página /home (login).

 - Manejo del menú de logout:

   .Controla la apertura y cierre del menú de logout al hacer clic en el div Usuario.

   .Cierra el menú si se hace clic fuera del área.

   .Cuando se clickea en el botón de logout (menu-logout), envía un POST a /api/usuarios/logout para cerrar sesión.

   .Si el logout es exitoso, redirige a la página /login.

   .Si falla, muestra alertas de error o fallo de red.

# 🔐 Seguridad

 - Las contraseñas de los usuarios se encriptan usando `bcrypt` antes de guardarse en la base de datos. Esto asegura que no se almacenan en texto plano y no puedan ser leídas ni por el administrador de la base.
 - Para la autenticación se usan sesiones (`Flask session`), lo que permite mantener al usuario logueado de forma segura a través de cookies.
 - Se genera una `secret_key` en el backend para firmar las cookies de sesión y evitar manipulaciones.
 - Las imágenes subidas (ya sea de perfil o de plantas) se renombran con un identificador aleatorio (`uuid`) para evitar sobreescritura de archivos o conflictos entre usuarios.

## HTMLs

- **login.html, crearUsuario.html**

 .Formularios de login y registro.
 .Incluyen campos básicos y subida de imagen.

- **home.html**

 .Pantalla principal donde se ven las plantas y se agregan nuevas.
 .Usa home.js para manejar interactividad.

- **detallePlanta.html, galeria.html**

 .Páginas adicionales para navegación entre plantas.
 .En desarrollo (dependiendo de implementación final).

## Base de Datos

 . db_lotus_createTable.sql: crea todas las tablas necesarias.

 . db_lotus_insert.sql: agrega datos base (plantas, etc.).
 .

 . DER.png: muestra el modelo Entidad-Relación de toda la estructura.