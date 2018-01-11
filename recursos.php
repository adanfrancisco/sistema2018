<script>
	//asignar valor a combo
    $("#localidad").val("<? echo $localidad; ?>");

//comprobar visibilidad
if ($('#content').is(':hidden'))
   $('#content').show();
else
   $('#content').hide();

   </script>