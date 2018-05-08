<?php
session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


$valor=$_POST['elegido2'];
$_SESSION['materias']=$valor;
$options=$valor;
echo $options;             
            
?>
    