
let idPlanta = null;
let ultimoRiegoFecha = null;
let comentarioRiegoAgregado = false;

function agregarRiego() {
  const fechaAhora = new Date();
  ultimoRiegoFecha = fechaAhora;

  const ultimoRiegoElem = document.getElementById('ultimo-riego');
  ultimoRiegoElem.textContent = `Último riego: ${fechaAhora.toLocaleDateString()} ${fechaAhora.toLocaleTimeString()}`;

  const comentarioElem = document.getElementById('comentario');
  if (!comentarioElem.value.includes('💧')) {
    comentarioElem.value = comentarioElem.value
      ? comentarioElem.value + ' 💧'
      : '💧';
  }

  comentarioRiegoAgregado = true;
}

function elegirFoto() {
  document.getElementById('inputFoto').click();
}

function mostrarImagen(event) {
  const input = event.target;
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = function(e) {
      const preview = document.getElementById('preview');
      preview.src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  }
}

async function guardarComentario() {
  const comentarioElem = document.getElementById('comentario');
  const inputFoto = document.getElementById('inputFoto');

  if (!idPlanta) {
    alert('No se encontró la planta.');
    return;
  }

  if (!comentarioElem.value.trim()) {
    alert('El comentario no puede estar vacío.');
    return;
  }

  const formData = new FormData();
  formData.append('idPlanta', idPlanta);
  formData.append('comentario', comentarioElem.value.trim());

  if (inputFoto.files[0]) {
    formData.append('foto', inputFoto.files[0]);
  }

  try {
    const response = await fetch('/api/detalles/comentariousuario', {
      method: 'POST',
      body: formData,
    });

    const data = await response.json();

    if (data.success) {
      alert('Comentario guardado con éxito!');
      comentarioElem.value = '';
      inputFoto.value = '';
      document.getElementById('preview').src = '';
      if (comentarioRiegoAgregado) {
        comentarioRiegoAgregado = false;
      }
    } else {
      alert('Error al guardar comentario: ' + (data.error || 'Error desconocido'));
    }
  } catch (error) {
    alert('Error de conexión: ' + error.message);
  }
}


document.addEventListener("DOMContentLoaded", () => {
  const params = new URLSearchParams(window.location.search);
  idPlanta = params.get("id");

  if (!idPlanta) {
    alert("No se especificó planta");
    return;
  }

  fetch(`/api/detalles/planta/${idPlanta}`)
    .then(res => res.json())
    .then(planta => {
      document.querySelector(".carrusel img").src = planta.Foto;
      document.querySelector(".descripcion p").textContent = planta.Descripcion;
      document.querySelector(".cicloVida h1").textContent = `Ciclo de vida ${planta.Nombre}`;
    })
    .catch(err => alert(err.message));

 
  fetch(`/api/detalles/ciclo/${idPlanta}`)
    .then(res => res.json())
    .then(etapas => {
      const seccion = document.querySelector('.cicloVida');
      const tablaExistente = seccion.querySelector('table');
      if (tablaExistente) tablaExistente.remove();
      if (!etapas || etapas.length === 0) return;

      const tabla = document.createElement('table');
      tabla.innerHTML = `
        <thead>
          <tr>
            <th>Etapa</th>
            <th>Duración</th>
            <th>Descripción</th>
            <th>Estación</th>
          </tr>
        </thead>
        <tbody>
          ${etapas.map(etapa => `
            <tr>
              <td>${etapa.NombreEtapa}</td>
              <td>${etapa.Duracion}</td>
              <td>${etapa.Descripcion}</td>
              <td>${etapa.Estacion}</td>
            </tr>`).join('')}
        </tbody>
      `;
      seccion.appendChild(tabla);
    })
    .catch(err => console.error('Error al cargar ciclo de vida:', err));


  fetch(`/api/detalles/cuidados/${idPlanta}`)
    .then(res => res.json())
    .then(cuidados => {
      const seccion = document.querySelector('.guia-cuidados');
      seccion.innerHTML = `
        <h1>Guía de cuidados</h1>
        <ul>
          <li><strong>Sustrato:</strong> ${cuidados.Sustrato}</li>
          <li><strong>Riego:</strong> ${cuidados.Riego}</li>
          <li><strong>Luz:</strong> ${cuidados.Luz}</li>
          <li><strong>Temperatura:</strong> ${cuidados.Temperatura}</li>
          <li><strong>Fertilización:</strong> ${cuidados.Fertilizacion}</li>
          <li><strong>Mantenimiento:</strong> ${cuidados.Mantenimiento}</li>
          <li><strong>Conservación:</strong> ${cuidados.Conservacion}</li>
          <li><strong>Cómo sacar semillas:</strong> ${cuidados.Semillas}</li>
        </ul>
      `;
    })
    .catch(err => console.error('Error al cargar guía de cuidados:', err));
});