<script>
	//asignar valor a combo
    $("#localidad").val("<? echo $localidad; ?>");

//comprobar visibilidad
if ($('#content').is(':hidden'))
   $('#content').show();
else
   $('#content').hide();

   </script>

<?php
   if ($resultado = $con->query($sql)){

	if($resultado->num_rows > 0){
		if ($resultado = $con->query($sql)){    
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) {

            echo'<OPTION VALUE="'.$fila['fecha'].'">'.$fila['fecha'].'</OPTION>    ';
                echo $fila['fecha'];
            }
            echo '</select>';
    }
?>