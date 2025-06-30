let todosLosComentarios = [];

document.addEventListener('DOMContentLoaded', () => {
  const registrosDiv = document.getElementById('registros');
  const tipoSelect = document.getElementById('tipoPlanta');
  const ordenSelect = document.getElementById('ordenFecha');

  fetch('/api/galeria/comentarios')
    .then(res => res.json())
    .then(comentarios => {
      console.log(comentarios);  
      if (comentarios.error) {
        registrosDiv.innerHTML = `<p>Error: ${comentarios.error}</p>`;
        return;
      }

      if (comentarios.length === 0) {
        registrosDiv.innerHTML = '<p>No hay registros para mostrar.</p>';
        return;
      }

      todosLosComentarios = comentarios;

      const tiposSet = new Set(comentarios.map(c => c.Nombre));
      tipoSelect.innerHTML = '<option value="todos">Todos</option>';
      tiposSet.forEach(nombre => {
        const option = document.createElement('option');
        option.value = nombre.toLowerCase();
        option.textContent = nombre;
        tipoSelect.appendChild(option);
      });

      ordenSelect.innerHTML = `
        <option value="reciente">Más reciente primero</option>
        <option value="antiguo">Más antiguo primero</option>
      `;

      renderComentarios(comentarios);
    })
    .catch(err => {
      registrosDiv.innerHTML = `<p>Error al cargar registros: ${err.message}</p>`;
    });

  tipoSelect.addEventListener('change', aplicarFiltros);
  ordenSelect.addEventListener('change', aplicarFiltros);

  function aplicarFiltros() {
    let comentariosFiltrados = [...todosLosComentarios];

    const tipo = tipoSelect.value;
    const orden = ordenSelect.value;

    if (tipo !== 'todos') {
      comentariosFiltrados = comentariosFiltrados.filter(c =>
        c.Nombre.toLowerCase() === tipo.toLowerCase()
      );
    }

    comentariosFiltrados.sort((a, b) => {
      const fechaA = new Date(a.Fecha);
      const fechaB = new Date(b.Fecha);
      return orden === 'reciente' ? fechaB - fechaA : fechaA - fechaB;
    });

    renderComentarios(comentariosFiltrados);
  }

  function renderComentarios(lista) {
    registrosDiv.innerHTML = '';

    if (lista.length === 0) {
      registrosDiv.innerHTML = '<p>No hay registros que coincidan con los filtros.</p>';
      return;
    }

    lista.forEach(c => {
      const divRegistro = document.createElement('div');
      divRegistro.classList.add('registro');

      divRegistro.innerHTML = `
        <img src="${c.Foto || '../static/Imagenes/default.jpg'}" alt="Foto planta" />
        <div class="registro-info">
          <div class="tipo-planta">${c.Nombre || 'Desconocido'}</div>
          <div class="fecha">${new Date(c.Fecha).toLocaleDateString()}</div>
          <div class="comentario">${c.comentario}</div>
        </div>
      `;

      registrosDiv.appendChild(divRegistro);
    });
  }
});
