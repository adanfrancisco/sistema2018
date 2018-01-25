<?php
    session_start();

$options="";

$carrera=$_POST['carrera'];


include('../acceso_db.php');
    $consulta="select * from carrera where id_carrera=".$carrera;
        if ($resultado = $con->query($consulta)) 
        {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {$carrera= $fila['resolucion'];}
        
         }   
echo 'Res:<b>'.$carrera.'</b><br>'; 
?>

    