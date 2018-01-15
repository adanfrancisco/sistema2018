<?php
session_start();
date_default_timezone_set('America/Argentina/Buenos_Aires');
	if(!isset($_POST["func"])){
        echo '<script>closeAllMsg(); createMsg("Ha ocurrido un error",3000,false,"error");</script>';
        die();
    }else{
        $func = $_POST["func"];
        $usuario_nombre=$_POST['usuario'];
        $usuario_clave=$_POST['clave'];
    }
    if($func == "buscar")
    {
        alert('busca');
    }
    if($func == "validate")
            {
                include('../acceso_db.php');

                //check connection success
                if ($con->connect_error) {
                    echo '<script>closeAllMsg(); createMsg("No se conecto a la base",3000,false,"error");</script>';
                    die();
                }else{
                    //echo '<script>closeAllMsg(); createMsg("Se conecto a la base",3000,false,"error");</script>';
                }
                $sqlUsuario="SELECT usuario_id, usuario_nombre, usuario_clave, usuario_nivel FROM usuarios WHERE usuario_nombre='".$usuario_nombre."' AND usuario_clave='".md5($usuario_clave)."'";
                //echo $sqlUsuario;

                if($stmt = $con->prepare($sqlUsuario)){

                    $stmt->execute();

                }else{
                    echo '<script>closeAllMsg(); createMsg("No hay registros",3000,false,"error");</script>';
                    echo 'no';
                    $con->close();
                    die();
                }
                $result = $stmt->get_result();
                if($result->num_rows > 0){
                    //echo 'hay usuarios';
                    while($row=$result->fetch_array()){
                        session_start();
                        echo 'usuario:'.$fila['usuario_nombre'].' - '.$fila['usuario_clave'];
                        $_SESSION['usuario_id'] = $row['usuario_id']; // creamos la sesion "usuario_id" y le asignamos como valor el campo usuario_id
                        $_SESSION['usuario_nombre'] = $row["usuario_nombre"]; // creamos la sesion "usuario_nombre" y le asignamos como valor el campo usuario_nombre


                        $_SESSION['nivel']=$row['usuario_nivel'];
                        echo $_SESSION['nivel'];
                    }
                }else{
                    ?>
                    <a href="index.php" class="input-text">Reintentar</a>
                    <?php

                }
            }
