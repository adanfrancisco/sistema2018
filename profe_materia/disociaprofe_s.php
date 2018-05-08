<?php
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo titulo;?></title>

<script language="javascript">



//$("#prueba").load('prueba.php');

//selecciono el profesor y se carga el dni y su nombre a la vista
                    $("#materia_suplente").change(function () {
                    $("#materia_suplente option:selected").each(
                        function () {
                        materia=$(this).val();
                        
                        $.post("profe_materia/disocia_profe_materia.php", { materia: materia },
                        function(data){$("#codigo_materia").html(data);});
                        
                        $.post("profe_materia/disocia_profe_suplido.php", { materia: materia },
                        function(data){$("#suplido").html(data);});                        
                        $.post("profe_materia/disocia_profe_suplido_dni.php", { materia: materia },
                        function(data){$("#suplido_dni").html(data);});                        

                        $.post("profe_materia/disocia_profe_suplente.php", { materia: materia },
                        function(data){$("#suplente").html(data);});                        
                        $.post("profe_materia/disocia_profe_suplido_dni.php", { materia: materia },
                        function(data){$("#suplente_dni").html(data);});                        
                        
                        });})

</script>

</head>
<body>
Baja a SUPLENTE
    <?php
    $curso=1;

    if(($_SESSION['usuario_nombre']=='adanaloe')||($_SESSION['nivel']==1)){
$curso='';$materia='';$codigo_materia='';$curso_lectivo='';$division='';$tipo='';
     $_SESSION['grupo']=null;
    $_SESSION['tipo']=null;
        ?>
<form name="agregaprofe" action="profe_materia/asociaprofe0_s.php">
    <p>Materia:

<label name="codigo_materia" id="codigo_materia"></label><SELECT name="materia_suplente" id="materia_suplente">
        <option>MATERIA</option>
        <?php
            $consulta="select carrera_nombre,descripcion, materia, materia_nombre ,grupo, profesor, profesores.apellido,profesores.nombre , reemplazo from mat_pro_novedades 
            inner join mat_pro on mat_pro.id_matpro=mat_pro_novedades.matpro_id
            inner join curso_lectivo on mat_pro.curso_lectivo_id=curso_lectivo.idcursolectivo
            inner join curso on curso.idcurso=curso_lectivo.curso
            inner join carrera on curso.carrera_id=carrera.id_carrera
            inner join materia on mat_pro.materia=materia.id_materia  
            #inner join profesores on profesores.dni=mat_pro.profesor
            inner join profesores on profesores.dni=mat_pro.reemplazo
            where reemplazo <>0 and activo=1 
            ORDER BY materia";
        if ($resultado = $con->query($consulta))
        {echo $resultado->num_rows;
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH))

            {echo $resultado->num_rows;
                echo'<OPTION    VALUE="'.$fila['materia'].'">'.$fila['materia_nombre'].' '.$fila['profesores.apellido'].'</OPTION>    ';
            }
        }
        $resultado->close();

        ?>
        </SELECT>

<p>SUPLIDO:<label name="suplido_dni" id="suplido_dni"></label><select name="suplido" id="suplido"> </select>
<p>SUPLENTE:<label name="suplente_dni" id="suplente_dni"></label><select name="suplente" id="suplente"></select>


<!--
    <br>Codigo PUEBAAAAAA: <label name="prueba" id="prueba"></label>
-->

  </form>

    </hr>
 <?php
 //echo 'Materia: '.$_SESSION['materia'].' - curso:'.$_SESSION['curso'].' - modulos: - '.$_SESSION['modulo'];
}else{
echo 'USTED no es ADMINISTRADOR <br><a href="index.php">Volver</a>';
}

?>
    </body>
    </html>
