<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$id = $_POST['id'] ?? '';
$amount = $_POST['amount'] ?? '';
$date = $_POST['date'] ?? '';

if(empty($id) || empty($amount) || empty($date)) {
    echo json_encode([
        "success" => false,
        "message" => "All fields are required."
    ]);
    exit;
}
//$sql = "UPDATE fd_amount_exp SET amount = ?, date = ? WHERE cat_name = ?";
$sql = "UPDATE fd_amount_exp SET amount = ?, date = ? WHERE id = ?";
$stmt = $con->prepare($sql);

if($stmt) {
    $stmt->bind_param("sss", $amount, $date, $id);
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
