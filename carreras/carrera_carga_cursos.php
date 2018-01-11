<?php
     session_start();

$options="";

$carrera=$_POST['carrera'];

    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


$options='';
$options='<select><option> CURSO</option>';
echo $options;


$consultacurso="select * from carrera inner join curso  on carrera.`id_carrera`= curso.`carrera_id` 
 where carrera.id_carrera=".$carrera;
//echo $consultacurso;

        if ($resultado = $con->query($consultacurso))
         {$options='';
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH))
            {
                $options='<option value="'.$fila['idcurso'].'"> '.$fila['curso'].'</option>';

    echo $options;
            }
        }
        echo '</select>';
        echo ' cod carrera:'.$carrera;
//  echo $options;
?>
