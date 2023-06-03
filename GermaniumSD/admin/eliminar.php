<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (!empty($_GET['accion']) && !empty($_GET['id'])) {
    require_once "../config/conexion.php";
    $id = $_GET['id'];
    
    if ($_GET['accion'] == 'pro') {
        try {
            //Para productos
            // Preparar la consulta utilizando marcadores de posición
            $stmt = $pdo->prepare("DELETE FROM productos WHERE id = :id");
            $stmt->bindParam(':id', $id);

            // Ejecutar la consulta
            $stmt->execute();

            // Redireccionar al archivo productos.php
            header('Location: productos.php');
            exit();
        } catch (PDOException $e) {
            echo "Error al eliminar el producto: " . $e->getMessage();
        }
    }
    
    if ($_GET['accion'] == 'cli') {
        try {                
            // Preparar la consulta utilizando marcadores de posición
            $stmt = $pdo->prepare("DELETE FROM categorias WHERE id = :id");
            $stmt->bindParam(':id', $id);

            // Ejecutar la consulta
            $stmt->execute();

            // Redireccionar al archivo categorias.php
            header('Location: categorias.php');
            exit();
        } catch (PDOException $e) {
            echo "Error al eliminar la categoría: " . $e->getMessage();
        }
    }
}

?>
