<?php

$dni=isset($_POST['dni']) ? $_POST['dni']:null;
echo $dni;
//echo ' va a actualizar dato';
session_start();

include('../acceso_db.php');
//Guarda los valores de los campos en variables, siempre y cuando se haya enviado el formulario, sino se guardará null.
//
$dni=isset($_POST['dni']) ? $_POST['dni']:null;
$legajo=0;
$apellido = isset($_POST['apellido']) ? $_POST['apellido'] : null;
$nombre = isset($_POST['nombre']) ? $_POST['nombre'] : null;
$sexo = isset($_POST['sexo']) ? $_POST['sexo'] : null;
$domicilio = isset($_POST['domicilio']) ? $_POST['domicilio'] : null;

if($_POST['localidad']=='LOCALIDAD'){
	$localidad=0;
}else{
	
	$localidad=$_POST['localidad'];
}

$telfijo = isset($_POST['telfijo']) ? $_POST['telfijo'] : 0;
$telcelu = isset($_POST['telcelu']) ? $_POST['telcelu'] : null;
$fechan = isset($_POST['fechan']) ? (($_POST['fechan'])) : null;
$fechai = isset($_POST['fechai']) ? (($_POST['fechai'])): null;
$fechad = isset($_POST['fechad']) ? (($_POST['fechad'])) : null;
$idcarga= $_SESSION['usuario_id'];
$email = isset($_POST['email']) ? (($_POST['email'])) : null;

//echo $dni. '-'.$apellido;
       $sql= "UPDATE  profesores SET legajo=$legajo,apellido='$apellido',nombre='$nombre',genero=$sexo,domicilio='$domicilio',localidad=$localidad,telefono='$telfijo',celular='$telcelu',usuario_id=0,fecha_nac='$fechan',fecha_ing_escuela='$fechai',fecha_ing_doc='$fechad',idcarga=$idcarga,email='$email' WHERE dni=$dni ";
       //echo $idcarga;
  
//echo $sql;
$reg = $con->query($sql);
if($reg) {
                      echo " - Datos ACTUALIZADOS ";

//include("cuantosprofes.php");

                  }else {
                        echo "<b>ha ocurrido un error y no se ACTUALIZARON los datos.</b><br>";
                        echo mysqli_error($con);
                  }

?>