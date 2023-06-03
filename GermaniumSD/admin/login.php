<?php
session_start();

if (!empty($_SESSION['active']) && $SESSION['rol'] == 'user') {
    if (!empty($_POST)) {
        $alert = '';
        if (empty($_POST['usuario']) || empty($_POST['clave'])) {
            $alert = '<div class="alert alert-danger text-center alert-dismissible fade show" role="alert">
                        Ingrese usuario y contraseña
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
        } else {
            // Aquí se realiza la conexión a la base de datos y se ejecuta la consulta para verificar el usuario y la contraseña
            require_once "../config/conexion.php";
            $user = $_POST['usuario'];
            $clave = $_POST['clave'];
            try{
                // Preparar la consulta utilizando marcadores de posición
                $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE usuario = :user AND clave = :clave");
                $stmt->bindParam(':user', $user);
                $stmt->bindParam(':clave', $clave);

                // Ejecutar la consulta
                $stmt->execute();

                // Obtener el resultado
                $resultado = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($resultado) {
                    $_SESSION['active'] = true;
                    $_SESSION['id'] = $resultado['id'];
                    $_SESSION['nombre'] = $resultado['nombre'];
                    $_SESSION['user'] = $resultado['usuario'];
                    $_SESSION['rol'] = $resultado['rol'];
                    if($rol == 'admin')
                        header('Location: productos.php');
                    if($rol == 'user')
                        header('Location: ../index2.php');
                    exit();
                } else {
                    $alert = '<div class="alert alert-danger text-center alert-dismissible fade show" role="alert">
                            Contraseña incorrecta
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>';
                    session_destroy();
                }
            }
            catch(PDOException $e){
                echo "Error al realizar la consulta: " . $e->getMessage();
            }
        }
    }
}
?>
