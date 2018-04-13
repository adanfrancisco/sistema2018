<?php
    session_start();
    include('../acceso_db.php'); // incluímos los datos de conexión a la BD

$divide=$_POST['tabla'];
$_SESSION['idcursolectivo']=$divide;



$options=array();
//echo $options; 

$consultacurso="select * from mat_pro inner join materia on materia.id_materia=mat_pro.materia inner join profesores on mat_pro.profesores=profesores.dni where curso_lectivo_id=".$divide." order by materia_nombre";

        if ($resultado = $con->query($consultacurso)){
if($resultado->num_rows > 1){
 echo '<table>
 <tr>
    <th>Nro</th>
    <th>DNI</th>
    <th>Apellido</th>
    <th>Materia</th>
    <th>Modulos</th>
     <th>Grupo</th>
 </tr>';}
            
            $grupo = array("  ","CURRICULAR","GRUPO -1 -","GRUPO -2 -");
            
         $i=0;
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                $i++;
                echo '<tr>
                    <td align="center">'.$i.'</td>
                    <td>'.$fila['dni'].'</td>
                    <td>'.$fila['apellido'].'</td>
                    <td>'.$fila['materia_nombre'].'</td>
                    <td align="center">'.$fila['modulos'].'</td>
                    <td align="center">'.$grupo[$fila['grupo']].'</td>
                    
                </tr>';
$_SESSION['grupo']=$fila['grupo'];
            }echo '</table>';

        }   

/*
$consultacurso="select * from materia  where materia_curso =".$_SESSION['curso']." order by materia_nombre";

        if ($resultado = $con->query($consultacurso)){
if($resultado->num_rows > 1){
 echo '<table>
 <tr>
    <th>Nro</th>
    <th>DNI</th>
    <th>Apellido</th>
    <th>Materia</th>
    <th>Modulos</th>
 </tr>';}
         $i=0;
            while ($fila = $resultado->fetch_array(MYSQLI_BOTH)) 
            {
                $i++;
                echo '<tr>
                    <td align="center">'.$i.'</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td align="center">'.$fila['materia_nombre'].'</td>
                </tr>';

            }echo '</table>';

        }   
*/
?>
    