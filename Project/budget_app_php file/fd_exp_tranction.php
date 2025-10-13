<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userid = $_POST['userid'] ?? '';
    $month = $_POST['month'] ?? '';   
    $year = $_POST['year'] ?? '';   

    if (empty($userid)) {
        echo json_encode([
            "success" => false,
            "message" => "User ID is required"
        ]);
        exit;
    }

    // Manual month mapping (integer values)
    $monthNames = [
        "JAN" => 1,
        "FEB" => 2,
        "MAR" => 3,
        "APR" => 4,
        "MAY" => 5,
        "JUN" => 6,
        "JUL" => 7,
        "AUG" => 8,
        "SEP" => 9,
        "OCT" => 10,
        "NOV" => 11,
        "DEC" => 12
    ];

    $month = strtoupper($month); 
    $monthNumber = $monthNames[$month] ?? 1; // default January if invalid
    $year = (int)$year;

    // Query with integer month/year
    $query = "SELECT id, cat_icon, cat_name, amount, date, userid 
              FROM fd_amount_exp 
              WHERE userid = ? 
              AND MONTH(date) = ? 
              AND YEAR(date) = ?
              ORDER BY date DESC, id DESC";

    $stmt = $con->prepare($query);
    $stmt->bind_param("iii", $userid, $monthNumber, $year); // integer params
    $stmt->execute();
    $result = $stmt->get_result();

    $data = [];
    while ($row = $result->fetch_assoc()) {
        $timestamp = strtotime($row['date']);
        $dayName = date('l', $timestamp);

        $data[] = [
            "id" => $row['id'],
            "cat_icon" => $row['cat_icon'],
            "cat_name" => $row['cat_name'],
            "amount" => $row['amount'],
            "date" => date('Y-m-d', $timestamp),
            "day" => $dayName
        ];
    }

    echo json_encode(["success" => true, "data" => $data]);

    $stmt->close();
    $con->close();
} else {
    echo json_encode([
        "success" => false,
        "message" => "Invalid request method"
    ]);
}
?>
