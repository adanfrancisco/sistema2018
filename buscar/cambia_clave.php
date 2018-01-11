<?php 
session_start();

$clave_nueva=$_POST['xclave_nueva'];
$ddni=$_POST['ddni'];
$usuario=$_SESSION['usuario_id'];

include('../acceso_db.php');

echo $ddni.'-'.$clave_nueva;

 ?>