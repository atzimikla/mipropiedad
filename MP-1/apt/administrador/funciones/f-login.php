<?php
include("../conexion.php");
$usuario = stripslashes($_POST['usuario']);
$usuario = strip_tags($usuario);
$usuario = htmlentities($usuario);
$usuario = htmlspecialchars($usuario);
$contrasena = stripslashes($_POST['contrasena']);
$contrasena = strip_tags($contrasena);
$contrasena = htmlentities($contrasena);
$contrasena = htmlspecialchars($contrasena);
$contrasena = sha1($contrasena);

$query = mysql_query('SELECT * FROM administradores WHERE usuario = "'.mysql_real_escape_string($usuario).'" AND contrasena  = "'.mysql_real_escape_string($contrasena).'" COLLATE utf8_bin');

if($existe = mysql_fetch_array($query)){
    $aptsql = mysql_query("SELECT * FROM edificio WHERE admin_id = '$existe[id]' ");
    $propiedad = mysql_fetch_array($aptsql);
    session_start();
    $_SESSION['adminid'] = $existe["id"];
    $_SESSION['correocliente'] = $existe["correo"];
    $_SESSION['nombreadmin'] = $existe["nombre"];
    $_SESSION['edificioid'] = $propiedad["id"];
    header ("Location: ../administrador.php");
}else{
    echo '<script>alert("Los datos ingresados son incorrectos");</script>';
    echo '<script>window.location="../index.html"</script>';
}

?>