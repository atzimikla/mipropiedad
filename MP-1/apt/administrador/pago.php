<?php session_start(); if($_SESSION['adminid'] == "" ){ header('Location: index.html'); } ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
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
    <title>Nuevo Pago</title>	
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
	    <h1>Nuevo Pago</h1>
	    <form action="#" name="menu" method="POST" enctype="multipart/form-data" >	
	    <div class="nav_obtion">
		<input type="submit" onclick = "this.form.action = 'funciones/f-add.php'" value="Guardar" name="GPA" class="guardar"/>
		 <a href="facturacion.php" class="cancelar">Cancelar</a>
	    </div> <!-- FINE NAV_OBTION -->				
	    <article class="article">
		<label>Pago realizado:</label>
		<input type="number" name="abono" required>
		
		<?php
		include("conexion.php");
		echo "<input name='autor' value='", $_SESSION['adminid']  ,"' type='hidden'>"; 
                echo "<input name='fecha' value='", date("Y-m-d H:m:i")  ,"' type='hidden'>";     
                echo "<input name='edificio' value='", $_SESSION["edificioid"]  ,"' type='hidden'>";  
                
		$propiesql = mysql_query("SELECT * FROM propietarios WHERE edificio_id = '$_SESSION[edificioid]'");
		echo "<label>Propiedad:</label>";
		echo "<select name='propietario' required>";
		echo "<option value=''>Seleccionar</option>";
		while($propiedad = mysql_fetch_array($propiesql)){
		echo "<option value='", $propiedad["id"] ,"'>", $propiedad["indicador"], "</option>";
		}
		echo "</select>";
		?>
                </form>
	    </article>
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



