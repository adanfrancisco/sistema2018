<?php
session_start();

    include('acceso_db.php'); // incluímos los datos de conexión a la BD

    if($_SESSION['usuario_nombre']=='adanaloe'){
$curso='';$materia='';
        ?>

        Bienvenido: <a href="perfil.php?id=<?=$_SESSION['usuario_id']?>">(usuario)<strong><?=$_SESSION['usuario_nombre']?></strong></a>
    <br>
    
<a href="index.php">Menu Principal</a> | 
    <a href="logout.php">Cerrar Sesión</a> 
        <hr>     
    <br>   
 <?php 
$tipo='';
        
$profe=$_SESSION['profesor'];
$curso=$_GET['curso'];
$materia=$_GET['materia'];
//$codigo_materia=$_SESSION['codigo_materia'];    
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
            {$docente= '<font color=red><b>'.$fila['dni'].'-'.$fila['apellido'].', '.$fila['nombre'].'</b></font>';}
         echo '<br><br> EL docente que se encuentra dictando esa Materia es:---->'.$docente;//$resultado->num_rows;    
             $id_matpro= $fila['id_matpro'];
        }else{        
        
 //INSERTO EL PROFE EN MAT_PRO     
 //       if(isset($grupo){}else{})
 $insert1="INSERT INTO mat_pro(materia,profesor,curso_lectivo_id,cupof,reemplazo,activo,idcarga,grupo) 
 VALUES(
 ".$materia.",".$profe.",".$_SESSION['idcursolectivo'].",".$cupof.",".$reemplazo."
 ,1,".$_SESSION['usuario_id'] .",".$grupo.")";
echo '<br>'.$insert1;
$agregaprofe=$con->query($insert1);       
            
if($agregaprofe){
//BUSCO EL ID DEL REGISTRO INSERTADO

$busca_novedad="select * from mat_pro where materia=".$materia." and profesor=".$profe." and curso_lectivo_id=".$_SESSION['idcursolectivo'];
        echo '<br>'.$busca_novedad;
$id_matpro='';
if ($resultado = $con->query($busca_novedad)) 
        {while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {$id_matpro= $fila['id_matpro'];}}   
                 
 echo '<br> El ID de Mat_pro es: '.$id_matpro; 
 
//INSERTO EN LA TABLA MAT_PRO_NOVEDADES
$insert2="INSERT INTO mat_pro_novedades(matpro_id,
profe,fecha_alta,fecha_cese,revista,licencia_inasistencia,freg) VALUES(".$id_matpro.",".$profe.",'".$fecha_posesion."', '',".$revista.",0,'".date('d-m-Y h:i:sa')."')";
echo '<br>'.$insert2   ;
$novedadess=$con->query($insert2);
    if($novedadess){
        echo 'Profesor actualizado con sus novedades';
                   }else{
        echo 'no se pudo actualizar todo, revise la base';
    }
}
        }
 echo '<br><a href="javascript:history.back(1)">Volver Atrás</a>';
}else{
echo 'USTED no es ADMINISTRADOR <br><a href="index.php">Volver</a>';
}

?>
