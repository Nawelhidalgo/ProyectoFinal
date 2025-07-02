function mostrarSeccion(id) {
  document.querySelectorAll('.seccionAdmin').forEach(seccion => {
    seccion.classList.remove('visible');
  });

  const seccionActiva = document.getElementById(id);
  if (seccionActiva) {
    seccionActiva.classList.add('visible');

    if (id === 'usuarios') {
      cargarUsuarios();
    }
  }
}

async function cargarUsuarios() {
  const contenedor = document.getElementById('contenedorUsuarios');
  contenedor.innerHTML = ''; 

  try {
    const res = await fetch('/admin/usuarios');
    if (!res.ok) throw new Error("Error al obtener usuarios");

    const usuarios = await res.json();

    usuarios.forEach(usuario => {
      const card = document.createElement('div');
      card.className = 'usuario-card';

      const img = document.createElement('img');
      img.src = usuario.FotoUsuario || '../static/Imagenes/img_nabyLotus/default_user.png';
      img.alt = `Foto de ${usuario.NombreUsuario}`;

      const nombre = document.createElement('h3');
      nombre.textContent = usuario.NombreUsuario;

      card.appendChild(img);
      card.appendChild(nombre);
      contenedor.appendChild(card);
    });
  } catch (error) {
    console.error('Error al cargar usuarios:', error);
  }
}