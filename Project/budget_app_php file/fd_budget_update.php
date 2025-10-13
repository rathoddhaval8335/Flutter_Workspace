<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php"; 

$id = $_POST['id'] ?? '';
$new_budget = $_POST['budget'] ?? '';

if(empty($id) || empty($new_budget)){
    echo json_encode([
        "status" => "error",
        "message" => "ID or budget missing"
    ]);
    exit;
}

// Update budget and remaining columns for given ID
$sql = "UPDATE fd_budget SET budget=?, remaining=? WHERE id=?";
$stmt = $con->prepare($sql);
$stmt->bind_param("ddi", $new_budget, $new_budget, $id);

if($stmt->execute()){
    echo json_encode([
        "status" => "success",
        "message" => "Budget and remaining updated successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to update budget"
    ]);
}

$stmt->close();
$con->close();
?>
