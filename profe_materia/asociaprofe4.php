<?php
session_start();
$valor=$_POST['elegido3'];
$_SESSION['profesor']=$valor;

$options="";
$options=$valor;
echo $options;

?>
    