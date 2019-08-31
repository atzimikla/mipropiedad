<?PHP
session_start();
session_unregister($_SESSION['user']); 
session_destroy();
echo '<script>alert("Usted acaba de salir del sistema de forma segura");</script>';
echo '<script>window.location="../index.html"</script>';
?>