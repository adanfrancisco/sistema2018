<?php
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD

?>   
    <SELECT NAME="personas">
        <option>USUARIOS  ...............    lista</option>
        <?php 
            $consulta="select * from usuarios";
        if ($resultado = $con->query($consulta)) 
        {
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                echo'<OPTION    VALUE="'.$fila['usuario_nombre'].'">'.$fila['usuario_nombre'].'</OPTION>    ';
            }
        }   
        // liberar el conjunto de resultados 
        $resultado->close();
        
        ?>
    </SELECT>

    <?php
        
       
        // if(isset($_POST['enviar'])) {
            
        //     if($_POST['usuario_clave'] != $_POST['usuario_clave_conf']) {
        //         echo "Las contraseñas ingresadas no coinciden. <a   href='javascript:history.back();'>Reintentar</a>";
                
        //     }else {
        //         $usuario_nombre = $_POST['usuario_nombre'];
        //         $usuario_clave = ($_POST["usuario_clave"]);
        //         $usuario_clave = md5($usuario_clave); // encriptamos la nueva contraseña    con md5
        //         echo $usuario_clave;
        //         $sql = $con->query("UPDATE usuarios SET     usuario_clave='".$usuario_clave."' WHERE    usuario_nombre='".$usuario_nombre."'");
        //         if($sql) {
        //             echo '$("#reabajo").text('Contraseña cambiada correctamente')';
                    
        //         }else {
        //             echo "Error: No se pudo cambiar la contraseña. <a   href='javascript:history.back();'>Reintentar</a>";
        //         }


?>
