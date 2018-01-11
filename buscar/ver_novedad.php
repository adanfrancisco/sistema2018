<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0, user-scalable=no"/>

<link rel="stylesheet" type="text/css" href="carreras/css/style.css" />
  <link rel="stylesheet" type="text/css" href="carreras/css/basictable.css" />

  <script src="carreras/css/jquery.basictable.min.js"></script>

  <script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();
      $('#table-breakpoint').basictable({
        breakpoint: 768
      });
      //otras funciones
		$("#fecha").change(function () {
                    $("#fecha option:selected").each(
                        function () {
                        fecha=$(this).val();
                        //console.log('envio carrera '+ carrera);
                        $.post("buscar/ver_novedad_detalle.php", { fecha: fecha },
                        function(data){$("#reabajo").html(data);});});});
    });
  </script>
</head>
<?php
session_start();

include('../acceso_db.php');
//echo ('texto en el php - cargando novedades desde ver_novedad.php');
$sql="SELECT * from profe_novedad  group by fecha order by fecha desc";

if ($resultado = $con->query($sql)){    
  echo '<SELECT NAME="fecha" id="fecha"><OPTION>FECHA</option>';   
         $i=0;
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) {

            echo'<OPTION VALUE="'.$fila['fecha'].'">'.$fila['fecha'].'</OPTION>    ';
                echo $fila['fecha'];
            }
            echo '</select>';
    }
?>