<?php
//$hojaestilo="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css";
$host_db = "localhost"; // Host de la BD
 /*
 
    //remoto
    $usuario_db = "c0990267_adan"; // Usuario de la BD
    $clave_db = "Mandinga123"; // ContraseÃ�Â±a de la BD
    $nombre_db = "c0990267_is93"; // Nombre de la BD
*/
    //local  -ultrabook

    $usuario_db = "root"; // Usuario de la BD
    $clave_db = ""; // ContraseÃ�Â±a de la BD
    $nombre_db = "is93"; // Nombre de la BD
    //local  -mac
/*
    $usuario_db = "adan"; // Usuario de la BD
    $clave_db = "mandinga"; // ContraseÃ�Â±a de la BD
    $nombre_db = "is93"; // Nombre de la BD
*/
    //conectamos y seleccionamos db

    //conectamos y seleccionamos db
//error_reporting(E_COMPILE_ERROR|E_ERROR|E_CORE_ERROR);
// $con= new mysqli($host_db, $usuario_db, $clave_db,$nombre_db) or die ("No puedo conectar a mysql"); 
//$db=mysqli_select_db($con,$nombre_db)
//    or die("No puedo abrir la Base");

//$con = mysqli_connect($host_db, $usuario_db, $clave_db);
$con=new mysqli($host_db, $usuario_db, $clave_db,$nombre_db);
if (!$con) {
    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
    exit;
}
//mysqli_select_db($con, $nombre_db);
//$tildes = $con->query("SET NAMES 'utf8'"); //Para que se muestren las tildes correctamente
/*
//$query = mysqli_query($con, "SELECT * FROM profesores");
//$row=$query->fetch_array();
//$row= mysqli_fetch_array($query);
*/

?>