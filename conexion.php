<?php
// Configuración de los parámetros del servidor local
$host = "localhost";
$user = "root";       // Usuario por defecto de XAMPP
$pass = "";           // Por defecto XAMPP no tiene contraseña
$db   = "proyecto_web"; // ASEGÚRATE de que sea el nombre que le diste en phpMyAdmin

// Crear la conexión
$conexion = mysqli_connect($host, $user, $pass, $db);

// Verificar si la conexión fue exitosa
if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Opcional: Esto es para que las tildes se vean bien
mysqli_set_charset($conexion, "utf8");

// Si llega aquí, es que todo está bien
// echo "Conexión exitosa"; 
?>