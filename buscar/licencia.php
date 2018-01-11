
<?php 
session_start();

$desde=($_POST['desde']);
$desde=strtotime($desde);
$desde=date('d-m-Y',$desde);

$dias=$_POST['dias'];
$ddni=$_POST['ddni'];
$usuario=$_SESSION['usuario_id'];

echo  $desde .'-'. $dias .'-'. $ddni .'-'. $usuario;

 ?>