<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$user_id = isset($_POST['user_id']) ? intval($_POST['user_id']) : 0;
$month = isset($_POST['month']) ? $_POST['month'] : '';
$year = isset($_POST['year']) ? $_POST['year'] : '';

if ($user_id > 0 && !empty($month) && !empty($year)) {
    // Convert month to two-digit format if needed
    $month = str_pad($month, 2, '0', STR_PAD_LEFT);
    
    // Query to sum income for specific month and year
    $query = "SELECT SUM(CAST(amount AS DECIMAL(10,2))) AS total 
              FROM fd_amount_income 
              WHERE userid = ? 
              AND YEAR(date) = ? 
              AND MONTH(date) = ? 
              AND amount REGEXP '^[0-9]+(\.[0-9]+)?$'";
              
    $stmt = $con->prepare($query);
    $stmt->bind_param("iss", $user_id, $year, $month);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();

    $total = $data['total'] !== null ? $data['total'] : 0;

    echo json_encode([
        "status" => "success",
        "total" => $total,
        "month" => $month,
        "year" => $year
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid or missing parameters",
        "user_id" => $user_id,
        "month" => $month,
        "year" => $year
    ]);
}
?>