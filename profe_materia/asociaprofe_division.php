<?php
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


$options='';
$options='<option> selecciona</option>';
echo $options;
$cursito=$_POST['elegido6'];

$_SESSION['curso']=$cursito;

$consultacurso="select * from curso inner join curso_lectivo on curso.idcurso=curso_lectivo.curso where
curso_lectivo.curso=".$cursito;
//echo $consultacurso;

        if ($resultado = $con->query($consultacurso))
         {$options='';
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH))
            {
                $options='<option value="'.$fila['idcursolectivo'].'"> '.$fila['division'].'</option>';

    echo $options;
            }
        }
  //echo $options;
?>
