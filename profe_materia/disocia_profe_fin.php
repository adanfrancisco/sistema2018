<?php
//echo 'si';
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


$options="";

$suplido=$_POST['suplido'];
$suplente=$_POST['suplente'];
$materia=$_POST['materia'];
$curso=$_POST['curso'];

//verifico si existe el profe suplido
$suplido="select materia,curso_lectivo_id, profesor, reemplazo , activo
from mat_pro where profesor =".$suplido." and activo=0 and curso_lectivo_id=".$curso." and materia=".$materia;
echo $suplido;
$resultado = $con->query($suplido);
echo '<br>'.$resultado->num_rows;

//cambio el estado de Activo a no y reversa de ambos


?>

<?php   
/*         if ($resultado = $con->query($consultacurso))
         {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                $options=$fila['curso_lectivo_id'];
                
            }echo $options;  
        }     */  
      
  

//echo $valor .' '. $valor2;

?>