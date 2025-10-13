<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
include "connect.php";

$response = [];

$query = "SELECT SUM(amount) AS total_income FROM fd_amount_income";
$result = mysqli_query($con, $query);

if ($result) {
    $row = mysqli_fetch_assoc($result);
    $response['status'] = 'success';
    $response['total_income'] = (float)($row['total_income'] ?? 0);
} else {
    $response['status'] = 'error';
    $response['message'] = mysqli_error($con);
}

echo json_encode($response, JSON_PRETTY_PRINT);
mysqli_close($con);
?>
