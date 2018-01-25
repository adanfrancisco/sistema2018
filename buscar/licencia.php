
<?php 
session_start();
include('../acceso_db.php');

$desde=($_POST['desde']);
$desde=strtotime($desde);
$fecha_desde=date('d-m-Y',$desde);

$dias=$_POST['dias'];
$dni=$_POST['ddni'];
$usuario=$_SESSION['usuario_id'];

//echo  $desde .'-'. $dias .'-'. $ddni .'-'. $usuario;
$sql="INSERT INTO licencia_profe(dni, fecha_desde, fecha_hasta, articulo_encuadre, responsable, confirmada)
VALUES($dni,'$fecha_desde','0',39,$usuario,0)";
//echo $sql;
$reg = $con->query($sql);
if($reg) {
                      echo "Licencia Ingresada";

                  }else {
                        echo "<b>ha ocurrido un error y no se registraron los datos.</b><br>";
                        //echo mysqli_error($con);
                  }
 ?>