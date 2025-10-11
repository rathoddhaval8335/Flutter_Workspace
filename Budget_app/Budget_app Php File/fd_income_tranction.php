<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userid = isset($_POST['userid']) ? $_POST['userid'] : '';

    if (empty($userid)) {
        echo json_encode([
            "success" => false,
            "message" => "User ID is required"
        ]);
        exit;
    }

    $query = "SELECT income_id, cat_icon, cat_name, amount, date, userid 
              FROM fd_amount_income 
              WHERE userid = ? 
              ORDER BY date DESC, income_id DESC";

    $stmt = $con->prepare($query);
    $stmt->bind_param("s", $userid);
    $stmt->execute();
    $result = $stmt->get_result();

    $data = [];
    while ($row = $result->fetch_assoc()) {
        // Calculate day name from date
        $timestamp = strtotime($row['date']);
        $dayName = date('l', $timestamp); // e.g. Monday, Tuesday

        $data[] = [
            "income_id" => $row['income_id'],               // <-- id included for Flutter use
            "cat_icon" => $row['cat_icon'],
            "cat_name" => $row['cat_name'],
            "amount" => $row['amount'],
            "date" => date('d M', $timestamp), // e.g. 09 Oct
            "day" => $dayName
        ];
    }

    echo json_encode([
        "success" => true,
        "data" => $data
    ]);

    $stmt->close();
    $con->close();
} else {
    echo json_encode([
        "success" => false,
        "message" => "Invalid request method"
    ]);
}
?>
