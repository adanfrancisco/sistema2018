<?php
    session_start();

$grupo_trae=$_POST['grupo'];
$_SESSION['grupo']=$grupo_trae;



$options=$grupo_trae;
echo $options; 
 
?>