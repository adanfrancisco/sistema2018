<script>


function saleprofe(){
    ingresar();
    //location.reload();
    //$("#reabajo").load('carreras/blanco.php');
    }
function claves()
{ 
    $("#abajo").load('usuarios/clave_admin.php');
    $('#reabajo').load("buscar/ver_novedad.php");
}

function novedad()
{ 

    $("#abajo").load('buscar/ver_novedad_existe.php');
    $('#reabajo').load("buscar/ver_novedad.php");
}
function editar_profesor2()
{ 

    var xxdni=$("#edita_profe").text();

    //$("#reabajo").html(data);
    //$("#dni").text($("#edita_profe").text());
    $("#abajo").load('carreras/blanco.php');

            $.post("buscar/editaprofe.php", {xxdni: xxdni}, 
                function(data){$("#reabajo").html(data);
            window.location="#edicion";
        }
                   ); 
}

function edita_alumno()
{ 

    var xxdni=$("#edita_alumno").text();

    $("#reabajo").load('carreras/blanco.php');

            $.post("alumnos/edita_alumno.php", {xxdni: xxdni}, 
                function(data){$("#abajo").html(data);
            window.location="#edicion";
        }
                   ); 
}
    function buscar() {
        var textoBusqueda = $("input#busqueda").val();
        if (textoBusqueda != "") {
            $.post("buscar/buscar.php", {valorBusqueda: textoBusqueda}, function(mensaje) {
                $("#resultadoBusqueda").html(mensaje);
                $("#reabajo").html('');
                
                                }); 
        } else { 
            $("#resultadoBusqueda").html('');
            $("#reabajo").html('<p>INGRESE SU BUSQUEDA</p>');
            };
    };
    function buscar_alumno() {
        var textoBusqueda = $("input#busqueda").val();
        if (textoBusqueda != "") {
            $.post("alumnos/buscar.php", {valorBusqueda: textoBusqueda}, function(mensaje) {
                $("#resultadoBusqueda").html(mensaje);
                $("#reabajo").html('');
                
                                }); 
        } else { 
            $("#resultadoBusqueda").html('');
            $("#reabajo").html('<p>INGRESE SU BUSQUEDA</p>');
            };
    };
    function enviar(){
        //alert('si');
        $("#reabajo").load('carreras/blanco.php');
        console.log('carga la busqueda');
        $("#abajo").load('buscar/index.php');
        //$(':input').focus();
        //$("#abajo").load('prueba.html');
}

function enviar_alumno(){
        //alert('si');
        $("#reabajo").load('carreras/blanco.php');
        console.log('carga la busqueda');
        $("#abajo").load('alumnos/index.php');
        //$(':input').focus();
        //$("#abajo").load('prueba.html');
}

function asocia_profe(){
        $("#reabajo").load('carreras/blanco.php');
        console.log('asocia_profe');
        $("#abajo").load('profe_materia/asociaprofe.php');
}
function asocia_profe_suplente(){
        $("#reabajo").load('carreras/blanco.php');
        console.log('asocia_profe_suplente SUPLENTE');
        $("#abajo").load('profe_materia/asociaprofe_s.php');
}

function disocia_profe_suplente(){
        $("#reabajo").load('carreras/blanco.php');
        console.log('quita al  SUPLENTE');
        $("#abajo").load('profe_materia/disociaprofe_s.php');
}
  function grabaprofe(){
  var xdni=0;
  if(!$("#dni").val()){
      xdni=0;
  }else{
      xdni=$("#dni").val();
  };
  var xlegajo=0;
    if(!$("#legajo").val()){
        xlegajo=0;
    }else{
        xlegajo=$("#legajo").val();
    }
  var xapellido=$("#apellido").val();
  var xnombre=$("#nombre").val();
  //var sexo($('input:radio[name=sexo]:checked').val()
      var xsexo=document.getElementsByName("sexo");
    // Recorremos todos los valores del radio button para encontrar el
    // seleccionado
    for(var i=0;i<xsexo.length;i++)
    {
        if(xsexo[i].checked)
            xsexo=xsexo[i].value;
    }

  var xdomicilio=$("#domicilio").val();
  var xlocalidad=$("#localidad").val();
  var xtelfijo=$("#telfijo").val();
  var xtelcelu=$("#telcelu").val();
  var xfechan=$("#fechan").val();
  var xfechai=$("#fechai").val();
  var xfechad=$("#fechad").val();
  var xemail=$("#email").val();

    console.log('presiono enviar- ahora el mensaje');
    if((xdni==0)||(xapellido=='')||(xnombre=='')||(xtelcelu=='')||(xfechan=='')){
        alert('faltan datos!!');}else{
   /*alert(xdni +','+ xlegajo+','+xapellido+','+
      xnombre+','+xsexo+','+xdomicilio+','+xlocalidad+','+
      xtelfijo+','+xtelcelu+','+xfechan+','+xfechai+','+xfechad);
*/

                                   
alert('va a grabar');
    $.ajax({                        
       type: "POST",                 
       url: "buscar/grabaprofe.php",                    
       data: $("#formulario").serialize(),
        async: false,
       success: function(data)            
       {
         $('#reabajo').html(data);   
         console.log('enviando datos..');     
       },
       error: function(data) {
        $("#reabajo").text(data + " Fallo el Alta");
        console.log('no se completo el envio');
        $("#reabajo").fadeIn("slow");
        $("#reabajo").delay(2000).fadeOut(1000);
    }
     });
                                }

 
}
function graba_alumno(){
  var xdni=0;
  if(!$("#dni").val()){
      xdni=0;
  }else{
      xdni=$("#dni").val();
  };
  
  var xapellido=$("#apellido").val();
  var xnombre=$("#nombre").val();
  var xlibro=0;
  if(!$("#libro").val()){
    xlibro=0;
  }else{
    xlibro=$("#libro").val();
  };
  var xfolio=0;
  if(!$("#folio").val()){
    xfolio=0;
  }else{
    xfolio=$("#folio").val();
  };
  
  var xfechan=$("#fechan").val();
  //var sexo($('input:radio[name=sexo]:checked').val()
      var xsexo=document.getElementsByName("sexo");
    // Recorremos todos los valores del radio button para encontrar el
    // seleccionado
    for(var i=0;i<xsexo.length;i++)
    {
        if(xsexo[i].checked)
            xsexo=xsexo[i].value;
    }

  var xdomicilio=$("#domicilio").val();
  var xlocalidad=$("#localidad").val();
  var xtelfijo=$("#telfijo").val();
  var xtelcelu=$("#telcelu").val();
  var xfechan=$("#fechan").val();
  
  var xemail=$("#email").val();

    console.log('presiono enviar- ahora el mensaje');
    if(xdni==0){
        alert ('faltan datos'+xdni+xapellido);
    }else{
//    alert(xdni +','+xapellido+','+
//   	xnombre+','+xsexo+','+xdomicilio+','+xlocalidad+','+
//   	xtelfijo+','+xtelcelu+','+xfechan
// 	  +','+xlibro+','+xfolio+','+xemail);


                                   
//alert('va a grabar');
     $.ajax({                        
        type: "POST",                 
        url: "alumnos/graba_alumno.php",                    
        data: $("#formulario").serialize(),
         async: false,
        success: function(data)            
        {
          $('#reabajo').html(data);   
          console.log('enviando datos de ALUMNO..');     
        },
        error: function(data) {
         $("#reabajo").text(data + " Fallo el Alta");
         console.log('no se completo el envio');

     }
      });
    }//fin SI

 
}//fin graba_alumno
  function actualizaprofe(){

  var xdni=0;
  if(!$("#dni").val()){
      xdni=0;
  }else{
      xdni=$("#dni").val();
  };
  var xlegajo=0;
    if(!$("#legajo").val()){
        xlegajo=0;
    }else{
        xlegajo=$("#legajo").val();
    }
  var xapellido=$("#apellido").val();
  var xnombre=$("#nombre").val();
  //var sexo($('input:radio[name=sexo]:checked').val()
      var xsexo=document.getElementsByName("sexo");
    // Recorremos todos los valores del radio button para encontrar el
    // seleccionado
    for(var i=0;i<xsexo.length;i++)
    {
        if(xsexo[i].checked)
            xsexo=xsexo[i].value;
    }

  var xdomicilio=$("#domicilio").val();
  var xlocalidad=$("#localidad").val();
  var xtelfijo=$("#telfijo").val();
  var xtelcelu=$("#telcelu").val();
  var xfechan=$("#fechan").val();
  var xfechai=$("#fechai").val();
  var xfechad=$("#fechad").val();
  var xemail=$("#email").val();

    console.log('presiono enviar- ahora el mensaje');
    if((xdni==0)||(xapellido=='')||(xnombre=='')||(xtelcelu=='')||(xfechan=='')){
        alert('faltan datos!!');}else{
  /* alert(xdni +','+ xlegajo+','+xapellido+','+
      xnombre+','+xsexo+','+xdomicilio+','+xlocalidad+','+
      xtelfijo+','+xtelcelu+','+xfechan+','+xfechai+','+xfechad);
*/

                                   
/*alert('va a actualizar');*/
    $.ajax({                        
       type: "POST",                 
       url: "buscar/actualizaprofe.php",                    
       data: $("#formulario2").serialize(),
        
       success: function(data)            
       {
         $('#reabajo').html(data);   
         console.log('actualizando datos del PROFE..');     
       },
       error: function(data) {
        $("#reabajo").text(data + " Fallo  la Actualizacion");
        console.log('no se completo el envio');

    }
     });
                                }

 
}

function actualizar_alumno(){

var xdni=0;
if(!$("#dni").val()){
xdni=0;
}else{
xdni=$("#dni").val();
};
var xlegajo=0;
if(!$("#legajo").val()){
  xlegajo=0;
}else{
  xlegajo=$("#legajo").val();
}
var xapellido=$("#apellido").val();
var xnombre=$("#nombre").val();
//var sexo($('input:radio[name=sexo]:checked').val()
var xsexo=document.getElementsByName("sexo");
// Recorremos todos los valores del radio button para encontrar el
// seleccionado
for(var i=0;i<xsexo.length;i++)
{
  if(xsexo[i].checked)
      xsexo=xsexo[i].value;
}

var xdomicilio=$("#domicilio").val();
var xlocalidad=$("#localidad").val();
var xtelfijo=$("#telfijo").val();
var xtelcelu=$("#telcelu").val();
var xfechan=$("#fechan").val();
var xemail=$("#email").val();
var xlibro=$("#libro").val();
var xfolio=$("#folio").val();

console.log('presiono enviar- ahora el mensaje');
if((xdni==0)||(xapellido=='')||(xnombre=='')||(xtelcelu=='')||(xfechan=='')){
  alert('faltan datos!!');}else
{
    // alert(xdni +','+xapellido+','+
    // xnombre+','+xsexo+','+xdomicilio+','+xlocalidad+','+
    // xtelfijo+','+xtelcelu+','+xfechan+','+xemail+','+
    // xlibro+','+xfolio);


                                
    /*alert('va a actualizar ALUMNO');*/
    $.ajax({                        
        type: "POST",                 
        url: "alumnos/actualiza_alumno.php",                    
        data: $("#formulario3").serialize(),
    
        success: function(data)            
            {
                $('#reabajo').html(data);   
                console.log('actualizando datos. de ALUMNO');     
            },
        error: function(data) 
            {
                $("#reabajo").text(data + " Fallo  la Actualizacion");
                console.log('no se completo el envio');

            }
        });
}
}

    function altaprofe(){
        //alert('si');
        console.log('carga alta de profe');
        $("#abajo").load('buscar/altaprofe.php');
        $("#reabajo").load('carreras/blanco.php');
        //$("#abajo").load('prueba.html');
    }
    function alta_alumno(){
        //alert('si');
        console.log('carga alta de Alumno');
        $("#abajo").load('alumnos/alta_alumno.php');
        $("#reabajo").load('carreras/blanco.php');
        //$("#abajo").load('prueba.html');
    }
    function materias(){
        $("#abajo").load('carreras/materia_listado.php');
        $("reabajo").html('');
        console.log('cargando Alta Alumnos ');
    }
    function materias_profe(){
        $("#abajo").load('profesores/materia_listado.php');
        $("reabajo").load('carreras/blanco.php');
        console.log('cargando MIS materias');
    }
          function ingresar(){
            var xusuario = $('#usuario').val();
            var xclave = $('#clave').val();
            console.log(xusuario + ' ' +xclave);

            $('#ingreso').html(`<abbr title="Cargando"><div class="button-loader" style="margin: 0px 20px 0px 20px">
                            <svg class="button-spinner" width="calc(1em - 1px)" height="calc(1em - 1px)" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                                <circle class="button-path" fill="none" stroke="white" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
                            </svg>
                        </div></abbr>`);

            $.post("func/func_usuarios.php",{func: "validate", usuario: xusuario, clave: xclave
            }, function( data ) {
                $( "#abajo" ).html( data );
                $('#ingreso').html('Ingreso');//renombro el boton para detener el spinner
                //$('#login').html('nada');//reemplazo los datos en la capa login

            });
            /*
            ESTO SERIA ENVIAR UNA SEGUNDA FUNCION AL HACER CLICK.. ESTA BUENO!
            $.post("func_usuarios.php",{func: "nivel", usuario: xusuario, clave: xclave
            }, function( data ) {
                $( "#usuarios" ).load( data );

            });
            $( "#usuarios" ).html(''); */

        }

    </script>
