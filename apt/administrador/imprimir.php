<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">		
        <title>Factura</title>
	<script>
	function printpage()
	{
	  var Obj = document.getElementById("desaparece");
	  Obj.style.visibility = 'hidden';
	  window.print();
	}
	</script>
	<link rel="STYLESHEET" type="text/css" href="css/estilo.css">
	<link rel="STYLESHEET" type="text/css" href="css/estilo-imprimir.css" media="print">	
    </head>
	
	<body>
	
	

<input type="button" id="desaparece" value="Print this page" onclick="printpage()" />
	

<?
include("conexion.php");
$mesf = $_GET["mesf"];
mysql_query("UPDATE meses_facturados  SET impresa = '1'   WHERE id = '$mesf'");

$year = date(Y);
$month = date(m);
$day = date(d);

$edisql = mysql_query("SELECT * FROM edificio");
$edificio = mysql_fetch_array($edisql);

$prosql = mysql_query("SELECT * FROM propietarios ORDER BY indicador ASC");

while($propiedad = mysql_fetch_array($prosql)){

echo "<div class='wrapper-imp'>";
echo "<div class='header-imp'><div class='title'>";
echo "<h1>Cuenta de cobro  N° 000</h1>";
echo "<h2>Edificio la cumbre</h2>";

echo "</div><div class='logo2'><img src='images/logoa.png' /></div></div>";
echo "<section class='section-imp'><table cellspacing='0' class='info'><tr>";
echo "<td class='nombre'>NOMBRE: ", $propiedad["nombre"], " ", $propiedad["apellido"], "</td>";
echo "<td>FECHA:  ", $year, " / ", $month, " / ", $day, "</td>";
echo "</tr>";
echo "<tr>";
echo "<td>NIT:</td>";
echo "<td>TELÉFONO:</td>";
echo "</tr>";
echo "<tr>";
echo "<td>DIRECCIÓN:</td>";
echo "<td>N° APARTAMENTO:  ", $propiedad["indicador"] , "</td>";
echo "</tr>";					
echo "<tr>";
echo "<td rowspan='3' VALIGN=TOP>VALOR EN LETRAS:</td>";
echo "<td class='color'>SUBTOTAL:</td>";
echo "</tr>";
echo "<tr>";
echo "<td class='color'>IVA:</td>";
echo "</tr>";
echo "<tr>";
echo "<td class='color'>TOTAL:</td>";
echo "</tr>";
echo "</table>";
echo "<div class='box'>";
echo "<div class='box1'>";
echo "<p>Favor consignar en la cuenta del banco ....</p><br> Ahorros";
echo "</div>";
echo "<div class='box2'>";
echo "<p>Acepto y obligo a pagar:</p>";
echo "<hr>";
echo "<span>Firma / C.C. o NIT</span>";
echo "</div>";
echo "</div>";
echo "</section>";
echo "</div> <!-- FIN WRAPPER -->";						
					
}

?>


				
		
	

	</body>
</html>
