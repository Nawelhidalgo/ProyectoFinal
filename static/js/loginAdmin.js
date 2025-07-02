document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('login-admin-form');

  form.addEventListener('submit', async (e) => {
    e.preventDefault();

    const correo = document.getElementById('correo').value;
    const contrasena = document.getElementById('contrasena').value;

    try {
      const response = await fetch('/admin/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          Email: correo,
          contrasena: contrasena
        })
      });

      const contentType = response.headers.get('content-type');
      
      if (!response.ok) {
        if (contentType && contentType.includes('application/json')) {
          const data = await response.json();
          alert(data.error);
        } else {
          alert('Error inesperado del servidor (405 o HTML)');
        }
        return;
      }

      const data = await response.json();
      alert(data.mensaje);
      window.location.href = '/admin/panel';

    } catch (error) {
      console.error('Error al iniciar sesión:', error);
      alert('No se pudo conectar con el servidor.');
    }
  });
});