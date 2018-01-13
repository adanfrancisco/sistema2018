<?php
session_start();
//echo 'el nivel de usuario es:'.$_SESSION['nivel'];
if(isset($_SESSION['nivel'])){
    switch ($_SESSION['nivel']) {

                            case 5:
                               // include('cambioclaveusuario.php')
                                //echo '<br><br><h1><font color="red" >Cambie su clave haciendo click en su nombre</font></h1>';
                                break;
                            case 4://preceptor
                                echo '
                                <ul id="texto-color">BUSQUEDA </ul>

                                <ul ><a href="#" onclick="enviar()" >Buscar Profesor</a></ul>
                                <ul ><a href="#" onclick="novedad()" >VER Novedades</a></ul>

                                <ul id="texto-color">Relacion Usuario/Persona</ul>

                                 <ul><a href="#" onclick="materias()">Materias Por CARRERA</a></ul>
                                 ';
                                break;
                            case 3:
                                echo 'alumno';
                                break;
                            case 2:
                                    echo 'profesor';
                                break;
                            case 1:
                                //echo '<h1><font color="red" >Hola, su nivel de usuario es: '.$_SESSION['nivel'].' </font></h1>';

                                    ?>

                                <ul id="texto-color">BUSQUEDA </ul>

                                <ul ><a href="#" onclick="enviar()" >Buscar Profesor</a></ul>
                                <ul ><a href="#" onclick="novedad()" >VER Novedades</a></ul>

                                <ul id="texto-color">Gestion </ul>

                                <!-- <ul >Cambio de claves</ul> -->
                                <ul><a href="#" onclick="claves()">Cambiar Claves</a></ul>
                                <ul><a href="#" onclick="altaprofe()">Alta de Profesores</a></ul>

                                <ul id="texto-color">Relacion Usuario/Persona</ul>

                                 <ul><a href="#" onclick="materias()">Materias Por CARRERA</a></ul>


                              <!--   <ul>Asociar Profesor a Materia</ul>

                                <ul>Asociar SUPLENTE a Materia</ul> -->

                                <!--
                                <ul><a href="asociaprofe_s1.php">Baja a SUPLENTE </a></ul>
                                -->

                                <?php

                                break;
                        }
}else{
  echo '';
  
}
?>
