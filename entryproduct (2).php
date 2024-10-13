<?php
include 'dbconnect.php';

$nama = mysqli_real_escape_string($conn, $_POST["nama"]);
$price = mysqli_real_escape_string($conn, $_POST["price"]);
$description = mysqli_real_escape_string($conn, $_POST["description"]);
$promo = mysqli_real_escape_string($conn, $_POST["promo"]);
$images = mysqli_real_escape_string($conn, $_POST["images"]);

$query = "INSERT INTO product (nama, price, description, promo, images) 
          VALUES ('$nama','$price','$description','$promo','$images')";
$execute = mysqli_query($conn,$query);
if($execute>0){
    echo "new product successfully added";
}else{
    echo "new product failed added";
}
?>