<?php
//echo 'si';
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


$options="";


$valor=$_POST['materia'];
/*
$valor=237;
echo $valor.'<br>';

/*
$options='<option value="1">'.$valor.'</option>';
*/
//echo $options; 
$consultacurso="select materia.id_materia as materia,carrera_nombre,descripcion, materia_nombre ,grupo, profesor, profesores.apellido,profesores.nombre , reemplazo from mat_pro_novedades 
inner join mat_pro on mat_pro.id_matpro=mat_pro_novedades.matpro_id
inner join curso_lectivo on mat_pro.curso_lectivo_id=curso_lectivo.idcursolectivo
inner join curso on curso.idcurso=curso_lectivo.curso
inner join carrera on curso.carrera_id=carrera.id_carrera
inner join materia on mat_pro.materia=materia.id_materia  
#inner join profesores on profesores.dni=mat_pro.profesor
inner join profesores on profesores.dni=mat_pro.reemplazo
where reemplazo <>0 and activo=1  and materia=".$valor."
ORDER BY materia";
echo $consultacurso;
?>
<select name="" id="">
<?php   
        if ($resultado = $con->query($consultacurso))
         {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                $options='<option value="'.$fila['profesor'].'"> '.$fila['apellido'].','.$fila['nombre'].'</option>';
                echo $options;  
            }
        }      
      
  
?></select>
    