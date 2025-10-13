<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$user_id = $_POST['user_id'] ?? '';
$year = $_POST['year'] ?? '';

if (!$user_id) {
    echo json_encode(["status" => "error", "message" => "User ID missing"]);
    exit;
}

if ($year == "0" || $year == "") {
    $sql = "SELECT SUM(amount) as total FROM fd_amount_exp WHERE userid = '$user_id'";
} else {
    $sql = "SELECT SUM(amount) as total FROM fd_amount_exp WHERE userid = '$user_id' AND YEAR(date) = '$year'";
}

$result = $con->query($sql);
$row = $result->fetch_assoc();

$total = $row['total'] ?? 0;

echo json_encode(["status" => "success", "total" => $total]);
?>