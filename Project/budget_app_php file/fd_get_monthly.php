<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$userid = $_POST['userid'] ?? '';

if (empty($userid)) {
    echo json_encode([
        "status" => "error",
        "message" => "User ID missing"
    ]);
    exit;
}

$query = "SELECT cat_name, budget, remaining FROM fd_budget WHERE userid = ? AND cat_name = 'Monthly Budget' LIMIT 1";
$stmt = $con->prepare($query);
$stmt->bind_param("i", $userid);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();

    echo json_encode([
        "status" => "success",
        "data" => $row
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "No Monthly Budget found"
    ]);
}

$stmt->close();
$con->close();
?>
