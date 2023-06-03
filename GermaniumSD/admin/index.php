<?php
session_start();
if (!empty($_SESSION['active']) && $_SESSION['user']=='admin') {
    header('location: productos.php');
} 
else {
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
            require_once "../config/conexion.php";
            $user = $_POST['usuario'];
            $clave = $_POST['clave'];
          
            /*'
            $user = $_POST['usuario'];
            $clave = $_POST['clave'];
            */

            try {
                // Preparar la consulta utilizando marcadores de posición
                $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE usuario = :user AND clave = :clave");
                $stmt->bindParam(':user', $user);
                $stmt->bindParam(':clave', $clave);
                //Hola :D
                // Ejecutar la consulta
                $stmt->execute();

                // Obtener el resultado
                $resultado = $stmt->fetch(PDO::FETCH_ASSOC);

                if (!empty($resultado)) {                                
                    if ($resultado['usuario'] == $user && $resultado['rol'] == "admin") {
                        $_SESSION['active'] = true;
                        $_SESSION['id'] = $resultado['id'];
                        $_SESSION['nombre'] = $resultado['nombre'];
                        $_SESSION['user'] = $resultado['usuario'];
                        $_SESSION['rol'] = $resultado['rol'];
                        header('Location: productos.php');
                        exit();
                    } 
    
                    if ($resultado['usuario'] == $user && $resultado['rol'] == "user") {
                        $_SESSION['active'] = true;
                        $_SESSION['id'] = $resultado['id'];
                        $_SESSION['nombre'] = $resultado['nombre'];
                        $_SESSION['user'] = $resultado['usuario'];
                        $_SESSION['rol'] = $resultado['rol'];
                        header('Location: ../index2.php');
                        exit();
                    } 
                } else {
                    $alert = '<div class="alert alert-danger text-center alert-dismissible fade show" role="alert">
                        Usuario o contraseña incorrecto
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
                    session_destroy();
                }
            } catch (PDOException $e) {
                echo "Error al realizar la consulta: " . $e->getMessage();
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/sb-admin-2.min.css">
    <link rel="shortcut icon" href="../assets/img/favicon.ico" />
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image">
                                <img class="img-thumbnail" src="../assets/img/logo.png" alt="">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4"><a id='link' href='../index.php'>MAWY</a></h1>
                                        <?php echo (isset($alert)) ? $alert : ''; ?>
                                    </div>
                                    <form class="user" method="POST" action="index.php" autocomplete="off">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" id="usuario" name="usuario" placeholder="Usuario...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" id="clave" name="clave" placeholder="Password">
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block" href = "login.php">
                                            Ingresar
                                        </button>
                                        <a type = "button" class="btn btn-primary btn-user btn-block" href = "Nuevo_Usuario/Sign_Up.php"> 
                                            Registrarse
                                        </a>                                 
                                        <hr>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../assets/js/jquery-3.6.0.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../assets/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../assets/js/sb-admin-2.min.js"></script>

</body>

</html>

