<?php

 require("class.phpmailer.php");
 require("class.smtp.php");
 
 $aviso=$_POST['xaviso'];
 $ddni=$_POST['ddni'];
 $fecha= date("d-m-Y ");;
 $usuario=$_SESSION['usuario_id'];

 //busco al profe para poner su nombre
 include('../acceso_db.php');
$sql="SELECT * FROM profesores where dni=".$ddni;
if ($resultado = $con->query($sql)){    
  
    while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
              {$nombre_profe =$fila['apellido'].', '.$fila['nombre'];}
   
  
      }
  
 
$nombre = $usuario;//$_POST["nombre"];
$email ='noresponder@institutosuperior93.com';// $_POST["email"];
$mensaje ='El Profesor '.$ddni.' - '.$nombre_profe.'-<br>'.$aviso;//$_POST["mensaje"];

// Datos de la cuenta de correo utilizada para enviar vía SMTP
$smtpHost = "c0990267.ferozo.com";  // Dominio alternativo brindado en el email de alta 
$smtpUsuario = "info@institutosuperior93.com";  // Mi cuenta de correo
$smtpClave = "Is939393";  // Mi contraseña

// Email donde se enviaran los datos cargados en el formulario de contacto
$emailDestino = "adanfrancisco@gmail.com";

$mail = new PHPMailer();
$mail->IsSMTP();
$mail->SMTPAuth = true;
$mail->Port = 587; 
$mail->IsHTML(true); 
$mail->CharSet = "utf-8";

// VALORES A MODIFICAR //
$mail->Host = $smtpHost; 
$mail->Username = $smtpUsuario; 
$mail->Password = $smtpClave;

$mail->From = $email; // Email desde donde envío el correo.
$mail->FromName = $nombre;
$mail->AddAddress($emailDestino); // Esta es la dirección a donde enviamos los datos del formulario

$mail->Subject = "AVISO is93"; // Este es el titulo del email.
$mensajeHtml = nl2br($mensaje);
$mail->Body = "{$mensajeHtml} <br /><br />Enviado desde nuestro sistema web.<br />"; // Texto del email en formato HTML
$mail->AltBody = "{$mensaje} \n\n Enviado desde nuestro sistema web."; // Texto sin formato HTML
// FIN - VALORES A MODIFICAR //

$mail->SMTPOptions = array(
    'ssl' => array(
        'verify_peer' => false,
        'verify_peer_name' => false,
        'allow_self_signed' => true
    )
);

$estadoEnvio = $mail->Send(); 
if($estadoEnvio){
    echo "El correo fue enviado correctamente.";
} else {
    echo "Ocurrió un error inesperado.";
}

?>