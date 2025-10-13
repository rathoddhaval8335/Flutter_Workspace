<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$id = $_POST['id'] ?? '';

if(empty($id)) {
    echo json_encode([
        "success" => false,
        "message" => "ID is required."
    ]);
    exit;
}

$sql = "DELETE FROM fd_amount_exp WHERE id = ?";
$stmt = $con->prepare($sql);

if($stmt) {
    $stmt->bind_param("s", $id); // <-- bind ID here
    if($stmt->execute()) {
        echo json_encode([
            "success" => true,
            "message" => "Transaction deleted successfully."
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Error executing query: ".$stmt->error
        ]);
    }
    $stmt->close();
} else {
    echo json_encode([
        "success" => false,
        "message" => "Error preparing query: ".$con->error
    ]);
}

$con->close();
?>
