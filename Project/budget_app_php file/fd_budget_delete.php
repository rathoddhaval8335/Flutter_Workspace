<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php"; // DB connection

$catName = $_POST['cat_name'] ?? '';

if (empty($catName)) {
    echo json_encode([
        "status" => "error",
        "message" => "Category name missing"
    ]);
    exit;
}

// Delete based on cat_name
$sql = "DELETE FROM fd_budget WHERE cat_name = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("s", $catName);

if ($stmt->execute()) {
    echo json_encode([
        "status" => "success",
        "message" => "Category deleted successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to delete category"
    ]);
}

$stmt->close();
$con->close();
?>
