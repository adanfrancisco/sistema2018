<?php
//echo 'si';
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


    $valor=$_POST['materia'];
    //$_SESSION['profesor']=$valor;
    
    $options="";
    /*
    $options=$valor;
    echo $options;
    */
$consultacurso="select materia.id_materia as materia,curso_lectivo_id,carrera_nombre,descripcion,
 materia_nombre ,grupo, profesor,  
 reemplazo from mat_pro_novedades 
inner join mat_pro on mat_pro.id_matpro=mat_pro_novedades.matpro_id
inner join curso_lectivo on mat_pro.curso_lectivo_id=curso_lectivo.idcursolectivo
inner join curso on curso.idcurso=curso_lectivo.curso
inner join carrera on curso.carrera_id=carrera.id_carrera
inner join materia on mat_pro.materia=materia.id_materia  
inner join profesores on profesores.dni=mat_pro.reemplazo
where reemplazo <>0 and activo=1  and materia=".$valor."
ORDER BY materia";
//echo '<br>'.$consultacurso;
?>

<?php   
        if ($resultado = $con->query($consultacurso))
         {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                $options=$fila['reemplazo'];
                
            }echo $options;  
        }      
      
  
    ?>