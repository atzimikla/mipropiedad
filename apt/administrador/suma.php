<?
include("conexion.php");
$result = mysql_query('SELECT SUM(valor) AS total FROM  facturacion'); 
$row = mysql_fetch_assoc($result); 
echo $row['total'];

?>