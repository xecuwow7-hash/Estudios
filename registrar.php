<?php
include("conexion.php");

// Verificamos que los datos lleguen por POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // 1. Recepción y Limpieza de datos
    $nombre   = trim($_POST['nombre_usuario']);
    $correo   = trim($_POST['correo_usuario']);
    $telefono = trim($_POST['telefono_usuario']);
    $fecha    = $_POST['fecha_nacimiento'];

    // 2. Validación de Backend
    $errores = [];

    if (!preg_match("/^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+$/", $nombre) || strlen($nombre) < 3) {
        $errores[] = "El nombre no es válido o es demasiado corto.";
    }
    if (!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
        $errores[] = "El correo electrónico no tiene un formato correcto.";
    }
    if (!ctype_digit($telefono) || strlen($telefono) < 8) {
        $errores[] = "El teléfono debe contener solo números (mínimo 8 dígitos).";
    }
    if (empty($fecha)) {
        $errores[] = "La fecha de nacimiento es obligatoria.";
    }

    // Cargamos el CSS externo
    echo "<link rel='stylesheet' href='static/styles.css'>";
    echo "<div class='contenedor-alerta'>";

    // 3. Lógica de Inserción (Si no hay errores de validación)
    if (count($errores) === 0) {
        // Escapamos datos para seguridad SQL
        $n = mysqli_real_escape_string($conexion, $nombre);
        $c = mysqli_real_escape_string($conexion, $correo);
        $t = mysqli_real_escape_string($conexion, $telefono);
        
        // Verificación de duplicados
        $verificar = mysqli_query($conexion, "SELECT * FROM usuarios WHERE Correo = '$c'");
        
        if (mysqli_num_rows($verificar) > 0) {
            // DISEÑO: Tarjeta de Advertencia (Duplicado)
            echo "
            <div class='tarjeta-exito' style='border-color: #f0ad4e;'>
                <div class='tarjeta-header' style='background-color: #f0ad4e;'>
                    <h2>Atención</h2>
                </div>
                <div class='tarjeta-body'>
                    <p>El correo electrónico <b>$correo</b> ya se encuentra registrado en nuestro sistema.</p>
                    <div class='grupo-acciones'>
                        <a href='index.html' class='btn-azul'>Volver a intentar</a>
                    </div>
                </div>
            </div>";
        } else {
            // Intento de inserción
            $sql = "INSERT INTO usuarios (Nombre, Correo, Telefono, Fecha) VALUES ('$n', '$c', '$t', '$fecha')";
            $resultado = mysqli_query($conexion, $sql);

            if ($resultado) {
                // DISEÑO: Tarjeta de Éxito Profesional
                echo "
                <div class='tarjeta-exito'>
                    <div class='tarjeta-header' style='background-color: #27ae60;'>
                        <h2>Registro Completado</h2>
                    </div>
                    <div class='tarjeta-body'>
                        <p>Los datos han sido almacenados de forma segura en nuestro sistema.</p>
                        <div class='grupo-acciones'>
                            <a href='consultar.php' class='btn-naranja'>Ver Registros</a>
                            <a href='index.html' class='btn-azul'>Nuevo Registro</a>
                        </div>
                    </div>
                </div>";
            } else {
                echo "<p style='color:red;'>Error crítico: " . mysqli_error($conexion) . "</p>";
            }
        } 
    } else {
        // DISEÑO: Tarjeta de Errores de Validación
        echo "
        <div class='tarjeta-exito' style='border-color: #d9534f;'>
            <div class='tarjeta-header' style='background-color: #d9534f;'>
                <h2>Errores encontrados</h2>
            </div>
            <div class='tarjeta-body' style='text-align: left;'>
                <ul style='color: #d9534f; margin-bottom: 20px;'>";
                foreach ($errores as $error) {
                    echo "<li>$error</li>";
                }
                echo "</ul>
                <div class='grupo-acciones' style='justify-content: center;'>
                    <a href='index.html' class='btn-azul'>Regresar y corregir</a>
                </div>
            </div>
        </div>";
    }

    echo "</div>"; 
}
?>