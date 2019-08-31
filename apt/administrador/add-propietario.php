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
    <title>Nuevo propietario</title>	
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
	    <h1>Nuevo propietario</h1>
	    <form action="#" name="menu" method="POST" enctype="multipart/form-data" >	
	    <div class="nav_obtion">
		<input type="submit" onclick = "this.form.action = 'funciones/f-add.php'" value="Guardar" name="GP" class="guardar"/>
		<input type="submit" onclick = "this.form.action = 'funciones/f-add.php'" value="Aplicar" name="AP" class="aplicar"/>
		<a href="admin-propietarios.php" class="cancelar">Cancelar</a>
	    </div> <!-- FINE NAV_OBTION -->
	    <article class="article">             
                <?php
                echo "<input name='autor' value='", $_SESSION['adminid']  ,"' type='hidden'>"; 
                echo "<input name='fecha' value='", date("Y-m-d H:m:i")  ,"' type='hidden'>";     
                echo "<input name='edificio' value='", $_SESSION["edificioid"]  ,"' type='hidden'>";  
                ?>
                <label>Nombre: </label>
                <input name='nombre' type='text' required > 
                      
	        <label>Apellido: </label>
                <input name='apellido' type='text' required > <br>
                      
 		<label>Cedula: </label>
                <input name='cedula' type='text' required  >     
                      
                <label>Direcci&oacute;n: </label>
                <input name='direccion' type='text' required >     <br>
                      
                <label>Tel&eacute;fono: </label>
                <input name='telefono' type='text' required >   
                      
                <label>Celular: </label>
                <input name='celular' type='text' required >  <br>
                      
                <label>Correo: </label>
                <input name='correo' type='text' required > 
                      
                <label>N&uacute;mero propiedad: </label>
                <input name='num_pro' type='text' required required ><br>
                      
                <label>Area de la propiedad:</label>
		<input name='area_apt' type='text' required >
		<div style="clear:both;"></div>
		      
		 <hr>
		 <h1>Saldo Anterior</h1>
                      
                 <label>Valor Neto: </label>
                 <input name='saldo' type='text' required> 
                      
                 <label>Interes: </label>
                 <input name='interes' type='text' required> 
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

