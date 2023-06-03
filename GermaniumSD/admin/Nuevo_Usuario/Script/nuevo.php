<?php
$nombre = filter_input(INPUT_POST, "nombre", FILTER_SANITIZE_STRING);
$correo = filter_input(INPUT_POST, "correo", FILTER_SANITIZE_EMAIL);
$contraseña1 = filter_input(INPUT_POST, "contrasena1", FILTER_SANITIZE_STRING);
$contraseña2 = filter_input(INPUT_POST, "contrasena2", FILTER_SANITIZE_STRING);

if (empty($nombre) || empty($correo) || empty($contraseña1) || empty($contraseña2)) {
    echo "Todos los campos son obligatorios.";
    exit;
}

if ($contraseña1 !== $contraseña2) {
    echo "Las contraseñas no coinciden";
    exit;
}

$server = "localhost";
$dbname = "card";
$user = "root";
$pass = "root";

try {
    $conn = new PDO("mysql:host=$server;dbname=$dbname", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $conn->prepare("SELECT * FROM usuarios WHERE usuario = :correo");
    $stmt->bindParam(":correo", $correo);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        echo "La cuenta ya existe, por favor, intente nuevamente.";
        exit;
    }

    
    $stmt = $conn->prepare("INSERT INTO usuarios (usuario, nombre, clave, rol) VALUES (:correo, :nombre, :clave, 'user')");
    $stmt->bindParam(":correo", $correo);
    $stmt->bindParam(":nombre", $nombre);
    $stmt->bindParam(":clave", $contraseña1);
    $stmt->execute();

    echo "Cuenta creada exitosamente.";
} catch (PDOException $e) {
    echo "Error en el servidor. Por favor, intenta nuevamente.";
}
?>
