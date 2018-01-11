<?php
  include('../acceso_db.php');
  $consulta="select * from escuela";
  if ($resultado = $con->query($consulta)) 
  {
      while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
      {
          echo 'CUE:<b>'.$fila['cue'].'</b>';
      }
  }   

  $resultado->close();
?>