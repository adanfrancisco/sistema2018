<?php
session_start();
    include('acceso_db.php'); // incluímos los datos de conexión a la BD


$valor=$_POST['elegido2'];
$_SESSION['materia']=$valor;

$options="";
$options='<option "> Elija Grupo</option>';
  echo $options;
$consultacurso='
select * from materia
inner join curso
on curso.idcurso=materia.materia_curso
where id_materia="'.$_SESSION['materia'].'" and materia_curso='.$_SESSION["curso"];
  echo $consultacurso;    
        if ($resultado = $con->query($consultacurso))

          while ($fila = $resultado->fetch_array(MYSQLI_BOTH))
            {
              if($fila['materia_tipo']=='L'){



        $consultagrupo='select * from grupo where nro>1';
        if ($resultado = $con->query($consultagrupo))

          while ($fila = $resultado->fetch_array(MYSQLI_BOTH))
           {   if($fila['nro']>1){
   $options='<option value="'.$fila['nro'].'"> '.$fila['nombre'].'</option>';
           }
   echo $options;   }



                  }else{
                  $options='<option value="1"> CURRICULAR</option>';
 $_SESSION['grupo']=1;
   echo $options;

              }


              }

?>
