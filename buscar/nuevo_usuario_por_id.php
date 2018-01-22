<?php 
session_start();

$usuario_nombre=$_POST['usuario_nombre'];
$usuario_clave=$_POST['usuario_clave'];
$ddni=$_POST['ddni'];
$fecha= date("d-m-Y ");;
$usuario=$_SESSION['usuario_id'];

include('../acceso_db.php');
//BUSCO USUARIO, SI EXISTE DIGO QUE EXISTE Y QUE MODIFIQUE LA CLAVE
// SI NO EXISTE LO DOY DE ALTA EN LA TABLA USUARIOS
$sql='SELECT * FROM usuarios inner JOIN profesores on profesores.usuario_id=usuarios.usuario_id 
where usuarios.usuario_id='.$ddni;
//echo $sql;

$tieneUsuario=$resultado = $con->query($sql);
$cantidad=$resultado->num_rows;
if($cantidad>0){    
//update usuarios
    $sql_actualiza_profe="UPDATE usuarios SET usuario_nombre='".$usuario_nombre."', 
    usuario_clave='".md5($usuario_clave)."' where usuario_id=".$ddni;
     // echo $sql_actualiza_profe;
    
  
      $res_actualiza=$con->query($sql_actualiza_profe);
        if($res_actualiza){
          //echo '<br>ACTUALIZE profesores!!';
          echo '
          <br>Usuario:<b> 
          '.$usuario_nombre.'</b> 
          <br>clave<b> 
          '.$usuario_clave.'</b><br> ';
          session_destroy();
        }else{
          echo '<br>NO PUDE actualizar usuarios';
        } 
        }  
        
 ?>