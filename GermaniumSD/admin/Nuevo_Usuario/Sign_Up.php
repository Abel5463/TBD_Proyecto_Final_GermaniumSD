<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro de usuario</title>
    <link rel="stylesheet" href="Style/Style.css">
    <script src="Script/Crear_cliente.js" defer></script>
</head>

<body>
    <div class="contenedor-formularios">
        <div id="registrarse">
            <h1>Registrarse</h1>
            <form action="nuevo.php" method="post" id="formulario">
                <div class="contenedor-input">
                    <label id="label_nombre"></label>
                    <input name="nombre" type="text" id="nombre" placeholder="Nombre" required>
                </div>
                <div class="contenedor-input">
                    <label id="label_correo"></label>
                    <input name="correo" type="email" id="correo" placeholder="Correo" required>
                </div>
                <div class="contenedor-input">
                    <label id="label_contraseña1"></label>
                    <input name="contrasena1" type="password" id="contrasena1" placeholder="Contraseña" required>
                </div>
                <div class="contenedor-input">
                    <label id="label_contraseña2"></label>
                    <input name="contrasena2" type="password" id="contrasena2" placeholder="Repetir Contraseña" required>
                </div>
                <label id="msg"></label>
                <button id="bregistrarse" class="button button-block" type="submit">Registrarse</button>
                <div id="mensaje"></div>
            </form>
        </div>
    </div>
</body>

</html>
