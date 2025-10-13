<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$userid = $_GET['userid'] ?? $_POST['userid'] ?? '';
$month = $_GET['month'] ?? $_POST['month'] ?? '';

if (empty($userid)) {
    echo json_encode(["error" => "User ID is required"]);
    exit();
}

// If month is not provided, use current month
if (empty($month)) {
    $month = date('M Y');
}

// Convert month name to date format for SQL (e.g., "Oct 2025" -> "2025-10-%")
$monthDate = DateTime::createFromFormat('M Y', $month);
if (!$monthDate) {
    echo json_encode(["error" => "Invalid month format"]);
    exit();
}
$monthYear = $monthDate->format('Y-m');
$monthPattern = $monthYear . '-%';

// Fetch all budget categories for this user and specific month
$stmt = $con->prepare("SELECT id, userid, cat_id, cat_name, cat_icon, remaining, budget, month 
                        FROM fd_budget 
                        WHERE userid = ? AND month = ?
                        ORDER BY 
                            CASE 
                                WHEN cat_name = 'Monthly Budget' THEN 1 
                                ELSE 2 
                            END, 
                            id ASC");
$stmt->bind_param("ss", $userid, $month);
$stmt->execute();
$result = $stmt->get_result();

$data = [];

while ($row = $result->fetch_assoc()) {
    $catName = $row['cat_name'];
    $budgetId = $row['id'];
    $budget = (float)$row['budget'];

    // Get total expenses for this user, category, and specific month
    $stmt2 = $con->prepare("SELECT SUM(amount) AS total_amount 
                            FROM fd_amount_exp 
                            WHERE cat_name = ? AND userid = ? AND date LIKE ?");
    $stmt2->bind_param("sss", $catName, $userid, $monthPattern);
    $stmt2->execute();
    $res2 = $stmt2->get_result();
    $amountRow = $res2->fetch_assoc();
    $totalAmount = (float)($amountRow['total_amount'] ?? 0);

    // Calculate remaining
    $remaining = $budget - $totalAmount;

    // Update remaining in fd_budget
    $stmtUpdate = $con->prepare("UPDATE fd_budget SET remaining = ? WHERE id = ?");
    $stmtUpdate->bind_param("di", $remaining, $budgetId);
    $stmtUpdate->execute();
    $stmtUpdate->close();
    $stmt2->close();

    $data[] = [
        "id" => $row['id'],
        "userid" => $row['userid'],
        "cat_id" => $row['cat_id'],
        "cat_name" => $row['cat_name'],
        "cat_icon" => $row['cat_icon'],
        "budget" => $budget,
        "remaining" => $remaining,
        "month" => $row['month']
    ];
}

$stmt->close();
$con->close();

// Return updated budget data with remaining
echo json_encode($data);
?>