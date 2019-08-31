<? session_start(); ?>
<? $var = stripslashes($_GET['id']); $var = strip_tags($var); $var = htmlentities($var); $var = htmlspecialchars($var);
if($_SESSION['user'] == $var &&  $_SESSION['user'] != "" ){  }else{ header('Location: index.html'); } ?>
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
		
        <title>T&iacute;tulo de la p&aacute;gina</title>	
		<link href="../administrador/css/estilo.css" rel="stylesheet" type="text/css"/>
		<link href="../administrador/css/menu.css" rel="stylesheet" type="text/css"/>
		<script src="../administrador/js/modernizr.custom.js"></script>
		
    </head>
	
	<body>
		<div class="wrapper">
		
			<header>
				<?
                        	require_once '../administrador/modulos/header.php';    
                        	mostrar_header();                        	
	                 ?>
			</header>

			<section>
			
				<aside>
					<ul class="menu">
						<li><a href="edificio.php?id=<? echo $var ?>"><span class="icon2"><img src="images/cog.png"></span>Configuraci&oacute;n</a></li>
						<li><a href="admin-propietarios.php?id=<? echo $var ?>"><span class="icon2"><img src="images/office.png"></span>Propietarios</a></li>
						<li><a href="#"><span class="icon2"><img src="images/alarm.png"></span>Historial</a></li>
						<li><a href="facturacion.php?id=<? echo $var ?>"><span class="icon2"><img src="images/file.png"></span>Facturaci&oacute;n</a></li>
					</ul>
				</aside>
				
				<article>
					
					<h1>Estad&iacute;sticas</h1>
					
					<table cellspacing="0">
						<tr>
							<th></th>
							<th>Nombre</th>
							<th>Fecha</th>
							<th>Valor</th>
						</tr>
						<tr>
							<td> <input type="checkbox"> </td>
							<td> <a href="">Nombre completo</a> </td>
							<td> 25/10/2013 </td>
							<td> $89.330 </td>
						</tr>
						<tr>
							<td> <input type="checkbox"> </td>
							<td> <a href="">Nombre completo</a> </td>
							<td> 25/10/2013 </td>
							<td> $89.330 </td>
						</tr>
						<tr>
							<td> <input type="checkbox"> </td>
							<td> <a href="">Nombre completo</a> </td>
							<td> 25/10/2013 </td>
							<td> $89.330 </td>
						</tr>
						<tr>
							<td> <input type="checkbox"> </td>
							<td> <a href="">Nombre completo</a> </td>
							<td> 25/10/2013 </td>
							<td> $89.330 </td>
						</tr>
						<tr>
							<td> <input type="checkbox"> </td>
							<td> <a href="">Nombre completo</a> </td>
							<td> 25/10/2013 </td>
							<td> $89.330 </td>
						</tr>
						<tr>
							<td> <input type="checkbox"> </td>
							<td> <a href="">Nombre completo</a> </td>
							<td> 25/10/2013 </td>
							<td> $89.330 </td>
						</tr>
					</table>
					
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
			menuElements.insertAdjacentHTML('afterBegin','<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true"><i aria-hidden="true" class="icon-menu"> </i> Men¨²</button>');

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

