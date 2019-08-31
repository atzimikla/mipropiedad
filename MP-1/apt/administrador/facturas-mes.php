<?
include("conexion.php");
$ano = 2013;
$mes = 10;
echo "Facturación del mes: 10 / 2013<br><br>";

$facmessql = mysql_query("SELECT * FROM facturacion WHERE mes = '$mes' AND ano = '$ano'");
while($factura = mysql_fetch_array($facmessql)){
$ind = $factura ["idicador"];
$prosql = mysql_query("SELECT * FROM propietarios WHERE  indicador = '$ind'");
$propietario = mysql_fetch_array($prosql);
echo "Apt/local: ", $ind, " propietario:", $propietario["nombre"], " ", $propietario["apellido"];
if($factura["vencido"] == 0){
echo "valor a pagar: 100.000";
}else{
echo "valor a pagar: 120.000";
}


}

?>