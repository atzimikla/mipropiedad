<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximun-scale=1"/>
		
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<!--[if lt IE 9]>
			<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
		<![endif]-->
		
        <title>Historial</title>	
		<link href="css/estilo.css" rel="stylesheet" type="text/css"/>
		<link href="css/menu.css" rel="stylesheet" type="text/css"/>
		<script src="js/modernizr.custom.js"></script>
    </head>
	
	<body>
		<div class="wrapper">
		
			<header>
        	    <?php
                require_once 'modulos/header.php';    
                mostrar_header();                        	
        	    ?>	
        	</header>

			<section>
				
				<h1>Historial</h1>
				
				<table cellspacing="0">
					<tr>
						<th>Indicador</th>
						<th>Nombre</th>
						<th>Saldo</th>
						<th>Factura</th>
						<th>Total</th>
						<th>Abonos</th>
						<th>Deuda</th>
					</tr>
					<?php
					include("conexion.php");
					$histsql = mysql_query("SELECT * FROM 
(SELECT *, IFNULL(Fact.Total_Fact + Sal.Total_Sal, Fact.Total_Fact ) AS Total FROM 
                        (SELECT propietario_id AS Pid, SUM(valor) AS Total_Fact, PP.nombre, PP.apellido, PP.indicador FROM facturacion F, propietarios PP WHERE propietario_id IN (SELECT id FROM propietarios WHERE edificio_id = '1') AND F.propietario_id = PP.id GROUP BY propietario_id) AS Fact
                        LEFT JOIN 
                        	(SELECT propietario_id AS id, IFNULL(valor, 0)  AS Total_Sal FROM saldo WHERE propietario_id IN (SELECT id FROM propietarios WHERE edificio_id = '1') GROUP BY propietario_id ) AS Sal 
                            ON
                            Fact.Pid = Sal.id GROUP BY Fact.Pid) AS Deuda
LEFT JOIN
	(SELECT propietario_id AS Aid, SUM(abono) AS abonos FROM pagos WHERE propietario_id IN (SELECT id FROM propietarios WHERE edificio_id = '1') GROUP BY propietario_id) AS Pagos
    ON
    Deuda.Pid = Pagos.Aid;         ");
		            while($nuevafac = mysql_fetch_array($histsql)){
		                echo "<tr>";
		                echo "<td>". $nuevafac["indicador"] ."</td><td>". $nuevafac["nombre"]. " ". $nuevafac["apellido"] ."</td><td>". $nuevafac["Total_Sal"] ."</td><td>".  $nuevafac["Total_Fact"] ."</td><td>" . $nuevafac["Total"]. "</td><td>" . $nuevafac["abonos"]. "</td><td>" . ($nuevafac["Total"] - $nuevafac["abonos"]). "</td>";
		                echo "</tr>";
		            }
					
					?>
				</table>
				
				<div class="page_navi">
					<p>Páginas</p>
				</div>
			</section>
			
		</div> <!-- FIN WRAPPER -->
		
		
		<script>
			//  The function to change the class
			var changeClass = function (r,className1,className2) {
				var regex = new RegExp("(?:^|\\s+)" + className1 + "(?:\\s+|$)");
				if( regex.test(r.className) ) {
					r.className = r.className.replace(regex,' '+className2+' ');
			    }
			    else{
					r.className = r.className.replace(new RegExp("(?:^|\\s+)" + className2 + "(?:\\s+|$)"),' '+className1+' ');
			    }
			    return r.className;
			};	

			//  Creating our button in JS for smaller screens
			var menuElements = document.getElementById('menu');
			menuElements.insertAdjacentHTML('afterBegin','<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true"><i aria-hidden="true" class="icon-menu"> </i> Menú</button>');

			//  Toggle the class on click to show / hide the menu
			document.getElementById('menutoggle').onclick = function() {
				changeClass(this, 'navtoogle active', 'navtoogle');
			}

			// http://tympanus.net/codrops/2013/05/08/responsive-retina-ready-menu/comment-page-2/#comment-438918
			document.onclick = function(e) {
				var mobileButton = document.getElementById('menutoggle'),
					buttonStyle =  mobileButton.currentStyle ? mobileButton.currentStyle.display : getComputedStyle(mobileButton, null).display;

				if(buttonStyle === 'block' && e.target !== mobileButton && new RegExp(' ' + 'active' + ' ').test(' ' + mobileButton.className + ' ')) {
					changeClass(mobileButton, 'navtoogle active', 'navtoogle');
				}
			}
		</script>
	</body>
</html>
