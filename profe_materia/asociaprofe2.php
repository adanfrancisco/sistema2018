<?php
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


$options="";


$cursito=$_POST['elegido'];
$_SESSION['curso']=$cursito;
$options='<option value="1">ELIJA MATERIA</option>';
echo $options; 
$consultacurso="select * from materia where materia_curso=".$cursito.' order by materia_nombre';
       
        if ($resultado = $con->query($consultacurso))
         {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                $options='<option value="'.$fila['id_materia'].'"> '.$fila['materia_nombre'].'</option>';
    echo $options;  
            }
        }      
      
  
?>
    