function mostrarSeccion(id) {
  document.querySelectorAll('.seccionAdmin').forEach(seccion => {
    seccion.classList.remove('visible');
  });

  const seccionActiva = document.getElementById(id);
  if (seccionActiva) {
    seccionActiva.classList.add('visible');
  }
}