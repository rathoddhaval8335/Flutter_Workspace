<?php
require_once 'db.php';

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');
header('Access-Control-Max-Age: 86400');
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $user_id = $_GET['user_id'] ?? '';
    
    if (empty($user_id)) {
        echo json_encode(['status' => 'error', 'message' => 'User ID is required']);
        exit();
    }
    
    // Get all transactions for user
    $sql = "SELECT * FROM meet_expense WHERE user_id = ? ORDER BY date DESC, created_at DESC";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$user_id]);
    $transactions = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Calculate totals
    $total_income = 0;
    $total_expense = 0;
    
    foreach ($transactions as $transaction) {
        if ($transaction['type'] == 'income') {
            $total_income += $transaction['amount'];
        } else {
            $total_expense += $transaction['amount'];
        }
    }
    
    $balance = $total_income - $total_expense;
    
    echo json_encode([
        'status' => 'success',
        'transactions' => $transactions,
        'totals' => [
            'income' => $total_income,
            'expense' => $total_expense,
            'balance' => $balance
        ]
    ]);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>