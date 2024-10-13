<?php
    $servername = "localhost";
    $dbname = "id21738780_project_2a";
    $password = "!234Asdf";
    $username= "id21738780_project_2a";
    
   $conn = new mysqli($servername, $username, $password, $dbname);
 
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
}
?>