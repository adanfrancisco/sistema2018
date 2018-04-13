
<?php
session_start();
//echo 'nivel'.$_SESSION['nivel'];

if($_SESSION['nivel']==1||$_SESSION['nivel']==4|| $_SESSION['nivel']==2){

$xxdni=$_POST['xxdni'];
$xxdni=(int)$xxdni;

    include('../acceso_db.php'); // incluímos los datos de conexión a la BD
//busco el profe
 $consulta = $con->query("SELECT dni,legajo,apellido,nombre,fecha_nac,fecha_ing_escuela,
 fecha_ing_doc,domicilio, p.localidad, email, telefono, celular FROM profesores as p
    inner join localidad
    on p.localidad=localidad.idlocalidad
    WHERE dni=$xxdni
  ");
 $filas= $consulta->num_rows;
 //echo $filas;

    while($resultados = $consulta->fetch_array(MYSQLI_BOTH))
          {
            
            $dni=$resultados['dni'];
            $legajo=$resultados['legajo'];
            $apellido = $resultados['apellido'];
            $nombre = $resultados['nombre'];
            $fechan=$resultados['fecha_nac'];
            $fechai=$resultados['fecha_ing_escuela'];
            $fechad=$resultados['fecha_ing_doc'];
            $domicilio=$resultados['domicilio'];
            $localidad_local=$resultados['localidad'];
            $email=$resultados['email'];
            $telefono=$resultados['telefono'];
            $telcelu=$resultados['celular'];
          }

?>

<!-- <script src="../js/jquery-1.4.4.min.js"></script> -->
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

function formateafecha(fecha) 
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
<form  id="formulario2" method="post" action="#" target="abajo"> 
<div>
 EDITANDO REGISTRO - cuidado!
 <? echo $localidad; ?>

<br><input name="dni" id="dni" value="<?=$dni ?>" class="input-text align-center" style="padding: 0; width: 260px" type="number" id="clave"  maxlength="10" placeholder="N DOCUMENTO" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" ;" 
required="">

<input name="legajo" id="legajo" class="input-text align-center" style="padding: 0; width: 260px" type="number" id="clave" value="<?=$legajo ?>" maxlength="10" placeholder="NRO LEGAJO" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();";">

<input name="apellido" id="apellido" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="<?=$apellido ?>" maxlength="10" placeholder="APELLIDO" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" ;"
required="">

<input name="nombre" id="nombre" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="<?=$nombre ?>" maxlength="50" placeholder="NOMBRE" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" ;"
required="" >

    <a name="edicion"></a>
      
    <br><label>Masculino:</label> <input type="radio" name="sexo" value="1" checked>    
    <label>Femenino:</label> <input type="radio" name="sexo"  value="2">

<input name="domicilio" id="domicilio"class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="<?=$domicilio ?>" maxlength="60" placeholder="DOMICILIO CALLE NRO" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" ;">

    

   
    <SELECT NAME="localidad" id="localidad"class="input-text align-center" >
        <option >LOCALIDAD</option>
        <?php 
            $consulta="select * from localidad order by localidad";
        if ($resultado = $con->query($consulta)) 
        {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
                
            {
                echo'<OPTION VALUE="'.$fila['idlocalidad'].'">'.$fila['localidad'].'</OPTION>    ';
                //echo $fila['localidad'];
            }
 
        
        }   
        // liberar el conjunto de resultados 
        //$resultado->close();
        
        ?>
       
    </SELECT>
    <script>
            $("#localidad").val(<?=$localidad_local?>);
        </script>

<input name="telfijo" id="telfijo" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="<?=$telefono;?>" maxlength="10" placeholder="NRO FIJO" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" ;"
required="">  

<input name="telcelu" id="telcelu" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="<?=$telcelu ?>" maxlength="10" placeholder="NRO CELULAR" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" ;"
required="">   

<input name="fechan" id="fechan" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="<?=$fechan ?>" maxlength="10" placeholder="NACIO EL 17/11/1973" style="text-transform:uppercase;" onKeyUp = "this.value=formateafecha(this.value);" ;"
required=""> 
    
<input name="fechai" id="fechai" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="<?=$fechai ?>" maxlength="10" placeholder="ING ESCUELA 17/11/1973" style="text-transform:uppercase;" onKeyUp = "this.value=formateafecha(this.value);" ;"> 

<input name="fechad" id="fechad" alt="FECHA DE INGRESO A LA DOCENCIA" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="<?=$fechad ?>" maxlength="10" placeholder="ING. DOC. 17/11/1973" style="text-transform:uppercase;" onKeyUp = "this.value=formateafecha(this.value);" ;"> 

 <input name="email" id="email" alt="EMAIL" class="input-text align-center" style="padding: 0; width: 260px" type="email"  value="<?=$email ?>" maxlength="50" placeholder="mimail@mail.com" style="text-transform:lowercase;" onkeyup="javascript:this.value=this.value.toLowerCase();"  ;">  
 <input type=radio name="nada"  id="nada" required=""> 

</div>

<button class="input-submit-blue" id="btn_actualizar"  onclick="actualizaprofe()" >Grabar</button>  
<button class="input-submit-green" id="cerrar"  onclick="saleprofe()" >Cerrar</button>

    </form> 

<?php 

}else{echo '<br>Usted No tiene privilegios para editar';}

 ?>