<?php
session_start();

include('../acceso_db.php');
//Guarda los valores de los campos en variables, siempre y cuando se haya enviado el formulario, sino se guardará null.
//
$dni=isset($_POST['dni']) ? $_POST['dni']:null;

$apellido = isset($_POST['apellido']) ? $_POST['apellido'] : null;
$nombre = isset($_POST['nombre']) ? $_POST['nombre'] : null;
$sexo = isset($_POST['sexo']) ? $_POST['sexo'] : null;
$domicilio = isset($_POST['domicilio']) ? $_POST['domicilio'] : null;
$localidad = isset($_POST['localidad']) ? $_POST['localidad'] : null;
$telfijo = isset($_POST['telfijo']) ? $_POST['telfijo'] : null;
$telcelu = isset($_POST['telcelu']) ? $_POST['telcelu'] : null;
$fechan = isset($_POST['fechan']) ? (($_POST['fechan'])) : null;
$libro=isset($_POST['libro']) ? (($_POST['libro'])) : null;
$folio=isset($_POST['folio']) ? (($_POST['folio'])) : null;
$idcarga= $_SESSION['usuario_id'];
$email = isset($_POST['email']) ? (($_POST['email'])) : null;

//echo $dni. '-'.$apellido;
       $sql= "insert into alumno(
           dni,usuario_id,apellido,nombre,fecha_nac,genero,localidad,domicilio,tel_fijo,
           tel_celu,email,libro,folio,idcarga,activo) ";
       $sql=$sql."values(".$dni.",0,'".$apellido."','".$nombre."'
       ,'".$fechan."',".$sexo.",".$localidad.",'".$domicilio."','".$telfijo."'
       ,'".$telcelu."','$email','$libro',$folio,$idcarga,1)";
       //echo $idcarga;
echo $sql;
// $reg = $con->query($sql);
// if($reg) {
//                       echo "Datos ingresados correctamente.";

// //include("cuantosprofes.php");

//                   }else {
//                         echo "<b>ha ocurrido un error y no se registraron los datos.</b><br>";
//                         //echo mysqli_error($con);
//                   }

?>