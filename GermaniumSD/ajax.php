<?php
require_once "config/conexion.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($_POST['action'] == 'buscar') {
        $array['datos'] = array();
        $total = 0;
        foreach ($_POST['data'] as $item) {
            $id = $item['id'];
            
            try {
                // Preparar la consulta utilizando un marcador de posición
                $stmt = $pdo->prepare("SELECT * FROM productos WHERE id = :id");
                $stmt->bindParam(':id', $id);
                
                // Ejecutar la consulta
                $stmt->execute();
                
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                
                $data['id'] = $result['id'];
                $data['precio'] = $result['precio_rebajado'];
                $data['nombre'] = $result['nombre'];
                
                $total += $result['precio_rebajado'];
                
                $array['datos'][] = $data;
            } catch (PDOException $e) {
                echo "Error al buscar productos: " . $e->getMessage();
            }
        }
        
        $array['total'] = $total;
        echo json_encode($array);
        exit();
    }
}
?>
