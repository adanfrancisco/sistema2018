<?php

 require("class.phpmailer.php");
 require("class.smtp.php");
 
 $aviso=$_POST['xaviso'];
 $ddni=$_POST['ddni'];
 $fecha= date("d-m-Y ");;
 $usuario=$_SESSION['usuario_id'];

 //echo 'hola';
// // // Valores enviados desde el formulario
// // if ( !isset($_POST["nombre"]) || !isset($_POST["email"]) || !isset($_POST["mensaje"]) ) {
// //     die ("Es necesario completar todos los datos del formulario");
// // }
$nombre = $usuario;//$_POST["nombre"];
$email ='mimail@mimail.com';// $_POST["email"];
$mensaje ='Mensaje para dni '.$ddni.' - '. $aviso;//$_POST["mensaje"];

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

$mail->Subject = "DonWeb - Ejemplo de formulario de contacto"; // Este es el titulo del email.
$mensajeHtml = nl2br($mensaje);
$mail->Body = "{$mensajeHtml} <br /><br />Formulario de ejemplo. By DonWeb<br />"; // Texto del email en formato HTML
//$mail->AltBody = "{$mensaje} \n\n Formulario de ejemplo By DonWeb"; // Texto sin formato HTML
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