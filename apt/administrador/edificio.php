<?php session_start(); if($_SESSION['adminid'] == "" ){ header('Location: index.html'); } ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <title>Configuración General</title>	
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
 	    <?php
            	include("conexion.php");
                $global = mysql_query("SELECT * FROM edificio WHERE id = '$_SESSION[edificioid]' ");
                $configuracion = mysql_fetch_array($global);
                if($configuracion["logo"] <> ""){
                echo '<img src="images/'. $configuracion["logo"] .'" height="50" >';
                }
            ?>
            
 	    <br/>
	    <h1>Configuración</h1>
	    <form action="#" name="menu" method="POST" enctype="multipart/form-data" >	
	    <div class="nav_obtion">
	    <input type="submit" onclick = "this.form.action = 'funciones/f-conf.php'" value="Guardar" name="GCE" class="guardar"/>
	    <a href="administrador.php" class="cancelar">Cancelar</a>
	    </div> <!-- FINE NAV_OBTION -->
	    <article class="article">
    	        <?php
                echo "<input  type='hidden' name='autor' value='", $_SESSION["adminid"] ,"'>"; 
                echo "<input  type='hidden' name='edificioid' value='". $_SESSION["edificioid"] ."'>";
                $hoy = date("Y-m-d H:i:s"); 
                echo "<input  type='hidden' name='fecha' value='", $hoy  ,"'>";
		?>
                <label>Nombre del edificio:</label>
                <input name='nombre' value='<?php echo $configuracion["nombre"]; ?>' required>
                      
		<label>Direcci&oacute;n del edificio: </label>
                <input name='direccion' value='<?php echo $configuracion["direccion"]; ?>' required>  <br/><br/><br/>
                      
 		<label>Nit: </label>
                <input name='nit' value='<?php echo $configuracion["nit"]; ?>' required > 
                      
                <label>Tel&eacute;fono: </label>
                <input name='telefono' value='<?php echo $configuracion["telefono"]; ?>' required>  <br/><br/><br/>
                      
                <label>N&uacute;mero de Propiedades: </label>
                <input name='propiedades' value='<?php echo $configuracion["locales"]; ?>' required>    
                      
                <label>Valor de la Administraci&oacute;n: </label>
                <input name='valor' value='<?php echo $configuracion["admin_val"]; ?>' required>   <br/><br/><br/>
                    
                <label>Interes (%): </label>
                <input name='interes' value='<?php echo $configuracion["interes"]; ?>' required> 
                      
                <label>Nombre del Administrador: </label>
                <input name='nom_admin' value='<?php echo $configuracion["nom_admin"]; ?>' required> <br/><br/><br/>
                      
                <label>Tel&eacute;no del Administrador: </label>
                <input name='tel_admin' value='<?php echo $configuracion["tel_admin"]; ?>' required>
                      
                <label>Celular del Administrador: </label>
                <input name='cel_admin' value='<?php echo $configuracion["cel_admin"]; ?>' required> <br/><br/><br/>
                      
                <label>Valor a recaudar mensual: </label>
                <input name='valor_total' value='<?php echo $configuracion["val_total"]; ?>' required>
                      
                <label>Area total (Metros<sup>2</sup>): </label>
                <input name='area_total' value='<?php echo $configuracion["area_total"]; ?>' required>  <br/><br/><br/>
                                                      
                <label>Consecutivo: </label>
                <input name='consecutivo' value='<?php echo $configuracion["consecutivo"]; ?>' required> 
                
                <label>Liquidación: </label>
                <select name="liquidacion" required>
                <?php 
                if($configuracion["liquidacion"] == '1'){
                echo '<option value="1"> Cuota Fija </option>';
                echo '<option value="2"> Area </option>';
                }else{
                echo '<option value="2"> Area </option>';
                echo '<option value="1"> Cuota Fija </option>';
                
                }
                ?>
                
                
                </select>  <br/><br/><br/>
                      
		<label>Logo: </label>	 
                <input type='file' name='logo'><br/><br/><br/>
            </article>
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
			menuElements.insertAdjacentHTML('afterBegin','<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true"><i aria-hidden="true" class="icon-menu"> </i> Menu</button>');

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
