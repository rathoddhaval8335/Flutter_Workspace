<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

// Query all users from fd_register table
$sql = "SELECT id, name, email, mobile_no FROM fd_register";
$result = $con->query($sql);

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

if (count($data) > 0) {
    echo json_encode(["status" => "success", "data" => $data]);
} else {
    echo json_encode(["status" => "empty", "message" => "No users found"]);
}

$con->close();
?>
