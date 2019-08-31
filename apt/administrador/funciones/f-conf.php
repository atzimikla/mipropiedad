<?php
include("../conexion.php");

$id = $_POST ['autor'];
 
if ( $_REQUEST['GCE'] == "Guardar" )
{
	if($_FILES['logo']['size']>1){
	$carpeta = "../images/";	
	opendir($carpeta);
	$destino = $carpeta.$_FILES['logo']['name'];	
	$foto = $_FILES['logo']['name'];
	copy($_FILES['logo']['tmp_name'], $destino);
	
	mysql_query("UPDATE edificio SET nombre = '$_POST[nombre]', direccion = '$_POST[direccion]' , nit = '$_POST[nit]', telefono = '$_POST[telefono]', locales = '$_POST[propiedades]', admin_val = '$_POST[valor]', interes = '$_POST[interes]', nom_admin = '$_POST[nom_admin]', tel_admin = '$_POST[tel_admin]', cel_admin = '$_POST[cel_admin]', fecha_mod = '$_POST[fecha]', logo = '$foto', val_total = '$_POST[valor_total]', area_total = '$_POST[area_total]', consecutivo = '$_POST[consecutivo]', liquidacion = '$_POST[liquidacion]'   WHERE id = '$_POST[edificioid]'");
	
	}else{	
	
	mysql_query("UPDATE edificio  SET nombre = '$_POST[nombre]', direccion = '$_POST[direccion]', nit = '$_POST[nit]', telefono = '$_POST[telefono]', locales = '$_POST[propiedades]', admin_val = '$_POST[valor]', interes = '$_POST[interes]', nom_admin = '$_POST[nom_admin]', tel_admin = '$_POST[tel_admin]', cel_admin = '$_POST[cel_admin]', fecha_mod = '$_POST[fecha]', val_total = '$_POST[valor_total]', area_total = '$_POST[area_total]', consecutivo = '$_POST[consecutivo]', liquidacion = '$_POST[liquidacion]'   WHERE id = '$_POST[edificioid]'");
	
	}    	
       header ("Location: ../edificio.php");
        
} 


 
 
   
?>