function mostrarSeccion(id) {
  document.querySelectorAll('.seccionAdmin').forEach(seccion => {
    seccion.classList.remove('visible');
  });

  const seccionActiva = document.getElementById(id);
  if (seccionActiva) {
    seccionActiva.classList.add('visible');

    if (id === 'usuarios') {
      cargarUsuarios();
    } else if (id === 'plantas') {
      cargarPlantas();
    } else if (id === 'comentarios') {
      cargarUsuariosComentarios();
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

async function cargarPlantas() {
  const contenedor = document.getElementById('contenedorPlantas');
  contenedor.innerHTML = ''; 

  try {
    const res = await fetch('/admin/plantas');
    if (!res.ok) throw new Error("Error al obtener plantas");

    const plantas = await res.json();

    plantas.forEach(planta => {
      const card = document.createElement('div');
      card.className = 'planta-card';

      const nombre = document.createElement('h3');
      nombre.textContent = planta.Nombre;

      const botones = document.createElement('div');
      botones.className = 'botones';

      const btnEditar = document.createElement('button');
      btnEditar.className = 'btn-editar';
      btnEditar.textContent = 'Editar';

      const btnDesactivar = document.createElement('button');
      btnDesactivar.className = 'btn-desactivar';
      btnDesactivar.textContent = 'Desactivar';

      botones.appendChild(btnEditar);
      botones.appendChild(btnDesactivar);

      card.appendChild(nombre);
      card.appendChild(botones);
      contenedor.appendChild(card);
    });
  } catch (error) {
    console.error('Error al cargar plantas:', error);
  }
}

async function cargarUsuariosComentarios() {
  const contenedor = document.getElementById('contenedorUsuariosComentarios');
  const contenedorComentarios = document.getElementById('contenedorComentariosUsuario');
  contenedor.innerHTML = ''; 
  contenedorComentarios.innerHTML = ''; 

  contenedor.style.display = 'grid';
  contenedorComentarios.style.display = 'none';

  try {
    const res = await fetch('/admin/usuarios');
    if (!res.ok) throw new Error("Error al obtener usuarios");

    const usuarios = await res.json();

    usuarios.forEach(usuario => {
      const card = document.createElement('div');
      card.className = 'usuario-comentario-card';
      card.setAttribute('data-idusuario', usuario.IdUsuario);

      const img = document.createElement('img');
      img.src = usuario.FotoUsuario || '../static/Imagenes/img_nabyLotus/default_user.png';
      img.alt = `Foto de ${usuario.NombreUsuario}`;

      const nombre = document.createElement('h4');
      nombre.textContent = usuario.NombreUsuario;

      card.appendChild(img);
      card.appendChild(nombre);

      card.addEventListener('click', async () => {
        contenedor.style.display = 'none';
        contenedorComentarios.style.display = 'grid';

        await cargarComentariosPorUsuario(usuario.IdUsuario);
      });

      contenedor.appendChild(card);
    });

    contenedorComentarios.addEventListener('click', () => {
      contenedorComentarios.style.display = 'none';
      contenedor.style.display = 'grid';
      contenedorComentarios.innerHTML = ''; 
    });

  } catch (error) {
    console.error('Error al cargar usuarios en comentarios:', error);
  }
}

async function cargarComentariosPorUsuario(idUsuario) {
  const contenedorComentarios = document.getElementById('contenedorComentariosUsuario');
  contenedorComentarios.innerHTML = ''; 

  try {
    const res = await fetch(`/admin/comentarios_usuario/${idUsuario}`);
    if (!res.ok) throw new Error("Error al obtener comentarios");

    const comentarios = await res.json();

    if (comentarios.length === 0) {
      contenedorComentarios.textContent = 'Este usuario no tiene comentarios.';
      return;
    }

    comentarios.forEach(comentario => {
      const card = document.createElement('div');
      card.className = 'comentario-card';

      if (comentario.Foto) {
        const img = document.createElement('img');
        img.src = comentario.Foto;
        img.alt = 'Foto comentario';
        card.appendChild(img);
      }

      const planta = document.createElement('div');
      planta.className = 'planta';
      planta.textContent = comentario.Nombre || 'Planta desconocida';
      card.appendChild(planta);

      const fecha = document.createElement('div');
      fecha.className = 'fecha';
      fecha.textContent = new Date(comentario.Fecha).toLocaleDateString();
      card.appendChild(fecha);

      const texto = document.createElement('div');
      texto.className = 'texto';
      texto.textContent = comentario.comentario || '';
      card.appendChild(texto);

      contenedorComentarios.appendChild(card);
    });

  } catch (error) {
    console.error('Error al cargar comentarios por usuario:', error);
    contenedorComentarios.textContent = 'Error al cargar comentarios.';
  }
}
