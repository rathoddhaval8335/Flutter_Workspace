<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$user_id = $_POST['user_id'] ?? '';

if (empty($user_id)) {
    echo json_encode([
        'status' => 'error',
        'message' => 'User ID is required'
    ]);
    exit;
}

// Use prepared statement for security
// Replace 'fd_amount_inc' with your actual income table name
$stmt = $con->prepare("SELECT cat_name, amount FROM fd_amount_income WHERE userid = ?");
$stmt->bind_param("s", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

if (!empty($data)) {
    echo json_encode([
        'status' => 'success',
        'data' => $data
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'No income records found',
        'data' => []
    ]);
}

$stmt->close();
$con->close();
?>