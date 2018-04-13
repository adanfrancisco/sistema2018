<?php
session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD


$valor=$_POST['elegido2'];
$_SESSION['materia']=$valor;

$options="";

$consultacurso='
select * from materia 
inner join curso 
on curso.idcurso=materia.materia_curso 
where id_materia="'.$_SESSION['materia'].'" and materia_curso='.$_SESSION["curso"];
  echo $consultacurso;    
        if ($resultado = $con->query($consultacurso))
         
          while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {

               $options='<option value="'.$fila['materia_modulo'].'"> '.$fila['materia_modulo'].'</option>';
 $_SESSION['modulo']=$fila['materia_modulo'];
   echo $options;             
              }
?>
    