<?php
include("conexion.php");
// Ejecutamos la consulta
$resultado = mysqli_query($conexion, "SELECT * FROM usuarios ORDER BY ID DESC");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Consulta de Registros - Grupo #7</title>
    <link rel="stylesheet" href="static/styles.css">
</head>
<body>

<div class="container-consulta">
    <h2 class="titulo-consulta">Usuarios Registrados en el Sistema</h2>

    <input type="text" id="buscar" class="input-busqueda" placeholder="Filtrar por nombre, correo o teléfono...">

    <table class="tabla-general" id="tablaUsuarios">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Fecha Reg.</th>
            </tr>
        </thead>
        <tbody>
            <?php while($fila = mysqli_fetch_array($resultado)) { ?>
            <tr>
                <td><strong><?php echo $fila['ID']; ?></strong></td>
                <td><?php echo $fila['Nombre']; ?></td>
                <td><?php echo $fila['Correo']; ?></td>
                <td><?php echo $fila['Telefono']; ?></td>
                <td><?php echo $fila['Fecha']; ?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>

    <div style="text-align: center;">
        <a href="index.html" class="enlace-retorno">Regresar al Formulario de Registro</a>
    </div>
</div>

<script>
    document.getElementById('buscar').addEventListener('keyup', function() {
        let filtro = this.value.toLowerCase();
        let filas = document.querySelectorAll('#tablaUsuarios tbody tr');

        filas.forEach(fila => {
            let texto = fila.textContent.toLowerCase();
            fila.style.display = texto.includes(filtro) ? '' : 'none';
        });
    });
</script>

</body>
</html>