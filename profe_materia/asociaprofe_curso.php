<?php

    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


$options="";


$codigo_de_curso=$_POST['elegido'];
$_SESSION['curso']=$codigo_de_curso;
$options=$codigo_de_curso;
echo $options;


?>
