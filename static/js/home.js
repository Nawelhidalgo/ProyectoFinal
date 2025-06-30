document.addEventListener("DOMContentLoaded", () => {
  const btnAgregar = document.getElementById("btnAgregarPlanta");
  const formPopup = document.getElementById("formAgregarPlanta");
  const form = formPopup.querySelector("form");
  const seccion = document.getElementById("Plantas");
  const selectTipo = form.querySelector("#tipo");
  const selectOrden = document.getElementById("mi_select");

  let visible = false;
  formPopup.style.display = "none";

  btnAgregar.addEventListener("click", () => {
    visible = !visible;
    formPopup.style.display = visible ? "block" : "none";
  });

  document.addEventListener("click", (e) => {
    if (
      visible &&
      !formPopup.contains(e.target) &&
      e.target !== btnAgregar
    ) {
      formPopup.style.display = "none";
      visible = false;
    }
  });

 
  fetch("/api/home/obtener_plantas")
    .then(res => res.json())
    .then(data => {
      data.forEach(planta => {
        const option = document.createElement("option");
        option.value = planta.IdPlanta;
        option.textContent = planta.Nombre;
        selectTipo.appendChild(option);
      });
    });


  selectOrden.addEventListener("change", () => {
    const orden = selectOrden.value;
    cargarPlantas(orden);
  });


  function cargarPlantas(orden = "fecha_desc") {
    fetch(`/api/home/obtener_plantas_usuario?orden=${orden}`, {
      method: "GET",
      credentials: "include"
    })
      .then(res => res.json())
      .then(plantas => {
        seccion.innerHTML = "";

        plantas.forEach(planta => {
          const link = document.createElement("a");
          link.href = `/detalle?id=${planta.IdPlanta}`;
          link.className = "linkPlanta";

          const contenedor = document.createElement("div");
          contenedor.className = "ContenedorPlantas";

          const imagenDiv = document.createElement("div");
          imagenDiv.className = "ImagenIngresada";

          const imagen = document.createElement("img");
          imagen.src = planta.Foto;
          imagen.alt = "Imagen planta";
          imagenDiv.appendChild(imagen);

          const nombreDiv = document.createElement("div");
          nombreDiv.className = "planta";
          nombreDiv.textContent = planta.Nombre;

          contenedor.appendChild(imagenDiv);
          contenedor.appendChild(nombreDiv);
          link.appendChild(contenedor);
          seccion.appendChild(link);
        });
      })
      .catch(err => {
        console.error("Error al cargar plantas del usuario:", err);
      });
  }

  cargarPlantas();


  form.addEventListener("submit", async (e) => {
    e.preventDefault();
    const nombre = form.querySelector("#nombre").value.trim();
    const idPlanta = selectTipo.value;
    const archivo = form.querySelector("#foto").files[0];

    if (!nombre || !archivo || !idPlanta) {
      alert("Completá todos los campos.");
      return;
    }

    const formData = new FormData();
    formData.append("foto", archivo);
    formData.append("nombre", nombre);
    formData.append("idPlanta", idPlanta);

    try {
      const res = await fetch("/api/home/agregar_planta", {
        method: "POST",
        body: formData,
        credentials: "include"
      });

      const data = await res.json();

      if (!res.ok) {
        throw new Error(data.error || "Error al guardar la planta.");
      }

      cargarPlantas(selectOrden.value);

      form.reset();
      formPopup.style.display = "none";
      visible = false;

    } catch (err) {
      alert(err.message);
    }
  });
});

