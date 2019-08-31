<?php
session_start();
include("../conexion.php");
if ( $_REQUEST['GP'] == "Guardar" ){
	mysql_query("UPDATE propietarios  SET nombre = '$_POST[nombre]', apellido = '$_POST[apellido]', cedula = '$_POST[cedula]', direccion = '$_POST[direccion]', telefono = '$_POST[telefono]', celular = '$_POST[celular]', correo = '$_POST[correo]', indicador = '$_POST[num_pro]', area = '$_POST[area_apt]', autor = '$_POST[autor]', fecha_mod = '$_POST[fecha]'   WHERE id = '$_POST[editid]'");
       header ("Location: ../admin-propietarios.php" );
} 

if ( $_REQUEST['AP'] == "Aplicar" ){
	mysql_query("UPDATE propietarios  SET nombre = '$_POST[nombre]', apellido = '$_POST[apellido]', cedula = '$_POST[cedula]', direccion = '$_POST[direccion]', telefono = '$_POST[telefono]', celular = '$_POST[celular]', correo = '$_POST[correo]', indicador = '$_POST[num_pro]', area = '$_POST[area_apt]', autor = '$_POST[autor]', fecha_mod = '$_POST[fecha]'   WHERE id = '$_POST[editid]'");
       header ("Location: ../edit-propietario.php?editid=". $_POST["editid"] );        
} 
?>