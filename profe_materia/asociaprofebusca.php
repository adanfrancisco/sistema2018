<?php
//Archivo de conexión a la base de datos
require('../acceso_db.php');
//include('var.php');
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

	//Selecciona todo de la tabla mmv001 
	//donde el nombre sea igual a $consultaBusqueda, 
	//o el apellido sea igual a $consultaBusqueda, 
	//o $consultaBusqueda sea igual a nombre + (espacio) + apellido
    $consultaBusqueda=($consultaBusqueda);
/*    
	$consulta = mysql_query($con,"SELECT * FROM profesores
    inner join localidad
    on profesores.localidad=localidad.idlocalidad
    WHERE apellido LIKE '%$consultaBusqueda%' 
    OR nombre LIKE '%$consultaBusqueda%' 
    OR CONCAT(nombre,' ',apellido)  LIKE '%$consultaBusqueda%'
	");

    */
    $ssqll="SELECT * FROM profesores
    inner join localidad
    on profesores.localidad=localidad.idlocalidad
    inner join usuarios
    on profesores.idcarga=usuarios.usuario_id
    WHERE apellido LIKE '%$consultaBusqueda%' 
  OR nombre LIKE '%$consultaBusqueda%' 
    OR CONCAT(apellido,' ',nombre)  LIKE '%$consultaBusqueda%'
    OR DNI LIKE '%$consultaBusqueda%'
    OR LOCALIDAD.localidad LIKE '%$consultaBusqueda%'
    ORDER BY APELLIDO
    	";
    
    $consulta = $con->query("SELECT * FROM profesores
    inner join localidad
    on profesores.localidad=localidad.idlocalidad
    WHERE apellido LIKE '%$consultaBusqueda%' 
    OR nombre LIKE '%$consultaBusqueda%' 
    OR CONCAT(apellido,' ',nombre)  LIKE '%$consultaBusqueda%'
	order by apellido");


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
		echo 'Resultados para <strong>'.strtoupper($consultaBusqueda).'</strong>';

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
            $i++;
			//Output
    
        
    $options='<option value="'.$resultados['dni'].'"> '.$resultados['dni'].'-'.$resultados['apellido'].','.$resultados['nombre'].'</option>';
    echo $options;  
            
        $mensaje=$options;
			/*$mensaje .= '
			<p align="center">
            <font size=6>
			<font color="red"><b>'. $dni.'</font>- '. strtoupper($apellido).', '.strtoupper($nombre).'
            </b>nacio el <b>'.$fechan.'</b>
            <br>ingres&oacute; a EETN2:  <b>'.$fechai.'</b>
             - y al sistema educativo el:<b>'.$fechad.'</b>
            <br>DOMICILIO:<b>'.strtoupper($domicilio). '</b> Localidad: <b>'.strtoupper($localidad).'</b>
            <br>TELEFONO:<b> '.$telefono.' </b>CELULAR:<b> '.$celular.'</b>
            </font>
			</p>';*/
		};//Fin while $resultados

	}; //Fin else $filas

};//Fin isset $consultaBusqueda

//Devolvemos el mensaje que tomará jQuery
echo $mensaje;
?>