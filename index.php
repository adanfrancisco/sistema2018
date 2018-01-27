<!DOCTYPE html>
<html>
	<head>
		<?php include 'links_css.php';?>
		<script type="text/javascript">
			$(document).ready
				(function() 
			{
					$("#usuarios").load('func/nivel.php');
					//este anda bien
					$("#ingreso").click(function(event) 
					{
						
						ingresar();
						location.reload();
					});
			
			}	);

		</script>
		
<title>IS93-GESTION</title>
	</head>
	<body>
<!-- inicio de page-->
		<div class="page">
			<div class="card" align="center">
				<h3 class="roboto color-blue">
					Sistema de Gestion
				</h3>

				<div id="login">
						<?php 
						session_start();
							if(empty($_SESSION['usuario_nombre'])) {
							include('login.php');
						}else{
							?>
								<p>Hola <strong>
								<?php echo $_SESSION['usuario_nombre'];?>
                                    </strong> | <a href="logout.php">Salir</a></p>
									<hr>
									<?php
									 echo 
									 //$_SESSION['dni'].'-'.
									 $_SESSION['apellido'].', '.
									 $_SESSION['nombre'];
									?>
									

							<?php
							}
						?>
				</div>
		</div>
			<div id="usuario" class="card" >
				<div id=usuarios class="dos" ></div>
			</div>
				<div id="abajos" class="card" align="center">
					<div id="abajo" class="dos" align="center"></div>
				</div>
				<div id="aa" class="card" align="center">
					<div id="reabajo" class="dos" align="center"></div>
				</div>
			</div>
		
<!-- fin de page-->

		<div class="notif-panel"></div>

		<?php
			include 'js/funciones_js.php';
			include 'links_js.php';
		?>
	</body>
</html>