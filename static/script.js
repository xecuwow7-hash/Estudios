/**
 * Proyecto de Gestión - Grupo #7
 * Script de Validación de Formulario de Registro (Sin SweetAlert)
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
    // Usamos el <small> que pusimos en el HTML para mostrar los mensajes
    function mostrarError(input, texto) {
        const mensajeError = input.nextElementSibling;
        if (mensajeError) {
            mensajeError.innerHTML = texto;
        }
        input.style.borderColor = "#d9534f"; // Rojo
    }

    function limpiarError(input) {
        const mensajeError = input.nextElementSibling;
        if (mensajeError) {
            mensajeError.innerHTML = "";
        }
        input.style.borderColor = ""; // Vuelve al color del CSS
    }

    // 4. VALIDACIÓN EN TIEMPO REAL (Opcional, pero ayuda al usuario)
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
            mostrarError(telefono, "Solo números (mínimo 8)");
        } else {
            limpiarError(telefono);
        }
    });

    // 5. MANEJO DEL ENVÍO (SUBMIT)
    form.addEventListener("submit", function(e) {
        let valido = true;

        // Validaciones críticas antes de enviar
        if (!soloLetras.test(nombre.value.trim()) || nombre.value.trim().length < 3) {
            mostrarError(nombre, "Nombre inválido o muy corto");
            valido = false;
        }

        if (!regexCorreo.test(correo.value.trim())) {
            mostrarError(correo, "Correo electrónico inválido");
            valido = false;
        }

        if (!soloNumeros.test(telefono.value.trim()) || telefono.value.trim().length < 8) {
            mostrarError(telefono, "Teléfono inválido (mín. 8 dígitos)");
            valido = false;
        }

        if (fecha.value === "") {
            mostrarError(fecha, "La fecha es obligatoria");
            valido = false;
        }

        // 6. ENVÍO FINAL
        if (!valido) {
            // Si hay errores, bloqueamos el envío
            e.preventDefault();
            console.log("Formulario con errores, envío detenido.");
        } else {
            // Si todo está OK, el formulario sigue su curso hacia registrar.php
            console.log("Validación exitosa. Enviando a registrar.php...");
        }
    });
});