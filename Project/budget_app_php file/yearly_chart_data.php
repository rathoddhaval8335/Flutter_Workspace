<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include "connect.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_POST['user_id'] ?? '';
    $year = $_POST['year'] ?? '';
    $type = $_POST['type'] ?? 'expense';

    if (empty($user_id) || empty($year)) {
        echo json_encode([
            "status" => "error",
            "message" => "User ID and Year are required"
        ]);
        exit;
    }

    // Choose table name
    $table_name = ($type == 'income') ? 'fd_amount_income' : 'fd_amount_exp';
    $category_column = 'cat_name';
    $amount_column = 'amount';
    $date_column = 'date';

    try {
       $sql = "SELECT $category_column as category, SUM($amount_column) as amount 
        FROM $table_name 
        WHERE userid = ? AND YEAR($date_column) = ? 
        GROUP BY $category_column 
        ORDER BY amount DESC";

        $stmt = $con->prepare($sql);
        $stmt->bind_param("ss", $user_id, $year);
        $stmt->execute();
        $result = $stmt->get_result();

        $data = [];
        $total_amount = 0;

        while ($row = $result->fetch_assoc()) {
            $amount = floatval($row['amount']);
            $data[] = [
                "category" => $row['category'],
                "amount" => $amount
            ];
            $total_amount += $amount;
        }

        echo json_encode([
            "status" => "success",
            "total_amount" => $total_amount,
            "data" => $data
        ]);

    } catch (Exception $e) {
        echo json_encode([
            "status" => "error",
            "message" => "Database error: " . $e->getMessage()
        ]);
    }
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid request method"
    ]);
}

$con->close();
?>
