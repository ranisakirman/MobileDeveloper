<?php
include 'dbconnect.php';

$query = "SELECT nama, price, description, images FROM product";

$execute = mysqli_query($conn,$query);
$arrproduct = [];
while($row = mysqli_fetch_array($execute)){
	$arrproduct[] = $row;
}
print(json_encode($arrproduct));

?>