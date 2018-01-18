<script>
    $("#cambia_clave").on( "click", function() {    
    $('#usuario_div').toggle("swing");
     });
    //nuevo_usuario nueva_clave
            $("#btn_usuario_nuevo").on( "click", function() {  
                        console.log('esta asignando un usuario al DNI consultado');

                        var ddni=0;
                        var ddni=$("#dddni").val();
                        var usuario_nombre=$("#nuevo_usuario").val();
                        var usuario_clave=$("#nueva_clave").val();

                        //$('#licencia').text(ddni);
                        $.post("buscar/nuevo_usuario_por_id.php", { usuario_nombre: usuario_nombre, usuario_clave:usuario_clave, ddni: ddni },
                        function(data){$("#usuario_div").html(data);});        
             
             });
</script>
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
                                    $dni=(int)$_SESSION['usuario_nombre'];
                                ?>

                                    <ul id="texto-color">MI USUARIO </ul>
                                    <b>EDITAR</b> mis datos
                                    <font size=3 color="red">
                                    <a href="#" onclick="editaprofe_profesor2()" 
                                    id="edita_profe"><?php echo  $dni; ?> 
                                    </a>
                                    </font> 
                                    <br><b>CAMBIAR</b> 
                                    <a href="#" onclick="cambia_clave()" 
                                    id="cambia_clave"><?php echo  $_SESSION['usuario_id']; ?> 
                                    mi clave </a>
                                    <br><b>MODIFICAR</b> mi clave<br><br>
                                    <ul id="texto-color">MIS CURSOS </ul>

                <!-- inicio de usuario -->
                <div id="usuario_div" hidden="true">
                <input type="hidden" name="ddni" id="ddni" value="<?php echo  $_SESSION['usuario_id']; ?>">
    
                        <input name="nuevo_usuario" value="<?php echo $dni; ?>" id="nuevo_usuario" class="input-text align-center" style="padding: 0; width: 200px" type="text"   maxlength="50" placeholder="REEMPLAZA CON EL USUARIO" style="text-transform:lowercase;" onkeyup="javascript:this.value=this.value.toLowerCase();">
                        <input name="nueva_clave" value="<?php echo $dni; ?>" id="nueva_clave" class="input-text align-center" style="padding: 0; width: 200px" type="text"   maxlength="50" placeholder="REEMPLAZA CON LA CLAVE" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();">
                        <button class="input-submit-green" id="btn_usuario_nuevo">
                            Enviar
                        </button>
                   
                </div> <!-- fin div usuario -->

                                    <?php
                                break;
                            case 1:
                                //echo '<h1><font color="red" >Hola, su nivel de usuario es: '.$_SESSION['nivel'].' </font></h1>';

                                    ?>

                                <ul id="texto-color">BUSQUEDA </ul>

                                <ul ><a href="#" onclick="enviar()" >Buscar Profesor</a></ul>
                                <ul ><a href="#" onclick="novedad()" >VER Novedades</a></ul>

                                <ul id="texto-color">Gestion </ul>

                                
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
