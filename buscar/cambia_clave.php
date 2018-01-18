<?php 
session_start();

$clave_nueva=$_POST['xclave_nueva'];
$ddni=$_POST['ddni'];
$usuario=$_SESSION['usuario_id'];
//echo $usuario;
include('../acceso_db.php');

//echo $ddni.'-'.$clave_nueva;
$sql="select * from usuarios 
inner join profesores 
on usuarios.usuario_id=profesores.usuario_id 
where dni=$ddni";
if ($resultado = $con->query($sql)){

	if($resultado->num_rows > 0){
		//echo 'clave nueva:'.$clave_nueva.'<br>';
		$sql="UPDATE usuarios set usuario_clave='".md5($clave_nueva)."'";

		$reg=$con->query($sql);
		if($reg) {
                      echo "Se CAMBIO la clave a: ".$clave_nueva.'<br>';;

                  }else {
                        echo "<b>No se pudo CAMBIAR la CLAVE</b><br>";
                        echo mysqli_error($con);
                  }
	}else{
		echo 'esa persona no tiene usuario';
	}
}else{
	echo 'esa persona existe, pero no tiene usuario';
}
//echo $sql;
 ?>