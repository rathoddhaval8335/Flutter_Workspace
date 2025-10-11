<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

// Get POST data
$userid = $_POST['userid'] ?? '';
$cat_icon = $_POST['cat_icon'] ?? '';
$cat_name = $_POST['cat_name'] ?? '';

if ($userid != '' && $cat_name != '' && $cat_icon != '') {
    $stmt = $con->prepare("INSERT INTO fd_expense_cat (userid, cat_icon, cat_name) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $userid, $cat_icon, $cat_name);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Category added successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to add category"]);
    }

    $stmt->close();
} else {
    echo json_encode(["status" => "error", "message" => "All fields are required"]);
}

$con->close();
?>
