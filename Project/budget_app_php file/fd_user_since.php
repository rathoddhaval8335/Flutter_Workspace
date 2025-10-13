<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");
include "connect.php";

// Your existing query
$sql = "SELECT *, DATE_FORMAT(created_at, '%d %b %Y') as formatted_date FROM fd_register";
$result = $con->query($sql);

$data = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

echo json_encode($data);
$con->close();
?>