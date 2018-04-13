<?php
    session_start();
    include('acceso_db.php'); // incluímos los datos de conexión a la BD

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo titulo;?></title>





    <SCRIPT>
function IsNumeric(valor)
{
    var log=valor.length; var sw="S";
    for (x=0; x<log; x++)
        {
            v1=valor.substr(x,1);
            v2 = parseInt(v1);
            //Compruebo si es un valor numÃ©rico
            if (isNaN(v2)) { sw= "N";}
        }
    if (sw=="S") {return true;} else {return false; }
}

var primerslap=false;
var segundoslap=false;
function calcLong(txt, dst, formul, maximo)

      {
      var largo
      largo = formul[txt].value.length
      if (largo > maximo)
      formul[txt].value = formul[txt].value.substring(0,maximo)
      formul[dst].value = formul[txt].value.length
      }

function formatea(fecha)
       {
           var long = fecha.length;
           var dia;
           var mes;
           var ano;
           if ((long>=2) && (primerslap==false))
           {
               dia=fecha.substr(0,2);
               if ((IsNumeric(dia)==true) && (dia<=31) && (dia!="00"))
               {
                   fecha=fecha.substr(0,2)+"/"+fecha.substr(3,7); primerslap=true;
               }
               else
               { fecha=""; primerslap=false;
                }
           }else{
               dia=fecha.substr(0,1);
               if (IsNumeric(dia)==false)
               {
                   fecha="";}
               if ((long<=2) && (primerslap=true))
               {
                   fecha=fecha.substr(0,1); primerslap=false;
               }
            }
           if ((long>=5) && (segundoslap==false))
           { mes=fecha.substr(3,2);
            if ((IsNumeric(mes)==true) &&(mes<=12) && (mes!="00")) { fecha=fecha.substr(0,5)+"/"+fecha.substr(6,4); segundoslap=true; }
            else { fecha=fecha.substr(0,3);; segundoslap=false;}
           }
           else { if ((long<=5) && (segundoslap=true)) { fecha=fecha.substr(0,4); segundoslap=false; } }
           if (long>=7)
           { ano=fecha.substr(6,4);
            if (IsNumeric(ano)==false) { fecha=fecha.substr(0,6); }
            else { if (long==10){ if ((ano==0) || (ano<1900) || (ano>2100)) { fecha=fecha.substr(0,6); } } }
           }
           if (long>=10)
           {
               fecha=fecha.substr(0,10);
               dia=fecha.substr(0,2);
               mes=fecha.substr(3,2);
               ano=fecha.substr(6,4);
               // AÃ±o no viciesto y es febrero y el dia es mayor a 28
               if ( (ano%4 != 0) && (mes ==02) && (dia > 28) ) { fecha=fecha.substr(0,2)+"/"; }
           }
return (fecha);
}
</SCRIPT>


<script language="javascript">
$(document).ready(function(){


$("#prueba").load('prueba.php');

//selecciono el profesor y se carga el dni y su nombre a la vista
                    $("#profesores").change(function () {
                    $("#profesores option:selected").each(
                        function () {
                        elegido3=$(this).val();
                        $.post("asociaprofe4.php", { elegido3: elegido3 },
                        function(data){$("#profe").html(data);});});})

//selecciono el curso y me trae las divisiones para ese curso tomadas de CURSO LECTIVO o
                    $("#curso").change(function () {
                    $("#curso option:selected").each(
                        function () {
                        elegido6=$(this).val();
                        $.post("asociaprofe_division.php", { elegido6: elegido6 },
                        function(data){$("#division").html(data);});});})

//selecciono el curso y aparecen las materias por carrera y curso
                    $("#curso").change(function () {
                    $("#curso option:selected").each(
                        function () {
                        elegido=$(this).val();
                        $.post("asociaprofe2.php", { elegido: elegido },
                        function(data){$("#materia").html(data);});})})

 //selecciono el curso y aparecen las materias por carrera y curso
                    $("#curso").change(function () {
                    $("#curso option:selected").each(
                        function () {
                        elegido=$(this).val();
                        $.post("asociaprofe_curso.php", { elegido: elegido },
                        function(data){$("#codigo_de_curso").html(data);});})})


 //segun la materia muestra la carga horaria
                    $("#materia").change(function () {
                    $("#materia option:selected").each(
                        function () {
                        elegido2=$(this).val();
                        $.post("asociaprofe_materia_modulo.php", { elegido2: elegido2 },
                        function(data){$("#horas").html(data);});});})

//segun la materia muestra el tipo de materia
                    $("#materia").bind("change",function () {
                    $("#materia option:selected").each(
                        function () {
                        elegido2=$(this).val();
                        $.post("asociaprofe5.php", { elegido2: elegido2 },
                        function(data){$("#tipo").html(data);});});})

//segun el TIPO de materia carga si tiene grupos
                    $("#materia").bind("change",function () {
                    $("#materia option:selected").each(
                        function () {
                        elegido2=$(this).val();
                        $.post("asociaprofe_grupo.php", { elegido2: elegido2 },
                        function(data){$("#grupo").html(data);});});})

   //TRAE EL GRUPO    *******************************************************************
                    $("#grupo").bind("change",function () {
                    $("#grupo option:selected").each(
                        function () {
                        grupo=$(this).val();
                        $.post("asociaprofe_tabla_grupo.php", { grupo: grupo },
                        function(data){$("#grupo_traido").html(data);});});})
 //                   *******************************************************************


//segun la materia LEVANTA el CODIGO DE MATERIA
                    $("#materia").bind("change",function () {
                    $("#materia option:selected").each(
                        function () {
                        elegido2=$(this).val();
                        $.post("asociaprofem.php", { elegido2: elegido2 },
                        function(data){$("#codigo_materia").html(data);});});})

//segun la DIVISION carga el NUMERO de CURSO LECTIVO
                    $("#division").bind("change",function () {
                    $("#division option:selected").each(
                        function () {
                        elegido7=$(this).val();
                        $.post("asociaprofe7.php", { elegido7: elegido7 },
                        function(data){$("#curso_lectivo").html(data);});});})

//segun la division TRAE en una TABLA toda LA CARGA del CURSO(lectivo)
                     $("#division").bind("change",function () {
                    $("#division option:selected").each(
                        function () {
                        tabla=$(this).val();
                        $.post("asociaprofe_tabla.php", { tabla: tabla },
                        function(data){$("#tabla_curso").html(data);});});})
  //intento desarrollar la busqueda
                     $("#resultadoBusqueda").bind("change",function () {
                    $("#division option:selected").each(
     
                        function buscar() {
                      var textoBusqueda = $("input#busqueda").val();
                        if (textoBusqueda != "") {
                          $.post("asociaprofebusca.php", {valorBusqueda: textoBusqueda}, function(mensaje) {
                              $("#profesores").html(mensaje);
                           });
                       } else {
                          $("#profesores").html('<p>BUSQUE</p>');
                          };
                  };                 


});


</script>


</head>
<body>

    <?php
    $curso=1;
include('../acceso_db.php');
    if(($_SESSION['usuario_nombre']=='adanaloe')||($_SESSION['nivel']==1)){
$curso='';$materia='';$codigo_materia='';$curso_lectivo='';$division='';$tipo='';
     $_SESSION['grupo']=null;
    $_SESSION['tipo']=null;
        ?>

       


<form name="agregaprofe" action="asociaprofe0.php">
    <p>Profesor/a:
<input type="text" name="busqueda" id="busqueda" value="" placeholder="" maxlength="14" autocomplete="off" onKeyUp="buscar();" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();"/>
<SELECT name="profesores" id="profesores">
        <option>PROFESOR/A</option>
        <?php
            $consulta="select * from profesores order by apellido";
        if ($resultado = $con->query($consulta))
        {echo $resultado->num_rows;
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH))

            {echo $resultado->num_rows;
                echo'<OPTION    VALUE="'.$fila['dni'].'">'.$fila['apellido'].', '.$fila['nombre'].'</OPTION>    ';
            }
        }
        $resultado->close();

        ?>
    </SELECT>

    <p>Curso:
        <select name="curso" id="curso">
        <option>CURSO</option>
        <?php
            $consulta="select * from curso order by curso";
        if ($resultado = $con->query($consulta))
        {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH))
            {

                echo'<OPTION    VALUE="'.$fila['idcurso'].'">'.$fila['curso'].'</OPTION>    ';
            }
        }
        $resultado->close();
        ?>
        </select>

Division: <select name="division" id="division">  </select>
Materia: <select name="materia" id="materia">  </select>

<br>
Tipo: <select name="tipo" id="tipo">  </select>
Modulos: <select name="horas" id="horas">  </select>
Grupo: <select name="grupo" id="grupo">  </select> <p>


<br>Codigo Profesor: <label name="profee" id="profe"></label>
<br>Codigo Materia: <label name="codigo_materia" id="codigo_materia"></label>
<br>Codigo Curso Lectivo(division): <label name="curso_lectivo" id="curso_lectivo"></label>
<br>Codigo CURSO: <label name="codigo_de_curso" id="codigo_de_curso"></label>
<br>Codigo GRUPO: <label name="grupo_traido" id="grupo_traido"></label>
<br>Codigo PUEBAAAAAA: <label name="prueba" id="prueba"></label>

<?php
        $_SESSION['codigo_materia']=   $codigo_materia;



?>

    <p>Situacion de revista:
<SELECT name="revista" id="revista">

        <?php
            $rev="select * from revista";
        if ($resultado = $con->query($rev))
        {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH))
            {
                echo'<option value="'.$fila['id_revista'].'">'.$fila['revista_nombre'].'</option>';
            }
        }
        $resultado->close();
        $hoy = date("j/n/Y");
        ?>
    </SELECT><label>Fecha de Alta:</label>

    <!-- tag element -->
<input type="text" name="fecha_alta" id="fecha_alta" size="10" maxlength="10" value=<?php echo$hoy;?>>
<!-- init dateDropper -->
        <hr>

<!--
<br>Es Suplencia?:

    SI<input type=radio name="suplente" id="fecha_alta" value="s" >
    NO<input type=radio name="suplente" id="suplente" value="n" checked>
    <div id=#suplente>

        <br><label>DNI del que esta de licencia:</label>
        <input type="text" name="dnisuplente" value=0>
        <br><label>DESDE:</label><input type=text name="suplente_desde" id="suplente_desde" value=0>
        <br><label>HASTA:</label><input type=text name="suplente_hasta" id="suplente_hasta" value=0>
    </div>
   <hr>
  -->


        <!--
<input name="fecha_alta" type="text" size="10" maxlength="10" onKeyUp = "this.value=formateafecha(this.value);">
  -->
    </p>
     <input type="submit" value="GRABAR">
  </form>

    </hr>
<table name="tabla_curso" id="tabla_curso" border=1></table>
    </hr>   <!--
<div id="resultadoBusqueda"></div>
-->
 <?php
 //echo 'Materia: '.$_SESSION['materia'].' - curso:'.$_SESSION['curso'].' - modulos: - '.$_SESSION['modulo'];
}else{
echo 'USTED no es ADMINISTRADOR <br><a href="index.php">Volver</a>';
}

?>
    </body>
    </html>
