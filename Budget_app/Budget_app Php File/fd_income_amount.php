<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");
include "connect.php";

$user_id   = $_POST['user_id'] ?? '';
$cat_icon  = $_POST['cat_icon'] ?? '';
$cat_name  = $_POST['cat_name'] ?? '';
$amount    = $_POST['amount'] ?? '';
$note      = $_POST['note'] ?? '';
$date      = $_POST['date'] ?? '';

if(empty($user_id) || empty($cat_name) || empty($amount)) {
    echo json_encode(["status"=>"error", "message"=>"Required fields missing"]);
    exit;
}

$sql = "INSERT INTO fd_amount_income (userid, cat_icon, cat_name, amount, note, date)
        VALUES (?, ?, ?, ?, ?, ?)";

$stmt = $con->prepare($sql);
$stmt->bind_param("ssssss", $user_id, $cat_icon, $cat_name, $amount, $note, $date);

if($stmt->execute()){
    echo json_encode(["status"=>"success", "message"=>"Expense added successfully"]);
} else {
    echo json_encode(["status"=>"error", "message"=>"Failed to add expense"]);
}
?>
