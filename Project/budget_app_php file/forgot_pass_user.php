<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

error_reporting(0);
include "connect.php";
$email = $_POST['email'] ?? '';
$new_password = $_POST['new_password'] ?? '';

if (empty($email) || empty($new_password)) {
    echo json_encode(["status" => false, "message" => "Email and password are required"]);
    exit;
}

// Check if email exists
$check_sql = "SELECT id FROM fd_register WHERE email = ?";
$check_stmt = $con->prepare($check_sql);
$check_stmt->bind_param("s", $email);
$check_stmt->execute();
$result = $check_stmt->get_result();

if ($result->num_rows == 0) {
    echo json_encode(["status" => false, "message" => "Email not found"]);
    exit;
}

// Update password
$update_sql = "UPDATE fd_register SET password = ? WHERE email = ?";
$update_stmt = $con->prepare($update_sql);
$update_stmt->bind_param("ss", $new_password, $email);

if ($update_stmt->execute()) {
    echo json_encode(["status" => true, "message" => "Password updated successfully"]);
} else {
    echo json_encode(["status" => false, "message" => "Failed to update password"]);
}

$con->close();
?>