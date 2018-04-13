<?php
session_start();
//echo $_SESSION['nivel'];
if($_SESSION['nivel']=='1'||$_SESSION['nivel']=4){
      //  echo 'si';

//include('var.php');
include('../acceso_db.php');
?>

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
<!-- <script src="../js/jquery-1.4.4.min.js"></script> -->

<form  id="formulario" method="post" action="#" target="abajo" align-center > 
<div>
<br><input name="dni" id="dni" class="input-text align-center" style="padding: 0; width: 260px" type="number" id="clave" value="" maxlength="10" placeholder="N DOCUMENTO" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" onfocus="javascript:this.value='';" 
required="">

<input name="apellido" id="apellido" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="" maxlength="10" placeholder="APELLIDO" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" onfocus="javascript:this.value='';"
required="">

<input name="nombre" id="nombre" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="" maxlength="10" placeholder="NOMBRE" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" onfocus="javascript:this.value='';"
required="" >

<input name="fechan" id="fechan" class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="" maxlength="10" placeholder="NACIO EL 17/11/1973" style="text-transform:uppercase;" onKeyUp = "this.value=formateafecha(this.value);" onfocus="javascript:this.value='';"
required="">     
      
    <br><label>Masculino:</label> <input type="radio" name="sexo" value="1" checked>    
    <label>Femenino:</label> <input type="radio" name="sexo"  value="2">

<input name="domicilio" id="domicilio"class="input-text align-center" style="padding: 0; width: 260px" type="text" id="clave" value="" maxlength="60" placeholder="DOMICILIO CALLE NRO" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" onfocus="javascript:this.value='';">

    

   
    <SELECT NAME="localidad" id="localidad"class="input-text align-center" >
        <option >LOCALIDAD</option>
        <?php 
            $consulta="select * from localidad order by localidad";
        if ($resultado = $con->query($consulta)) 
        {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
                
            {
                echo'<OPTION VALUE="'.$fila['idlocalidad'].'">'.$fila['localidad'].'</OPTION>    ';
                echo $fila['localidad'];
            }
        
        }   
        // liberar el conjunto de resultados 
        //$resultado->close();
        
        ?>
       
    </SELECT>
<input name="telfijo" id="telfijo" class="input-text align-center" style="padding: 0; width: 260px" 
type="number"  value="" maxlength="10" placeholder="NRO FIJO" style="text-transform:uppercase;" 
onkeyup="javascript:this.value=this.value.toUpperCase();" onfocus="javascript:this.value='';">  

<input name="telcelu" id="telcelu" class="input-text align-center" style="padding: 0; width: 260px" 
type="text"  value="" maxlength="10" placeholder="NRO CELULAR" style="text-transform:uppercase;" 
onkeyup="javascript:this.value=this.value.toUpperCase();" onfocus="javascript:this.value='';">   

<input name="libro" id="libro" class="input-text align-center" style="padding: 0; width: 260px" 
type="text"  value="" maxlength="10" placeholder="LIBRO" onfocus="javascript:this.value='';">  

<input name="folio" id="folio" class="input-text align-center" style="padding: 0; width: 260px" 
type="number" id="clave" value="" maxlength="10" placeholder="FOLIO" onfocus="javascript:this.value='';">  

    
 <input name="email" id="email" alt="EMAIL" class="input-text align-center" style="padding: 0; width: 260px" type="email"  value="" maxlength="50" placeholder="mimail@mail.com" style="text-transform:lowercase;" onkeyup="javascript:this.value=this.value.toLowerCase();"  onfocus="javascript:this.value='';">  
 
 <input type=radio name="nada"  id="nada" required=""> 

</div>

<button class="input-submit-blue" id="btn_grabar"  onclick="graba_alumno()" >Grabar</button>	
<button class="input-submit-green" id="cerrar"  onclick="saleprofe()" >Cerrar</button>

    </form> 

    <?php
    
}else{
echo 'USTED no es ADMINISTRADOR <br><a href="index.php">Volver</a>';
}
    ?>