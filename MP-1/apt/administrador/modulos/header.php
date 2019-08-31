 <?php
function mostrar_header(){
   echo '<div class="logo">';
   echo '<a href="admin.php"></a>'; 
   echo '</div> <!-- FIN LOGO -->
				<nav id="menu" class="nav">					
					<ul>
						<li>
							<a href="administrador.php">
								<span class="icon">
									<i aria-hidden="true" class="icon-inicio"></i>
								</span>
								<span>Inicio</span>
							</a>
						</li>
						<li>
							<a href="edificio.php">
								<span class="icon"> 
									<i aria-hidden="true" class="icon-confi"></i>
								</span>
								<span>Configuraci&oacute;n</span>
							</a>
						</li>
						<li>
							<a href="admin-propietarios.php">
								<span class="icon">
									<i aria-hidden="true" class="icon-prop"></i>
								</span>
								<span>Propietarios</span>
							</a>
						</li>
						<li>
							<a href="historial.php">
								<span class="icon">
									<i aria-hidden="true" class="icon-hist"></i>
								</span>
								<span>Reportes</span>
							</a>
						</li>
						<li>
							<a href="facturacion.php">
								<span class="icon">
									<i aria-hidden="true" class="icon-fact"></i>
								</span>
								<span>Facturaci&oacute;n</span>
							</a>
						</li>
						<li>
							<a href="funciones/f-logout.php">
								<span class="icon">
									<i aria-hidden="true" class="icon-salir"></i>
								</span>
								<span>Salir</span>
							</a>
						</li>
					</ul>
				</nav>';
    
}
?>
     