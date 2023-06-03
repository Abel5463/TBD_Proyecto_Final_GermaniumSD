<?php
/*$host = "localhost";
$user = "root";
$clave = "root";
$bd = "card";*/
$server = "localhost";
$database = "card";
$username = "root";
$password = "root";

try {
    // Crear una nueva instancia de PDO
    /*$dsn = "mysql:host=$host;dbname=$bd;charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $clave);*/
    $pdo = new PDO("mysql:host=$server;dbname=$database", $username, $password);

    // Establecer atributos de conexión
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    if (!$pdo) {
        die("Error de conexión: " . $pdo->errorInfo());
    }
} catch (PDOException $e) {
    echo "Error al conectar a la base de datos: " . $e->getMessage();
    exit();
}


?>
