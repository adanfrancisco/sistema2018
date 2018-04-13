<?php
     session_start();

$options="";

$carrera=$_POST['carrera'];
//echo $carrera;
//echo 'si';
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


$options='';
$options='<select><option> CURSO</option>';
echo $options;


$consultacurso="select DISTINCT(descripcion),idcursolectivo from usuarios 
inner JOIN profesores on usuarios.usuario_id=profesores.usuario_id 
inner join mat_pro on profesores.dni=mat_pro.profesor 
inner join curso_lectivo on mat_pro.curso_lectivo_id=curso_lectivo.idcursolectivo 
inner JOIN materia on materia.id_materia=mat_pro.materia 
inner join curso on curso.idcurso=curso_lectivo.curso 
inner join carrera on carrera.id_carrera=curso.carrera_id 
where activo=1 and id_carrera=".$carrera;
//echo $consultacurso;

        if ($resultado = $con->query($consultacurso))
         {$options='';
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH))
            {
                $options='<option value="'.$fila['idcursolectivo'].'"> '.$fila['descripcion'].'</option>';

    echo $options;
            }
        }
        echo '</select>';
######################################################################
       // echo ' cod carrera:'.$carrera;
######################################################################
//  echo $options;
?>
