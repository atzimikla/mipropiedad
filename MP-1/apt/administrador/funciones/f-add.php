<?php
session_start();
include("../conexion.php");
if ($_REQUEST['GP'] == "Guardar"){
    $clave = sha1($_POST["cedula"]);
    mysql_query("INSERT INTO propietarios (nombre, apellido, cedula, direccion, telefono, celular, correo, area, indicador, fecha_ini, autor, edificio_id, clave) VALUES ('$_POST[nombre]',  '$_POST[apellido]', '$_POST[cedula]', '$_POST[direccion]', '$_POST[telefono]', '$_POST[celular]', '$_POST[correo]', '$_POST[area_apt]', '$_POST[num_pro]', '$_POST[fecha]', '$_POST[autor]', '$_POST[edificio]','$clave' )");
	
    $rs = mysql_query("SELECT MAX(id) AS id FROM propietarios ");
    $row = mysql_fetch_row($rs);
    $editid = trim($row[0]);
	
    mysql_query("INSERT INTO saldo (propietario_id, valor, interes) VALUES ('$editid', '$_POST[saldo]', '$_POST[interes]')") ;
	
    //$correo = $_POST['correo'];
    //$cc = $_POST['cedula'];
    //$titulo = "Clave de acceso Propietario";
    //$cuerpo = "Bienvenido al sistema de propietarios Mi Unidad, en donde podras acceder con su usuario y contrasena a la plataforma: 
	
    //link: http://andres.fm/apartamentos/propietarios/
    //usuario: {$correo}
    //Contraseña: {$cc} 
    //";	
	
    //$cabeceras = 'From: admin@andres.fm' . "\r\n" .
//			'Sender: admin@andres.fm' . "\r\n" .
	//		'X-Mailer: PHP/' . phpversion();

//	mail($correo, $titulo, $cuerpo, $cabeceras);

    header ("Location: ../admin-propietarios.php" );    
} 

if ( $_REQUEST['AP'] == "Aplicar" ){
    $clave = sha1($_POST["cedula"]);
    mysql_query("INSERT INTO propietarios (nombre, apellido, cedula, direccion, telefono, celular, correo, area, indicador, fecha_ini, autor, edificio_id, clave) VALUES ('$_POST[nombre]',  '$_POST[apellido]', '$_POST[cedula]', '$_POST[direccion]', '$_POST[telefono]', '$_POST[celular]', '$_POST[correo]', '$_POST[area_apt]', '$_POST[num_pro]', '$_POST[fecha]', '$_POST[autor]', '$_POST[edificio]','$clave' )");
	
    $rs = mysql_query("SELECT MAX(id) AS id FROM propietarios ");
    $row = mysql_fetch_row($rs);
    $editid = trim($row[0]);
	
    mysql_query("INSERT INTO saldo (propietario_id, valor, interes) VALUES ('$editid', '$_POST[saldo]', '$_POST[interes]')") ;
	
//    $correo = $_POST['correo'];
//    $cc = $_POST['cedula'];
//	$titulo = "Clave de acceso Propietario";
//	$cuerpo = "Bienvenido al sistema de propietarios Mi Unidad, en donde podras acceder con su usuario y contrasena a la plataforma: 
	
//	usuario: {$correo}
//	Contraseña: {$cc} 
	
//	";	
	
//	$cabeceras = 'From: admin@andres.fm' . "\r\n" .
//			'Sender: admin@andres.fm' . "\r\n" .
//			'X-Mailer: PHP/' . phpversion();

//	mail($correo, $titulo, $cuerpo, $cabeceras);
	
	
       header ("Location: ../edit-propietario.php?&editid=". $editid );
        
} 

if ( $_REQUEST['GPA'] == "Guardar" ){		
    mysql_query("INSERT INTO pagos (propietario_id, abono, fecha_ini) VALUES ('$_POST[propietario]',  '$_POST[abono]', '$_POST[fecha]' )");
    header ("Location: ../facturacion.php" );
        
} 

 
   
?>