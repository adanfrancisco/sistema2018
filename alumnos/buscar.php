
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

    $consulta = $con->query("SELECT * FROM alumno
    inner join localidad
    on alumno.localidad=localidad.idlocalidad
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
                $genero=(int)$resultados['genero'];
                $localidad_local=$resultados['localidad'];
                $domicilio=$resultados['domicilio'];
                $telefono=$resultados['tel_fijo'];
                $telcelu=$resultados['tel_celu'];
                $email=$resultados['email'];
                $libro=$resultados['libro'];
                $folio=$resultados['folio'];

            $i++;
			//Output
if($filas==1){
    
$mensaje .=
            '<br>

            <div id="alumno" align="center">
			<p align="left">
            <font size=3 color="red">
                    <a href="#" onclick="edita_alumno()" 
                        id="edita_alumno">'. $dni.' 
                    </a>
            </font> 
               ('. strtoupper($apellido).', '.strtoupper($nombre).')  
            
            <br>DOMICILIO:<b>'.strtoupper($domicilio). '</b> 
            <br>Localidad: <b>'.($localidad_local).'</b>
            <br>Nacio el: <b>'.($fechan).'</b>
            <br>EMAIL:<b>'.strtolower($email). '</b>
            <br>TEL.FIJO:<b>'.$telefono.'</b>
            <br>TEL.CELU:<b>'.$telcelu.'</b>
            <br>LIBRO:<b>'.$libro.'</b>
            <br>FOLIO:<b>'.$folio.'</b>

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