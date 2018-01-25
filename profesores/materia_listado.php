
<script>


/*$("#abajo").load('carga_carrera.php');
*/


//selecciono la CARRERA y se cargan los CURSOS
                    $("#carrera").change(function () {
                    $("#carrera option:selected").each(
                        function () {
                        carrera=$(this).val();
                        console.log('envio carrera '+ carrera);
                        $.post("profesores/carrera_carga_cursos.php", { carrera: carrera },
                        function(data){$("#curso").html(data);});});});

//selecciono la CARRERA y se cargan los CURSOS
                    $("#curso").change(function () {
                    $("#curso option:selected").each(
                        function () {
                        curso=$(this).val();
                        //console.log('envio curso '+ curso);
                        $.post("profesores/carrera_cursos_tabla.php", { curso: curso },
                        function(data){$("#reabajo").html(data);});});});

                    $("#carrera").change(function () {
                    $("#carrera option:selected").each(
                        function () {
                        carrera=$(this).val();
                        //console.log('cargo demo');
                        $.post("carreras/blanco.php", { carrera: carrera },
                        function(data){$("#reabajo").html(data);});});});

                        
</script>
 <style>
 #carrera{  /*padre*/
	overflow: hidden;
    float:right
	
}
#carrera, #materia{  /*hijos*/
	float: left;
}
 </style>

    <?php 
    session_start();
    echo '<div id="cue">';
        //include('cue.php');
        include 'carga_carrera.php';
     echo  '</div>';
     ?>
      <div id="resolucion">
        
      </div>
    
     <div id="carrera" ></div><div id="codigoCarrera"></div>
     
     <div id="curso"><select><option></option></select></div>
     
     <div id="curso_tabla" align="center"></div>
      
   
  