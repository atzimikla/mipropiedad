<?php session_start(); if($_SESSION['adminid'] == "" ){ header('Location: index.html'); } ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <title>Propietarios</title>	
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximun-scale=1"/>		
    
    <!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->		
    <!--[if lt IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
		
    <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    <link href="css/menu.css" rel="stylesheet" type="text/css"/>
    <script src="js/modernizr.custom.js"></script>
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"></script>
    <script>
	$(document).ready(function() {
    	    $('#example').DataTable();
	} );
    </script>
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
	    <h1>Propietarios</h1>
	    <form name="propietario" method="post"  enctype="multipart/form-data">
	    <div class="nav_obtion">		
		<a href="add-propietario.php" class="nuevo" > Nuevo</a>  
		<input type='submit' onclick=this.form.action='funciones/f-borrar-pro.php' class="borrar" value="Borrar" />
	    </div> <!-- FINE NAV_OBTION -->
	    <table id="example" class="display" cellspacing="0" width="100%">
		<thead>
		    <tr>
			<th></th>
			<th>Nombre</th>
			<th>Apartamento/Local</th>
			<th>Celular</th>
			<th>Historial/Pagos</th>
		    </tr>
		</thead>	
		<tfoot>
		    	<th></th>
			<th>Nombre</th>
			<th>Apartamento/Local</th>
			<th>Celular</th>
			<th>Historial/Pagos</th>
		</tfoot>
		<tbody>
			<?php
			include("conexion.php");
			echo "<input type='hidden' name='id' value='". $_GET['id']. "'>";
			$prosql = mysql_query("SELECT * FROM propietarios WHERE edificio_id = '$_SESSION[edificioid]' ORDER BY indicador ASC");
			while($propiedad = mysql_fetch_array($prosql)){
			echo "<tr>";
		 	echo "<td class='check'><input  type='checkbox' name='propietario[]' id='propietario[]' value='", $propiedad["id"], "'></td>";
			echo "<td><a href='edit-propietario.php?&editid=", $propiedad["id"] ,"'>", $propiedad["nombre"], " ", $propiedad["apellido"],  " </a></td> <td>", $propiedad["indicador"], "</td><td>", $propiedad["celular"], "</td>";
			echo "<td><a href='historial-propietario.php?editid=", $propiedad["id"] ,"'>Ver +</a></td></tr>";
			}
			?>
		</tbody>					
	    </table>
	    </form>
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



    