 <?php 

include('../acceso_db.php');
    $consulta="select  DISTINCT(carrera_nombre),id_carrera from usuarios 
    inner JOIN profesores on usuarios.usuario_id=profesores.usuario_id 
    inner join mat_pro on profesores.dni=mat_pro.profesor 
    inner join curso_lectivo on mat_pro.curso_lectivo_id=curso_lectivo.idcursolectivo 
    inner JOIN materia on materia.id_materia=mat_pro.materia 
    inner join curso on curso.idcurso=curso_lectivo.curso 
    inner join carrera on carrera.id_carrera=curso.carrera_id 
    where activo=1 and dni=".$_SESSION['mi_dni'];
    //echo $_SESSION['mi_dni'];
        if ($resultado = $con->query($consulta)) 
        {
      echo '<SELECT NAME="carrera" id="carrera"><OPTION>Elija una carrera</option>';
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
                
            {
                echo'<OPTION VALUE="'.$fila['id_carrera'].'">'.$fila['carrera_nombre'].'</OPTION>    ';
                echo $fila['carrera_nombre'];
            }
            echo '</select>';
        
         }   
        
?>