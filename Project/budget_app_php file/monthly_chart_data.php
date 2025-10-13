<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$user_id = $_POST['user_id'] ?? '';
$month = $_POST['month'] ?? '';
$year = $_POST['year'] ?? '';
$type = $_POST['type'] ?? ''; 

if (!$user_id || !$month || !$year || !$type) {
    echo json_encode(["status" => "error", "message" => "Missing parameters"]);
    exit;
}

if ($type == 'expense') {
    $table = 'fd_amount_exp';
    $categoryField = 'cat_name';
} else if ($type == 'income') {
    $table = 'fd_amount_income';
    $categoryField = 'cat_name'; 
} else {
    echo json_encode(["status" => "error", "message" => "Invalid type"]);
    exit;
}

// Fetch data grouped by category for the specific month and year
$sql = "SELECT $categoryField as category, SUM(amount) as amount 
        FROM $table 
        WHERE userid = ? 
        AND MONTH(date) = ? 
        AND YEAR(date) = ?
        GROUP BY $categoryField 
        ORDER BY amount DESC";

$stmt = $con->prepare($sql);
$stmt->bind_param("sii", $user_id, $month, $year);
$stmt->execute();
$result = $stmt->get_result();

$data = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = [
            "category" => $row['category'],
            "amount" => (float)$row['amount']
        ];
    }
    echo json_encode(["status" => "success", "data" => $data]);
} else {
    echo json_encode(["status" => "success", "data" => []]);
}

$stmt->close();
$con->close();
?>