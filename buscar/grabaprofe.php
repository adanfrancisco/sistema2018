<?php
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
$localidad = isset($_POST['localidad']) ? $_POST['localidad'] : null;
$telfijo = isset($_POST['telfijo']) ? $_POST['telfijo'] : null;
$telcelu = isset($_POST['telcelu']) ? $_POST['telcelu'] : null;
$fechan = isset($_POST['fechan']) ? (($_POST['fechan'])) : null;
$fechai = isset($_POST['fechai']) ? (($_POST['fechai'])): null;
$fechad = isset($_POST['fechad']) ? (($_POST['fechad'])) : null;
$idcarga= $_SESSION['usuario_id'];
$email = isset($_POST['email']) ? (($_POST['email'])) : null;

//echo $dni. '-'.$apellido;
       $sql= "insert into profesores(dni,legajo,apellido,nombre,genero,domicilio,localidad,telefono,celular,usuario_id,fecha_nac,fecha_ing_escuela,fecha_ing_doc,idcarga,email,persona_tipo) ";
       $sql=$sql."values(".$dni.",".$legajo.",'".$apellido."','".$nombre."',".$sexo.",'".$domicilio."',".$localidad.",'".$telfijo."','".$telcelu."',0,'".$fechan."','".$fechai."
       ','".$fechad."',$idcarga,'$email',1)";
       //echo $idcarga;
//echo $sql;
$reg = $con->query($sql);
if($reg) {
                      echo "Datos ingresados correctamente.";

//include("cuantosprofes.php");

                  }else {
                        echo "<b>ha ocurrido un error y no se registraron los datos.</b><br>";
                        //echo mysqli_error($con);
                  }

?>