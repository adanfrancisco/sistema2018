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
                        $('#usuario_div').show();
                        $('#curso_lectivo_id').hide();
                        //console.log('Al cambiar de materia, cambian los profes');
                        $.post("profe_materia/disocia_profe_materia.php", { materia: materia },
                        function(data){$("#codigo_materia").html(data);});

                        $.post("profe_materia/disocia_profe_suplente_curso.php", { materia: materia },
                        function(data){$("#curso_lectivo_id").html(data);});
                        
                        $.post("profe_materia/disocia_profe_suplido.php", { materia: materia },
                        function(data){$("#suplido").html(data);});                        
                        
                        $.post("profe_materia/disocia_profe_suplido_dni.php", { materia: materia },
                        function(data){$("#suplido_dni").html(data);});                        
                        
                        $.post("profe_materia/disocia_profe_suplente.php", { materia: materia },
                        function(data){$("#suplente").html(data);});                        
                        
                        $.post("profe_materia/disocia_profe_suplente_dni.php", { materia: materia },
                        function(data){$("#suplente_dni").html(data);});                        
                        });})
//cambio el suplente y tiene q cambiar el dni
$("#suplente").change(function () {
                    $("#suplente option:selected").each(
                        function () {
                        quien=$(this).val();
                        console.log('cambian los profes:' + quien);

                        $.post("profe_materia/disocia_profe_suplente_cambia_dni.php", { quien: quien },
                        function(data){$("#suplente_dni").html(data);});  
                        
                        var materia=$("#codigo_materia").text();

                        $.post("profe_materia/disocia_profe_suplente_cambia_dni_id_curso.php",
                         { quien: quien, materia: materia },
                        function(data){$("#curso_lectivo_id").html(data);});
                        //cambio el curso Lectivo id en funcion del suplente!
                      
                        });})

    //boton
    $("#btn_disocia_suplente").on( "click", function() {  
                        console.log('esta por enviar la baja del suplente');
                        
                        var materia=$("#codigo_materia").text();
                        var suplido=$("#suplido_dni").text();
                        var suplente=$("#suplente_dni").text();
                        var curso=$("#curso_lectivo_id").text();
                        console.log('curso: ' + curso + '\n materia: ' +materia + 
                        ' SUPLIDO: ' + suplido + ' suplente: '+ suplente);

                    $.post("profe_materia/disocia_profe_fin.php", { materia: materia,
                     suplido:suplido, suplente: suplente, curso:curso },
                    function(data){$("#usuario_div").html(data);});        
             
             });



</script>

</head>
<body>
<h2>Baja a SUPLENTE</h2>
    <?php
    $curso=1;

    if(($_SESSION['usuario_nombre']=='adanaloe')||($_SESSION['nivel']==1)){
$curso='';$materia='';$codigo_materia='';$curso_lectivo='';$division='';$tipo='';
     $_SESSION['grupo']=null;
    $_SESSION['tipo']=null;
        ?>
<form name="agregaprofe" action="profe_materia/asociaprofe0_s.php">
<label name="curso_lectivo_id" id="curso_lectivo_id"></label>
    <p>Materia:

<label name="codigo_materia" id="codigo_materia"></label><SELECT name="materia_suplente" id="materia_suplente">
        <option>MATERIA</option>
        <?php
            $consulta="select carrera_nombre,descripcion, materia,curso_lectivo_id,  materia_nombre ,grupo, profesor, profesores.apellido,profesores.nombre , reemplazo from mat_pro_novedades 
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
                echo'<OPTION    VALUE="'.$fila['materia'].'" style="font-weight:bold"> '.$fila['carrera_nombre'].' || '.$fila['materia_nombre'].'</OPTION>    ';
            }
        }
        $resultado->close();

        ?>
        </SELECT>

<p>SUPLIDO:<label name="suplido_dni" id="suplido_dni"></label><select name="suplido" id="suplido"> </select>
<p>SUPLENTE:<label name="suplente_dni" id="suplente_dni"></label><select name="suplente" id="suplente"></select>
  </form>

    </hr>



<div id="usuario_div" hidden="true">
    <button class="input-submit-green" id="btn_disocia_suplente">
        BAJA
    </button>
</div> 



 <?php
 
}else{
echo 'USTED no es ADMINISTRADOR <br><a href="index.php">Volver</a>';
}

?>
    </body>
    </html>
