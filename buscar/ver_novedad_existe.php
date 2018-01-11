<?php
session_start();

include('../acceso_db.php');
//echo ('texto en el php - cargando novedades desde ver_novedad.php');
$sql="SELECT count(*) as cantidad from profe_novedad group by fecha";
$fecha=date('d-m-Y',time());
//echo $fecha;
//echo 'vemos las que hay';
if ($resultado = $con->query($sql)){    
  
  while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {$cantidad =$fila['cantidad'];}
 

    }

     echo 'Hoy <b>'.$fecha.'</b> --> <u>'.$cantidad. ' novedades</u>';
?>