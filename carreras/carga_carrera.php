 <?php 

include('../acceso_db.php');
    $consulta="select * from carrera";
        if ($resultado = $con->query($consulta)) 
        {
      echo '<SELECT NAME="carrera" id="carrera"><OPTION>Elija una carrera</option>';
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
                
            {
                echo'<OPTION VALUE="'.$fila['id_carrera'].'">'.$fila['carrera_nombre'].' - '.$fila['resolucion'].'</OPTION>    ';
                echo $fila['carrera_nombre'];
            }
            echo '</select>';
        
         }   
        
?>