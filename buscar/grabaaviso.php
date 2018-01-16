<?php 
session_start();

//setlocale(LC_ALL,”es_AR”);
$aviso=$_POST['xaviso'];
$ddni=$_POST['ddni'];
$fecha= date("d-m-Y ");;
$usuario=$_SESSION['usuario_id'];

include('../acceso_db.php');

$sql="INSERT INTO profe_novedad(profe,novedad,fecha,responsable) 
VALUES($ddni,'$aviso','$fecha',$usuario)";
//echo $sql;

$reg = $con->query($sql);

if($reg) {
                      echo "Se GUARDO la novedad.";
                  }else {
                        echo "<b>ha ocurrido un error y no se registraron los datos.</b><br>";
                        echo mysqli_error($con);
                  }
 ?>