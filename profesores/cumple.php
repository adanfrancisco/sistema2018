<?php
session_start();
include('../acceso_db.php');
$consulta="select * from profesores order by apellido ";

echo date('m');
if($resultado = $con->query($consulta))
        {
      echo '<SELECT NAME="cumple" id="cumple" width="100%"><OPTION>Cumpleaños</option>';
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
                
            {
                //echo $fila['fecha_nac'];
                //if(date_format($fila['fecha_nac'],'m')==date('m')){
                echo'<OPTION VALUE="'.$fila['dni'].'">'
                .date("m",strtotime($fila['fecha_nac'])).'-'.$fila['apellido'].
                '</OPTION>';
                
                
            }
            echo '</select>';
        
         }   
        


?>