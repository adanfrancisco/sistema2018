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
$sql='SELECT * FROM usuarios inner JOIN profesores on profesores.usuario_id=usuarios.usuario_id where dni='.$ddni;

$tieneUsuario=$resultado = $con->query($sql);
$cantidad=$resultado->num_rows;
if($cantidad>0){    
  
    while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
              {
                echo 'el profe:<b>'.$nombre_profe =$fila['apellido'].', '.$fila['nombre'].'</b> 
                <br>YA TIENE usuario <b>'.$fila['usuario_nombre'].'</b>';
            }}else{
                
                $sql="SELECT * FROM profesores WHERE dni=".$ddni;
                $resultado=$con->query($sql);

                while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
              {
                $nombre_profe =$fila['apellido'].', '.$fila['nombre'];
              }

              $sql="INSERT INTO usuarios(usuario_nombre,usuario_clave,usuario_nivel,usuario_freg)
               VALUES('$usuario_nombre','".md5($usuario_clave)."',2,'$fecha')";
               echo $sql;
            echo '<br> Se asigno el usuario:<b> 
            '.$usuario_nombre.'</b> <br>clave<b> 
            '.$usuario_clave.'</b><br>a :<b> '.$nombre_profe.'</b>';
        }   




// $sql="INSERT INTO profe_novedad(profe,novedad,fecha,responsable) 

// //echo $sql;

// $reg = $con->query($sql);

// if($reg) {
//                       echo "Se GUARDO la novedad.";
//                   }else {
//                         echo "<b>ha ocurrido un error y no se registraron los datos.</b><br>";
//                         echo mysqli_error($con);
//                   }
 ?>