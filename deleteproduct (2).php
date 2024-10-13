<?php
include_once 'dbconnect.php';
if(isset($_POST["id"])){
    $id = $_POST["id"];
    
}else return;
$query = "DELETE FROM product WHERE id = '$id' ";
$execute = mysqli_query($conn,$query);
$arrproduct = [];
if($execute){
    $arrproduct ["success"]="true";
    
}else{
$arrproduct ["success"]="false";
}
print(json_encode($arrproduct));
?>