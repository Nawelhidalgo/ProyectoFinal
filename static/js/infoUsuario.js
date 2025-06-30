document.addEventListener("DOMContentLoaded", () => {
  fetch("/api/usuarios/usuario_actual", {
    method: "GET",
    credentials: "include" 
  })
    .then(res => {
      if (!res.ok) throw new Error("No logueado");
      return res.json();
    })
    .then(usuario => {
      document.getElementById("nombre-usuario").textContent = `¡Saludos, ${usuario.nombre}!`;
      document.getElementById("foto-usuario").src = usuario.foto;
    })
    .catch(() => {
      alert("Sesión no iniciada. Redirigiendo al login...");
      window.location.href = "/home"
    });
});

document.addEventListener("DOMContentLoaded", () => {
  const usuarioDiv = document.getElementById("Usuario");
  const menuLogout = document.getElementById("menu-logout");

  if (usuarioDiv && menuLogout) {

    usuarioDiv.addEventListener("click", (e) => {
      e.stopPropagation();
      menuLogout.style.display = menuLogout.style.display === "block" ? "none" : "block";
    });

   
    document.addEventListener("click", (e) => {
      if (!usuarioDiv.contains(e.target)) {
        menuLogout.style.display = "none";
      }
    });

    menuLogout.addEventListener("click", async () => {
      try {
        const res = await fetch("/api/usuarios/logout", {
          method: "POST",
          credentials: "include"
        });

        if (res.ok) {
          window.location.href = "/login";
        } else {
          alert("Error al cerrar sesión");
        }
      } catch (err) {
        alert("Fallo de red al cerrar sesión");
      }
    });
  }
});