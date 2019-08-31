<?

include("../conexion.php");

$usuario = stripslashes($_POST['usuario']);
$usuario = strip_tags($usuario);
$usuario = htmlentities($usuario);
$usuario = htmlspecialchars($usuario);
$contrasena = stripslashes($_POST['contrasena']);
$contrasena = strip_tags($contrasena);
$contrasena = htmlentities($contrasena);
$contrasena = htmlspecialchars($contrasena);

$query = mysql_query('SELECT * FROM propietarios WHERE correo = "'.mysql_real_escape_string($usuario).'" AND cedula = "'.mysql_real_escape_string($contrasena).'" COLLATE utf8_bin');


if($existe = mysql_fetch_array($query))
{
	        session_start();
		$_SESSION['user'] = $existe["id"];
		header ("Location: ../administrador.php?id=". $existe["id"]);


}else{
	echo '<script>alert("Los datos ingresados son incorrectos");</script>';
	echo '<script>window.location="../index.html"</script>';
	
}

?>