<script >



//DESARROLLO DEL AVISO
        $("#btn_aviso").on( "click", function() {    
            $('#mensaje').toggle("swing");
            $('#licencia').hide();
            $('#clave').hide();
            $('#usuario_div').hide();
             });
            $("#btn_ya_aviso").on( "click", function() {  
                    console.log('esta avisando');
                    var ddni=0;
                    var xaviso=$("#aviso").val();
                    var ddni=$("#ddni").val();
                $('#btn_ya_aviso').attr("disabled", true);
                    //$('#mensaje').text(ddni);
                        $.post("buscar/grabaaviso.php", { xaviso: xaviso, ddni: ddni },
                        function(data){$("#mensaje").html(data);});
                        
                        // $.post("buscar/mail_aviso.php", { xaviso: xaviso, ddni: ddni },
                        // function(data){$("#mensaje").html(data);});
                        }
                        );
//DESARROLLO DE CLAVE
        $("#btn_clave").on( "click", function() {    
            $('#clave').toggle("swing");
            $('#licencia').hide();
            $('#mensaje').hide();
            $('#usuario_div').hide();
             });
                        $("#btn_asigna_usuario").on( "click", function() {  
                        console.log('esta cambiando la clave');
                        var ddni=0;
                        var xclave_nueva=$("#clave_nueva").val();
                        var ddni=$("#dddni").val();
                        //$('#clave').text('quiere cambiar clave a: '+ ddni + '-'+clave_nueva);
                        console.log('quiere cambiar clave a: '+ ddni + '-'+xclave_nueva);

                        $.post("buscar/cambia_clave.php", { xclave_nueva: xclave_nueva, ddni: ddni },
                        function(data){$("#clave").html(data);});
                        });
//DESARROLLO DE LICENCIA
        $("#btn_licencia").on( "click", function() {    
            $('#licencia').toggle("swing");
            $('#mensaje').hide();
            $('#clave').hide();
            $('#usuario_div').hide();
             });
                $("#btn_ya_licencia").on( "click", function() {  
                        console.log('esta avisando licencia');

                        var ddni=0;
                        var ddni=$("#dddni").val();
                        var desde=$("#licencia_desde").val();
                        var dias=$("#licencia_dias").val();

                        //$('#licencia').text(ddni);
                        $.post("buscar/licencia.php", { desde: desde, dias:dias, ddni: ddni },
                        function(data){$("#licencia").html(data);});

                        // $.post("buscar/mail_licencia.php", { desde: desde, dias:dias, ddni: ddni },
                        // function(data){$("#licencia").html(data);});
                        });
//DESARROLLO DEL USUARIO
        $("#btn_usuario").on( "click", function() {  
            $('#usuario_div').toggle("swing");
            $('#mensaje').hide();
            $('#licencia').hide();
            $('#clave').hide();
        });
//nuevo_usuario nueva_clave
            $("#btn_usuario_nuevo").on( "click", function() {  
                        console.log('esta asignando un usuario al DNI consultado');

                        var ddni=0;
                        var ddni=$("#dddni").val();
                        var usuario_nombre=$("#nuevo_usuario").val();
                        var usuario_clave=$("#nueva_clave").val();

                        //$('#licencia').text(ddni);
                        $.post("buscar/nuevo_usuario.php", { usuario_nombre: usuario_nombre, usuario_clave:usuario_clave, ddni: ddni },
                        function(data){$("#usuario_div").html(data);});        
             
             });
 
</script>
<?php
session_start();

//Archivo de conexión a la base de datos
include('../acceso_db.php');

//Variable de búsqueda
$consultaBusqueda = $_POST['valorBusqueda'];

//Filtro anti-XSS
$caracteres_malos = array("<", ">", "\"", "'", "/", "<", ">", "'", "/");
$caracteres_buenos = array("& lt;", "& gt;", "& quot;", "& #x27;", "& #x2F;", "& #060;", "& #062;", "& #039;", "& #047;");
$consultaBusqueda = str_replace($caracteres_malos, $caracteres_buenos, $consultaBusqueda);

//Variable vacía (para evitar los E_NOTICE)
$mensaje = "";


//Comprueba si $consultaBusqueda está seteado
if (isset($consultaBusqueda)) {

    $consultaBusqueda=($consultaBusqueda);

    $consulta = $con->query("SELECT * FROM profesores
    inner join localidad
    on profesores.localidad=localidad.idlocalidad
    WHERE apellido LIKE '%$consultaBusqueda%' 
    OR nombre LIKE '%$consultaBusqueda%' 
    OR CONCAT(apellido,' ',nombre)  LIKE '%$consultaBusqueda%'
	");


	//Obtiene la cantidad de filas que hay en la consulta
    $filas= $consulta->num_rows;
    
    
    //$filas = mysql_num_rows($consulta);
    
    //echo $filas;
	//$filas = mysqli_num_rows($consulta);

	//Si no existe ninguna fila que sea igual a $consultaBusqueda, entonces mostramos el siguiente mensaje
	if ($filas === 0) {
		$mensaje = "<p>No hay ningún usuario con ese nombre y/o apellido</p>";
        
	} else {
		//Si existe alguna fila que sea igual a $consultaBusqueda, entonces mostramos el siguiente mensaje
		//echo 'Resultados para <strong>'.strtoupper($consultaBusqueda).'</strong>';
        echo '<br>';
		//La variable $resultado contiene el array que se genera en la consulta, así que obtenemos los datos y los mostramos en un bucle
        //while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
                    
        $i=0;
      
		while($resultados = $consulta->fetch_array(MYSQLI_BOTH))
              {
            
            $dni=$resultados['dni'];
            $apellido = $resultados['apellido'];
            $nombre = $resultados['nombre'];
            $fechan=$resultados['fecha_nac'];
            $fechai=$resultados['fecha_ing_escuela'];
            $fechad=$resultados['fecha_ing_doc'];
            $domicilio=$resultados['domicilio'];
            $localidad=$resultados['localidad'];
            $telefono=$resultados['telefono'];
            $celular=$resultados['celular'];
            $email=$resultados['email'];
            $i++;
			//Output
            if($filas==1){
    //inicio if nivel
                switch($_SESSION['nivel']){
                case 1:
                    $mensaje='<div id="menu">
                    <button class="input-submit-blue" id="btn_aviso"   >AVISO</button>
                    <button class="input-submit-blue" id="btn_licencia"   >LICENCIA</button>  
                    <button class="input-submit-blue" id="btn_clave"   >CLAVE</button> 
                    <button class="input-submit-blue" id="btn_usuario"   >USUARIO</button>
                    ';
                    break;
                case 4:
                    //<button class="input-submit-blue" id="btn_licencia"   >LICENCIA</button> 
                    $mensaje='<div id="menu">
                    <button class="input-submit-blue" id="btn_aviso"   >AVISO</button>
                    <button class="input-submit-blue" id="btn_licencia"   >LICENCIA</button> 
                    ';
                    break;
                }//fin switch NIVEL

            $mensaje .= '<hr> <br>

            <!-- inicio de usuario -->
                <div id="usuario_div" hidden="true">
                <input type="hidden" name="ddni" id="ddni" value="'.$dni.'">
    
                        <input name="nuevo_usuario" value="'.$dni.'" id="nuevo_usuario" class="input-text align-center" style="padding: 0; width: 200px" type="text"   maxlength="50" placeholder="REEMPLAZA CON EL USUARIO" style="text-transform:lowercase;" onkeyup="javascript:this.value=this.value.toLowerCase();">
                        <input name="nueva_clave" value="'.$dni.'" id="nueva_clave" class="input-text align-center" style="padding: 0; width: 200px" type="text"   maxlength="50" placeholder="REEMPLAZA CON LA CLAVE" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();">
                        <button class="input-submit-green" id="btn_usuario_nuevo">
                            Enviar
                        </button>
                   
                </div> <!-- fin div usuario -->

            <!-- inicio de mensaje -->
                <div id="mensaje" hidden="true">
                <input type="hidden" name="ddni" id="ddni" value="'.$dni.'">
    
                        <input name="aviso" id="aviso" class="input-text align-center" style="padding: 0; width: 200px" type="text"   maxlength="50" placeholder="REEMPLAZA CON EL AVISO" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();">
                        <button class="input-submit-green" id="btn_ya_aviso">
                            Enviar
                        </button>
                   
                </div> <!-- fin div mensaje -->

                <!-- inicio de licencia -->

                <div id="licencia" hidden="true" >
                    <input type="hidden" name="ddni" id="dddni" value="'.$dni.'">

                        
                    <input name="licencia_desde" id="licencia_desde" class="input-text align-center" style="padding: 0; width: 150px" type="DATE"  maxlength="50" placeholder="FECHA INICIO" style="text-transform:uppercase;"  value="'.date("Y-m-d").'">
                        <input name="licencia_dias" value=1 id="licencia_dias" class="input-text align-center" style="padding: 0; width: 100px" type="number"  maxlength="50" placeholder="dias" style="text-transform:uppercase;">
                        <button class="input-submit-green" id="btn_ya_licencia">
                            GUARDAR
                        </button>
                    </form>                </div>
                <!-- fin div licencia -->

                <!-- inicio de clave -->
                <div id="clave" hidden="true" >
                  <input type="hidden" name="ddni" id="dddni" value="'.$dni.'">

                        <input name="clave_nueva" id="clave_nueva" class="input-text align-center" 
                        style="padding: 0; width: 200px" type="text"  maxlength="50" placeholder="NUEVA CLAVE" >
                        <button class="input-submit-green" id="btn_asigna_usuario">
                            CAMBIAR
                        </button>

                </div>
                <!-- fin div clave -->

                

            </div>
            <hr>
            <br>

            <div id="docente" align="center">
			<p align="left">
            <font size=3 color="red">
                    <a href="#" onclick="editar_profesor2()" 
                        id="edita_profe">'. $dni.' 
                    </a>
            </font> 
               ('. strtoupper($apellido).', '.strtoupper($nombre).')  
            
             <br>
             
             nacio el <b>'.$fechan.'</b>
            <br>
            ing.escuela:  <b>'.$fechai.'</b>
            <br>
            ing.sistema Ed.:<b>'.$fechad.'</b>
            <br>
            DOMICILIO:<b>'.strtoupper($domicilio). '</b> 
            <br>
            Localidad: <b>'.strtoupper($localidad).'</b>
            <br>
            TELEFONO:<b> '.$telefono.' </b>
            <br>
            CELULAR:<b> <a href =tel:'.$celular.'>'.$celular.'</a></b>
             <br>
            EMAIL:<b>'.strtolower($email). '</b>            
            </p>
         <hr>
            </div>';
        

        }else{
                        $mensaje .= //' hay '.$filas.' registros <br>
            '
            <hr>
            <div id="docente" align="center">
            <p align="left">
            <font size=3>
       
            <font color="red">
                    <a href="#" " 
                        id="edita_profe">'. $dni.' 
                    </a>
            </font> 

               ('. strtoupper($apellido).', '.strtoupper($nombre).')  
            
             <br>
             
             nacio el <b>'.$fechan.'</b>
            <br>
            ing.escuela:  <b>'.$fechai.'</b>
            <br>
            ing.sistema Ed.:<b>'.$fechad.'</b>
            <br>
            DOMICILIO:<b>'.strtoupper($domicilio). '</b> 
            <br>
            Localidad: <b>'.strtoupper($localidad).'</b>
            <br>
            TELEFONO:<b> '.$telefono.' </b>
            <br>
            CELULAR:<b> <a href =tel:'.$celular.'>'.$celular.'</a></b>
             <br>&           EMAIL:<b>'.strtolower($email). '</b>            
            </p>
            <hr>
          <p><h6>pada EDITAR debe haber 1 solo registro a la vista</h6></p>
            </div>';
        }
		};//Fin while $resultados

	}; //Fin else $filas

};//Fin isset $consultaBusqueda

//Devolvemos el mensaje que tomará jQuery
echo $mensaje;
?>