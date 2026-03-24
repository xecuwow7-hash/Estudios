/**
 * Sistema de Gestión - Grupo #7
 * Script de Validación de Formulario de Registro
 */

document.addEventListener("DOMContentLoaded", () => {
    // 1. SELECTORES DE ELEMENTOS
    const form = document.getElementById("formulario");
    const nombre = document.getElementById("nombre");
    const correo = document.getElementById("correo");
    const telefono = document.getElementById("telefono");
    const fecha = document.getElementById("fecha");

    // 2. EXPRESIONES REGULARES (REGEX)
    const soloLetras = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/;
    const soloNumeros = /^[0-9]+$/;
    const regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // 3. FUNCIONES DE UTILIDAD (UI)
    function mostrarError(input, texto) {
        input.nextElementSibling.innerHTML = texto;
        input.classList.add("error");
        input.classList.remove("exito");
    }

    function limpiarError(input) {
        input.nextElementSibling.innerHTML = "";
        input.classList.remove("error");
        // Añadimos clase de éxito si el campo tiene contenido
        if (input.value.trim() !== "") {
            input.classList.add("exito");
        }
    }

    // 4. VALIDACIÓN EN TIEMPO REAL
    nombre.addEventListener("input", () => {
        if (nombre.value && !soloLetras.test(nombre.value)) {
            mostrarError(nombre, "Solo se permiten letras");
        } else {
            limpiarError(nombre);
        }
    });

    correo.addEventListener("input", () => {
        if (correo.value && !regexCorreo.test(correo.value)) {
            mostrarError(correo, "Formato de correo inválido");
        } else {
            limpiarError(correo);
        }
    });

    telefono.addEventListener("input", () => {
        if (telefono.value && !soloNumeros.test(telefono.value)) {
            mostrarError(telefono, "Solo se permiten números");
        } else {
            limpiarError(telefono);
        }
    });

    // 5. MANEJO DEL ENVÍO (SUBMIT)
    form.addEventListener("submit", function(e) {
        e.preventDefault();
        let valido = true;

        // Limpiar estados previos
        [nombre, correo, telefono, fecha].forEach(limpiarError);

        // Validaciones críticas antes de enviar
        if (!soloLetras.test(nombre.value.trim())) {
            mostrarError(nombre, "Nombre inválido");
            valido = false;
        }

        if (!regexCorreo.test(correo.value.trim())) {
            mostrarError(correo, "Correo inválido");
            valido = false;
        }

        if (!soloNumeros.test(telefono.value.trim())) {
            mostrarError(telefono, "Teléfono inválido");
            valido = false;
        }

        if (fecha.value === "") {
            mostrarError(fecha, "La fecha es obligatoria");
            valido = false;
        }

        // 6. LANZAMIENTO DE ALERTAS (SweetAlert2)
        if (valido) {
            Swal.fire({
                title: '¡Registro Exitoso!',
                text: 'Los datos del Grupo #7 se han guardado correctamente.',
                icon: 'success',
                confirmButtonColor: '#0b1838' // Azul Institucional
            });
            
            form.reset();
            // Limpiar clases de éxito tras resetear
            [nombre, correo, telefono, fecha].forEach(input => input.classList.remove("exito"));
            
        } else {
            Swal.fire({
                title: 'Campos Incompletos',
                text: 'Por favor, corrija los errores marcados en rojo.',
                icon: 'error',
                confirmButtonColor: '#F68121' // Naranja Institucional
            });
        }
    });
});