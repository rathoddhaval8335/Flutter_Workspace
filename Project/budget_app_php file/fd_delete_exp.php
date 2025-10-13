<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$id = $_POST['id'] ?? '';
$userid = $_POST['userid'] ?? '';

if (empty($id) || empty($userid)) {
    echo json_encode(["status" => "error", "message" => "Missing parameters"]);
    exit;
}

$sql = "DELETE FROM fd_expense_cat WHERE id = ? AND userid = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("ss", $id, $userid);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo json_encode(["status" => "success", "message" => "Category deleted successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Delete failed or record not found"]);
}

$stmt->close();
$con->close();
?>
