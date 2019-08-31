<?php
session_start();
include("conexion.php");

$rs = mysql_query("SELECT MAX(fecha) AS fecha FROM meses_facturados WHERE edificio_id = '$_SESSION[edificioid]' ");
$row = mysql_fetch_row($rs);
$ultimafac = trim($row[0]);

$nuevafecha = strtotime ( '+1 month' , strtotime ( $ultimafac ) ) ;
$nuevafecha = date ( 'Y-m-d' , $nuevafecha );

mysql_query("INSERT INTO meses_facturados (fecha, edificio_id) VALUES ('$nuevafecha',  '$_SESSION[edificioid]' )");

$valsql = mysql_query("SELECT * FROM edificio WHERE id = '$_SESSION[edificioid]' ");
$valoradmin = mysql_fetch_array($valsql);

if($valoradmin["liquidacion"] == '1'){
$consecutivo =  $valoradmin["consecutivo"];
$prosql = mysql_query("SELECT * FROM propietarios WHERE edificio_id = '$_SESSION[edificioid]' ");
while($propietario = mysql_fetch_array($prosql)){
$consecutivo = $consecutivo + 1;
mysql_query("INSERT INTO facturacion (fecha, propietario_id, valor, factura) VALUES ('$nuevafecha', '$propietario[id]', '$valoradmin[admin_val]', '$consecutivo')");
}

mysql_query("UPDATE edificio  SET consecutivo  = '$consecutivo' WHERE id = '$_SESSION[edificioid]'");

}else{
// si es por metro cuadrado 
}

header ("Location: facturacion.php");

?>