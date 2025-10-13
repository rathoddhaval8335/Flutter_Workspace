<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$user_id = $_POST['user_id'] ?? '';
$year = $_POST['year'] ?? '';

if (!$user_id) {
    echo json_encode(["status" => "error", "message" => "User ID missing"]);
    exit;
}

// Initialize variables
$income_sql = "";
$expense_sql = "";

if ($year == "0" || $year == "") {
    // Fetch all years data
    $income_sql = "SELECT DATE_FORMAT(date, '%b') AS month, 
                          YEAR(date) AS year,
                          SUM(amount) AS total_income 
                   FROM fd_amount_income 
                   WHERE userid = '$user_id'
                   GROUP BY YEAR(date), MONTH(date) 
                   ORDER BY YEAR(date), MONTH(date)";
    
    $expense_sql = "SELECT DATE_FORMAT(date, '%b') AS month, 
                           YEAR(date) AS year,
                           SUM(amount) AS total_expense 
                    FROM fd_amount_exp 
                    WHERE userid = '$user_id'
                    GROUP BY YEAR(date), MONTH(date) 
                    ORDER BY YEAR(date), MONTH(date)";
} else {
    // Fetch specific year data
    $income_sql = "SELECT DATE_FORMAT(date, '%b') AS month, 
                          YEAR(date) AS year,
                          SUM(amount) AS total_income 
                   FROM fd_amount_income 
                   WHERE userid = '$user_id' AND YEAR(date) = '$year'
                   GROUP BY MONTH(date) 
                   ORDER BY MONTH(date)";
    
    $expense_sql = "SELECT DATE_FORMAT(date, '%b') AS month, 
                           YEAR(date) AS year,
                           SUM(amount) AS total_expense 
                    FROM fd_amount_exp 
                    WHERE userid = '$user_id' AND YEAR(date) = '$year'
                    GROUP BY MONTH(date) 
                    ORDER BY MONTH(date)";
}

// Fetch income data
$income_result = $con->query($income_sql);
$income_data = [];

if ($income_result->num_rows > 0) {
    while ($row = $income_result->fetch_assoc()) {
        $key = ($year == "0" || $year == "") ? $row['month'] . " " . $row['year'] : $row['month'];
        $income_data[$key] = [
            'amount' => $row['total_income'],
            'year' => $row['year']
        ];
    }
}

// Fetch expense data
$expense_result = $con->query($expense_sql);
$expense_data = [];

if ($expense_result->num_rows > 0) {
    while ($row = $expense_result->fetch_assoc()) {
        $key = ($year == "0" || $year == "") ? $row['month'] . " " . $row['year'] : $row['month'];
        $expense_data[$key] = [
            'amount' => $row['total_expense'],
            'year' => $row['year']
        ];
    }
}

// Combine both income and expense data
$all_months = array_unique(array_merge(array_keys($income_data), array_keys($expense_data)));
$report = [];

foreach ($all_months as $month) {
    $income = isset($income_data[$month]['amount']) ? (float)$income_data[$month]['amount'] : 0;
    $expense = isset($expense_data[$month]['amount']) ? (float)$expense_data[$month]['amount'] : 0;
    $balance = $income - $expense;
    
    // Extract year for display
    $display_year = isset($income_data[$month]['year']) ? $income_data[$month]['year'] : 
                   (isset($expense_data[$month]['year']) ? $expense_data[$month]['year'] : $year);

    $report[] = [
        "month" => $month,
        "income" => $income,
        "expense" => $expense,
        "balance" => $balance,
        "year" => $display_year
    ];
}

// Sort report by year and month for consistent ordering
usort($report, function($a, $b) {
    return strcmp($a['month'] . $a['year'], $b['month'] . $b['year']);
});

echo json_encode(["status" => "success", "data" => $report]);
?>