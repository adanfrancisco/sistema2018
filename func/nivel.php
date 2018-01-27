<script>
//PRIMER DESARROLLO DE USUARIO Y CLAVE
    $("#cambia_clave").on( "click", function() {    
    $('#usuario_div').toggle("swing");
    $('#reabajo').hide();
    $('#abajo').hide();
     });
    //nuevo_usuario nueva_clave
            $("#btn_usuario_nuevo").on( "click", function() {  
                        console.log('esta asignando un usuario al DNI consultado');

                        var ddni=0;
                        var ddni=$("#ddni").val();
                        var usuario_nombre=$("#nuevo_usuario").val();
                        var usuario_clave=$("#nueva_clave").val();

                        //$('#licencia').text(ddni);
                        $.post("buscar/nuevo_usuario_por_id.php", { usuario_nombre: usuario_nombre, usuario_clave:usuario_clave, ddni: ddni },
                        function(data){$("#usuario_div").html(data);});        
             
             });

//DESARROLLO DE CLAVE
$("#modifica_clave").on( "click", function() {    
            $('#clave').toggle("swing");
            $('#reabajo').hide();
             });
                        $("#btn_asigna_usuario").on( "click", function() {  
                        console.log('esta cambiando la clave');
                        var ddni=0;
                        var xclave_nueva=$("#clave_nueva").val();
                        var ddni=$("#dddni").val();
                        console.log('si'+ddni);
                        //$('#clave').text('quiere cambiar clave a: '+ ddni + '-'+clave_nueva);
                        $.post("buscar/cambia_clave.php", { xclave_nueva: xclave_nueva, ddni: ddni },
                        function(data){$("#clave").html(data);});
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
                                 <ul><a href="#" onclick="alta_alumno()">Alta Alumno</a></ul>
                                 ';

                                break;
                            case 3:
                            //alumno
                                echo 'alumno';
                                break;
                            case 2:
                                //profesor
                                $_SESSION['mi_dni']=$_SESSION['dni'];
                                    $dni=$_SESSION['usuario_nombre'];
                                ?>

                                    <ul id="texto-color">MI USUARIO </ul>
                                    <?php
                                         if(!ctype_digit($dni)){
                                    ?>
                                    <b>EDITAR</b> mis datos
                                    <font size=3 color="red">
                                    <a href="#" onclick="editaprofe_profesor2()" 
                                    id="edita_profe"><?php echo   $_SESSION['dni']; ?> 
                                    </a>
                                    </font> 
                                    <?php 
                                         }
                                    if(ctype_digit($dni)){
                                       // echo $_SESSION['dni'];
                                    ?>
                                    <br><b>CAMBIAR </b> 
                                    <a href="#" onclick="cambia_clave()" 
                                    id="cambia_clave" value=<?php echo  $_SESSION['usuario_id']; ?>> 
                                    usuario y clave </a>
                                    <?php
                                    }
                                         if(!ctype_digit($dni)){
                                    ?>
                                    <br><b>MODIFICAR</b> <a href="#" id="modifica_clave">mi clave</a><br><br>

                                    <ul id="texto-color">MIS CURSOS </ul>
                                    <ul><a href="#" onclick="materias_profe()">Materias Por CARRERA</a></ul>
                                    
                                         <?php }?>

                <!-- inicio de usuario -->
                <div id="usuario_div" hidden="true">
                <input type="hidden" name="ddni" id="ddni" value="<?php echo  $_SESSION['usuario_id']; ?>">
    
                        <input name="nuevo_usuario" value="<?php echo $dni; ?>" id="nuevo_usuario" class="input-text align-center" style="padding: 0; width: 200px" type="text"   maxlength="50" placeholder="REEMPLAZA CON EL USUARIO" style="text-transform:lowercase;" onkeyup="javascript:this.value=this.value.toLowerCase();">
                        <input name="nueva_clave" value="<?php echo $dni; ?>" id="nueva_clave" class="input-text align-center" style="padding: 0; width: 200px" type="text"   maxlength="50" placeholder="REEMPLAZA CON LA CLAVE">
                        <button class="input-submit-green" id="btn_usuario_nuevo">
                            Enviar
                        </button>
                   
                </div> <!-- fin div usuario -->

                <!-- inicio de clave -->
                <div id="clave" hidden="true" >
                  <input type="hidden" name="dddni" id="dddni" value="<?php echo  $_SESSION['dni']; ?>">

                        <input name="clave_nueva" id="clave_nueva" class="input-text align-center" 
                        style="padding: 0; width: 200px" type="text"  maxlength="50" placeholder="NUEVA CLAVE" >
                        <button class="input-submit-green" id="btn_asigna_usuario">
                            CAMBIAR
                        </button>

                </div>
                <!-- fin div clave -->
                                    <?php
                                break;
                            case 1:
                            //administrador
                                //echo '<h1><font color="red" >Hola, su nivel de usuario es: '.$_SESSION['nivel'].' </font></h1>';

                                    ?>

                                <ul id="texto-color">BUSQUEDA </ul>

                                <ul ><a href="#" onclick="enviar()" >Buscar Profesor</a></ul>
                                <ul ><a href="#" onclick="novedad()" >VER Novedades</a></ul>

                                <ul id="texto-color">Gestion </ul>

                                
                                <ul><a href="#" onclick="altaprofe()">Alta de Profesores</a></ul>
                                <ul><a href="#" onclick="alta_alumno()">Alta Alumno</a></ul>

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
