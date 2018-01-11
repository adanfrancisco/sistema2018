<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0, user-scalable=no"/>

<link rel="stylesheet" type="text/css" href="carreras/css/style.css" />
  <link rel="stylesheet" type="text/css" href="carreras/css/basictable.css" />

<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
  <!-- <script src="carreras/css/jquery-3.2.1.js" ></script> -->
  <script src="carreras/css/jquery.basictable.min.js"></script>

  <script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();

      $('#table-breakpoint').basictable({
        breakpoint: 768
      });

    });
  </script>
<?php
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD

$curso=$_POST['curso'];
######################################################################
echo 'curso nro: '.$curso;
######################################################################

//listado de materias con profesor
$consultacurso="select * from carrera left join curso on carrera.`id_carrera`= curso.`carrera_id` LEFT join materia on curso.`idcurso`=materia.`materia_curso` left join mat_pro on mat_pro.materia=materia.`id_materia` inner join profesores on mat_pro.`profesor`=profesores.`dni`
left join mat_pro_novedades on mat_pro.id_matpro=mat_pro_novedades.matpro_id
left join revista on revista.id_revista=mat_pro_novedades.revista
where curso.idcurso=".$curso." AND mat_pro.activo=1";

 //listado de materias
/* 
$consultacurso="select * from carrera inner join curso  on carrera.`id_carrera`= curso.`carrera_id` 
inner join materia on curso.`idcurso`=materia.`materia_curso` where curso.idcurso=".$curso;
*/
//echo $consultacurso;

//buscar como hacer responsive la tabla
//
//echo '<script > $("#mitabla").stackcolumns();</script>';
//
?>

  <?php
if ($resultado = $con->query($consultacurso)){
echo '<div id="page"> <table name="table" id="table" border=1>
 <thead>
 <tr>
    <th>Materia</th>
    <th>Hs Sem</th>
    <th>Profesor</th>
    <th>Rev</th>
    <th>suplente de</th>
 </tr>
  </thead>';}
            
         $i=0;
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                //$i++;
                echo '<tbody>
                        <tr>
                            <td>'.$fila['materia_nombre'].'</td>
                            <td>'.$fila['materia_modulo'].'</td>
                            <td>'.$fila['apellido'].','.$fila['nombre'].'</td>
                            <td>'.$fila['revista_sigla'].'</td>';
    $reemp=$fila['reemplazo'];

    $reemplazado=$con->query("select * from profesores where dni=$reemp.");
    while($filaa=$reemplazado->fetch_array(MYSQLI_BOTH)){
        $apell= $filaa['apellido'];
    }                
                        echo '
                        <td>'.$apell.'</td>
                        </tr>
                    </tbody>';

            }echo '</table></div>';

?>
