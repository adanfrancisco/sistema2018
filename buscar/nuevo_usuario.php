<?php 
session_start();


$usuario_nombre=$_POST['nuevo_usuario'];
$usuario_clave=$_POST['nueva_clave'];
$ddni=$_POST['ddni'];
$fecha= date("d-m-Y ");;
$usuario=$_SESSION['usuario_id'];

include('../acceso_db.php');
//BUSCO USUARIO, SI EXISTE DIGO QUE EXISTE Y QUE MODIFIQUE LA CLAVE
// SI NO EXISTE LO DOY DE ALTA EN LA TABLA USUARIOS

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