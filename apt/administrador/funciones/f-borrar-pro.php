<?
include("../conexion.php");



if(isset($_POST["propietario"]) ) {
    $delete = $_POST["propietario"];
    $cantidad = count($delete);
    for ($i="0"; $i<$cantidad; $i++) { 
         $del_id = $delete[$i];
         $sql = "DELETE FROM propietarios WHERE id='$del_id'";
         $result = mysql_query($sql);
    }
     header("Location: ../admin-propietarios.php?id=". $_POST["id"]);  
     exit(); 
}


    header('Location: ../admin-propietarios.php?id='. $_POST["id"] );
?>