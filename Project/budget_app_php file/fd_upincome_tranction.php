<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";
$income_id  = $_POST['income_id'] ?? '';
$amount = $_POST['amount'] ?? '';
$date = $_POST['date'] ?? '';

if(empty($income_id) || empty($amount) || empty($date)) {
    echo json_encode([
        "success" => false,
        "message" => "All fields are required."
    ]);
    exit;
}

// Prepare update statement
$sql = "UPDATE fd_amount_income SET amount = ?, date = ? WHERE income_id = ?";
$stmt = $con->prepare($sql);

if($stmt) {
    $stmt->bind_param("ssi", $amount, $date, $income_id); // amount & date = string, income_id = int
    if($stmt->execute()) {
        echo json_encode([
            "success" => true,
            "message" => "Transaction updated successfully."
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
