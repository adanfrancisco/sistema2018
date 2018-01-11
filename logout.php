<?php
    session_start();
    //include('acceso_db.php'); // incluímos los datos de acceso a la BD
    // comprobamos que se haya iniciado la sesión
    if(isset($_SESSION['usuario_nombre'])) {
        $_SESSION['nivel']=0;
        //session_start();
        session_destroy();
        header("Location: index.php");
    }else {
        session_destroy();
        echo "Operación incorrecta.";
        //header("Location: index.php");
    }
?> 