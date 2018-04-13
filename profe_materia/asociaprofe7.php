<?php
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD




$divide=$_POST['elegido7'];
$_SESSION['idcursolectivo']=$divide;


$options='<option value="1">ELIJA DIVISION</option>';
echo $options; 
$consultacurso="select * from curso_lectivo where idcursolectivo=".$divide;
       
        if ($resultado = $con->query($consultacurso))
         {$options='';
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                $options=$fila['idcursolectivo'];


            }
        }   

  echo $options;
?>
    