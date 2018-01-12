<?php 
session_start();

$clave_nueva=$_POST['xclave_nueva'];
$ddni=$_POST['ddni'];
$usuario=$_SESSION['usuario_id'];

include('../acceso_db.php');

//echo $ddni.'-'.$clave_nueva;
$sql="select * from usuarios 
inner join profesores 
on usuarios.usuario_id=profesores.usuario_id 
where dni=$ddni";
if ($resultado = $con->query($sql)){

	if($resultado->num_rows > 0){
		echo 'Tiene usuario';
	}else{
		echo 'esa persona no tiene usuario';
	}
}else{
	echo 'esa persona existe, pero no tiene usuario';
}
//echo $sql;
 ?>