<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
$cat_name = isset($_POST['cat_name']) ? trim($_POST['cat_name']) : '';
$cat_type = isset($_POST['cat_type']) ? trim($_POST['cat_type']) : '';
$cat_icon = isset($_POST['cat_icon']) ? intval($_POST['cat_icon']) : 0;

if ($id <= 0 || $cat_name == '' || $cat_type == '') {
    echo json_encode(["status" => "error", "message" => "Invalid input"]);
    exit;
}

$sql = "UPDATE fd_category SET cat_name = ?, cat_type = ?, cat_icon = ? WHERE id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("ssii", $cat_name, $cat_type, $cat_icon, $id);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Category updated successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to update category"]);
}

$stmt->close();
$con->close();
?>
