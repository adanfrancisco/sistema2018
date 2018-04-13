<?php
session_start();
include('acceso_db.php');
?>
        Bienvenido: <a href="perfil.php?id=<?=$_SESSION['usuario_id']?>">
            (usuario)<strong><?=$_SESSION['usuario_nombre']?></strong></a>
    <br>

<a href="index.php">Menu Principal</a> |
    <a href="logout.php">Cerrar Sesión</a>
        <hr>
<?php
$fecha_desde=$_GET['suplente_desde'];  
if(isset($_GET['suplente_hasta']))
{$fecha_hasta=$_GET['suplente_hasta'];  }

$suplente=$_SESSION['profesor'];
$curso=$_SESSION['curso'];
$materia=$_SESSION['materia'];
$tipo=$_SESSION['tipo'];
$docente=$_SESSION['docente'];
$grupo=$_SESSION['grupo'];
$cursolectivo=$_SESSION['idcursolectivo'];



echo '<br>Profesor: '.$suplente;
echo '<br>Curso: '.$curso;
echo '<br>Materia: '.$materia;
echo '<br>Suplente: '.$docente;
echo '<br>Curso Lectivo: '.$cursolectivo;
echo '<br>Curso Lectivo: '.$fecha_desde;
echo '<br>Curso Lectivo: '.$fecha_hasta;

$cupof=0;



//primero DESACTIVO AL PROFESOR QUE VA A SER REEMPLAZADO
// Y A SU ASOCIACION EN mat_pro_novedades

$sql1="UPDATE mat_pro SET activo=0 where materia=$materia and grupo=$grupo and curso_lectivo_id=$cursolectivo and profesor =$docente";
echo '<br> DESACTIVO EL PROFE A SER REEMPLAZADO'.$sql1;




//**************** */
//if($con->query($sql1)){

echo '<br><br> ahora INSERTO EL PROFE SUPLENTE EN MAT_PRO     ';
 
 $insert1="INSERT INTO mat_pro(materia,profesor,curso_lectivo_id,cupof,reemplazo,activo,idcarga,grupo) 
 VALUES(
 ".$materia.",".$suplente.",".$_SESSION['idcursolectivo'].",".$cupof.",".$docente."
 ,1,".$_SESSION['usuario_id'] .",".$grupo.")";
echo '<br><br>'.$insert1;



//**************** */
//$agregaprofe=$con->query($insert1);       
            
if($agregaprofe){
//BUSCO EL ID DEL REGISTRO INSERTADO

$busca_novedad="select * from mat_pro where materia=".$materia." and profesor=".$suplente." and curso_lectivo_id=".$_SESSION['idcursolectivo'];
        echo '<br>'.$busca_novedad;
$id_matpro='';
if ($resultado = $con->query($busca_novedad)) 
        {while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {$id_matpro= $fila['id_matpro'];}}   
                 
 echo '<br> El ID de Mat_pro es: '.$id_matpro; 
 
//INSERTO EN LA TABLA MAT_PRO_NOVEDADES
$insert2="INSERT INTO mat_pro_novedades(matpro_id,
profe,fecha_alta,fecha_cese,revista,licencia_inasistencia,freg) VALUES(".$id_matpro.",".$suplente.",'".$fecha_desde."', '.$fecha_hasta.',3,0,'".date('d-m-Y h:i:sa')."')";
echo '<br>'.$insert2   ;



//****************** */
//$novedadess=$con->query($insert2);
    if($novedadess){
        echo '<br>Profesor actualizado con sus novedades';
                   }else{
        echo '<br>no se pudo actualizar todo, revise la base';
    }}
}
?>