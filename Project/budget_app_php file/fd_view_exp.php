<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");
///http://localhost/BUDGET_APP/fd_view_income.php?userid=2
include "connect.php";

$userid = $_POST['userid'] ?? $_GET['userid'] ?? '';

if ($userid == '') {
    echo json_encode(["status" => "error", "message" => "User ID missing"]);
    exit;
}
    
$sql = "SELECT id, cat_icon, cat_name FROM fd_expense_cat WHERE userid = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("s", $userid);
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
