document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("crear-usuario-form");
  const inputFoto = document.getElementById("foto");
  const preview = document.getElementById("preview-foto");
  let rutaFotoSubida = "";

  inputFoto.addEventListener("change", async () => {
    const archivo = inputFoto.files[0];
    if (!archivo) return;

    const formData = new FormData();
    formData.append("foto", archivo);

    const res = await fetch("/api/usuarios/upload_foto", {
      method: "POST",
      body: formData
    });
    const data = await res.json();

    if (res.ok) {
      rutaFotoSubida = data.ruta;
      preview.src = rutaFotoSubida;
    } else {
      alert("Error al subir imagen: " + data.error);
    }
  });


  form.addEventListener("submit", async (e) => {
    e.preventDefault();

    const nombreUsuario = document.getElementById("username").value.trim();
    const mail = document.getElementById("email").value.trim();
    const contrasena = document.getElementById("password").value;

    if (!nombreUsuario || !mail || !contrasena || !rutaFotoSubida) {
      alert("Por favor, completá todos los campos y subí una foto");
      return;
    }

    const res = await fetch("/api/usuarios/register", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        nombreusuario: nombreUsuario,
        mail,
        contrasena,
        fotousuario: rutaFotoSubida
      })
    });

    const data = await res.json();

    if (res.ok) {
        alert("Registro exitoso. Será redirigido al login.");
        form.reset();
        preview.src = "../static/Imagenes/default-profile.png";
        rutaFotoSubida = "";
        window.location.href = "/login";  
      } else {
        alert("Error: " + data.error);
      }
  });
});


document.getElementById('login-form')?.addEventListener('submit', async (e) => {
  e.preventDefault();

  const mail = document.getElementById('email').value.trim();
  const contrasena = document.getElementById('contrasena').value;

  const res = await fetch('/api/usuarios/login', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    credentials: 'include',
    body: JSON.stringify({ mail, contrasena })
  });

  const data = await res.json();

  if (res.ok) {
    alert("Login exitoso");
    window.location.href = "/home";
  } else {
    alert("Error: " + data.error);
  }
});