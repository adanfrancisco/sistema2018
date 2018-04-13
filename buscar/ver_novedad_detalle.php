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

    });
  </script>
</head>

<?php
session_start();

$fecha=$_POST['fecha'];
$fecha=strtotime($fecha);
$fecha=date('d-m-Y',$fecha);

include('../acceso_db.php');
//echo ('texto en el php - cargando novedades desde ver_novedad.php');
$sql="SELECT * from profe_novedad inner join profesores
on profe_novedad.profe=profesores.dni where fecha='$fecha' order by idnovedad desc";
//echo $sql;

if ($resultado = $con->query($sql)){
echo '<div id="page"> <table name="table" id="table" border=1>

 <thead>

 <tr>
    <th>PROFESOR</th>
    <th>NOVEDAD</th>
    <th>FECHA</th>
    <th>DE</th>
 </tr>
  </thead>';}
            
         $i=0;
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                echo '<tbody>
                        <tr>
                            <td>'.$fila['profe'].'-'.$fila['apellido'].', '.$fila['nombre'].'</td>
                            <td>'.$fila['novedad'].'</td>
                            <td>'.$fila['fechaingreso'].'</td>
                            <td>'.$fila['apellido'].'</td>
                        </tr>
                    </tbody>';
            }echo '</table></div>';

?>