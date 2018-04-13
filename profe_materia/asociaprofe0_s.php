<?php
session_start();

    include('../acceso_db.php'); // incluímos los datos de conexión a la BD

    if($_SESSION['usuario_nombre']=='adanaloe'){
$curso='';$materia='';
        ?>

        Bienvenido: <a href="perfil.php?id=<?=$_SESSION['usuario_id']?>">(usuario)<strong><?=$_SESSION['usuario_nombre']?></strong></a>
    <br>
    
<a href="index.php">Menu Principal</a> | 
    <a href="logout.php">Cerrar Sesión</a> 
        <hr>     
    <br>   
<form action="asociaprofe0_0.php">
<?php 
$tipo='';
        
$profe=$_SESSION['profesor'];
        $curso=$_GET['curso'];
$_SESSION['curso']=$curso;
        $materia=$_GET['materia'];
$_SESSION['materia']=$materia;
$tipo=$_SESSION['tipo'];
$horas=$_GET['horas'];

$revista=$_GET['revista'];    
$fecha_posesion=$_GET['fecha_alta'];

        //si es curricular el grupo es 1 si o si
// echo $_SESSION['tipo'];

        
//verifico el GRUPO
if(isset($_GET['tipo'])){ 
    if($tipo='C')$grupo=1;
    if($tipo='L')$grupo=2;
}
        
//echo $_GET['grupo'];
 $grupo=   $_GET['grupo'];   
//$suplente=$_GET['suplente'];
  
//Consulta de Curso
        $consulta="select * from curso where idcurso=".$curso;
        if ($resultado = $con->query($consulta)) 
        {while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {$curso= $fila['curso'];}}   
        $resultado->close();
 //Consulta de DNI profe
    $consulta1=    "SELECT * FROM profesores
    WHERE apellido LIKE '%$profe%' 
    OR nombre LIKE '%$profe%' 
    OR CONCAT(apellido,' ',nombre)  LIKE '$profe%'";
    //echo $consulta1;
        if ($resultado = $con->query($consulta1)) 
        {while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {$profedni= $fila['dni'];}}   
        $resultado->close();           
//consulta de revista
        $consulta="select * from revista where id_revista=".$revista;
        if ($resultado = $con->query($consulta)) 
        {while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {$revista_nombre= $fila['revista_nombre'];} }  
        //$resultado->close();      
        
//MUESTRO LOS VALORES QUE SE AGREGARAN EN LA BASE DE DATOS
/*
echo '<br> dni: '.$profe;
echo '<br>curso: '.  $curso;
echo '<br>materia: '.$materia;
echo '<br>Codigo Curso Lectivo:'.$_SESSION['idcursolectivo'];
echo '<br>tipo: '.$tipo;     
echo '<br>modulos de la materia: '.$horas;
echo '<br>situacion de revista: '.$revista.' ('.$revista_nombre.')';        
echo '<br>Toma de Posesion: '.$fecha_posesion;   
echo '<br>Suplente: '.$suplente;    
*/
$cupof=0;$reemplazo=0;

//CUENTO LOS REGISTROS COINCIDENTES, SI EL GRUPO ES MAYOR A 1 QUIERE DECIR QUE ES LABORATORIO 
//EL GRUPO SIENDO 2 O 3 ES LABORATORIO CON POSIBILIDAD DE QUE PUEDAN EXISTIR 1 O 2 REGISTROS, POR ESO
//DEBO CONTABILIZAR LOS QUE HAY. SI EL GRUPO ES 1 ENTONCES ES CURRICULAR
/*select count(*)  from mat_pro inner join profesores on mat_pro.profesores=profesores.dni where materia=5 and grupo>1 and curso_lectivo_id=2020*/
    
//BUSCO A VER SI EXISTE EL REGISTRO QUE DESEO INSERTAR  
$busca_novedad="select * from mat_pro inner join profesores on mat_pro.profesor=profesores.dni where materia=".$materia." and grupo=".$_SESSION['grupo']." and curso_lectivo_id=".$_SESSION['idcursolectivo'];
     echo '<br>'.$busca_novedad;
     echo '<br> el grupo es:'.$_SESSION['grupo'];
$id_matpro='';
if ($resultado = $con->query($busca_novedad))
echo '<br>la cantidad es:'.$resultado->num_rows;
        if($resultado->num_rows>0)
        //if($resultado->num_rows>0)
        {echo '<br><b>YA EXISTE ESA ASOCIACION DE PROFE A MATERIA/CURSO</b>';
         while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {$docente= '<font color=red><b>'.$fila['dni'].'-'.$fila['apellido'].', '.$fila['nombre'].'</b></font>';
             
            $docente_a_suplir_nombre='-'.$fila['apellido'].', '.$fila['nombre'];
            $docente_a_suplir=$fila['dni'];
            }
         $_SESSION['docente']=$docente_a_suplir;
         echo '<br><br> EL docente que se a reemplazar es:---->'.$docente;
         //PARA NO EQUIVOCARME
         
         //REEMPLAZADO $DOCENTE
         //REEMPLAZANTE $PROFE
      //   DEBERIA COMPROBAR LA FECHA DE LA LICENCIA Y 
    //COLOCAR LAS FECHAS DE SUPLENCIA EN FUNCION DE LA LICENCIA

         
         //busco info del reemplazante
         $sql_reemplazante="select * from profesores where dni=".$profe;
         if ($resultado = $con->query($sql_reemplazante))
         {while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
             $suplente_dni=$fila['dni'];
             $suplente_apellido=$fila['apellido'];
             $suplente_nombre=$fila['nombre'];
            }
            
             
         }
         //fin de la busqueda
         echo '<br><br> EL REEMPLAZANTE es:----><font color=blue><b>'.$profe.
             '-'.$suplente_apellido.'-'.$suplente_nombre
             .'</b></font>';
         //$resultado->num_rows;  
         $hoy = date("j/n/Y");
         echo '
       <div id=#suplente>

        <br><label>DNI del que esta de licencia:</label>
        <input type="text" name="dnisuplente" value='.$docente_a_suplir.'>
        <br><label>DESDE:</label><input type=text name="suplente_desde" id="suplente_desde" value="'.$hoy.'">
        <br><label>HASTA:</label><input type=text name="suplente_hasta" id="suplente_hasta" value="'.$hoy.'"z>
    </div>
    
    <input type="submit" value="enviar">
    </form>
   <hr>
   
   ';
          
             $id_matpro= $fila['id_matpro'];
                }
 echo '<br><a href="javascript:history.back(1)">Volver Atrás</a>';
}else{
echo 'USTED no es ADMINISTRADOR <br><a href="index.php">Volver</a>';
}

?>
