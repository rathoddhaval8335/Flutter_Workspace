<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$user_id = isset($_POST['user_id']) ? intval($_POST['user_id']) : 0;

if ($user_id > 0) {
    // Only sum rows where amount is numeric, safely casting it
    $query = "SELECT SUM(CAST(amount AS DECIMAL(10,2))) AS total 
              FROM fd_amount_income 
              WHERE userid = ? AND amount REGEXP '^[0-9]+(\.[0-9]+)?$'";
              
    $stmt = $con->prepare($query);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();

    $total = $data['total'] !== null ? $data['total'] : 0;

    echo json_encode([
        "status" => "success",
        "total" => $total
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid or missing user_id"
    ]);
}
?>
