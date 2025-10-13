<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

// Sabhi categories fetch karna, type condition hata di
$sql = "SELECT id, cat_icon, cat_name,cat_type FROM fd_category";
$stmt = $con->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

if (count($data) > 0) {
    echo json_encode(["status" => "success", "data" => $data]);
} else {
    echo json_encode(["status" => "empty", "message" => "No categories found"]);
}

$stmt->close();
$con->close();
?>
