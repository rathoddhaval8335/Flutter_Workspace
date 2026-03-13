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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    if ($data === null) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid JSON data']);
        exit();
    }
    
    $user_id = $data['user_id'] ?? '';
    $title = $data['title'] ?? '';
    $amount = $data['amount'] ?? '';
    $date = $data['date'] ?? '';
    $type = $data['type'] ?? '';
    
    if (empty($user_id) || empty($title) || empty($amount) || empty($date) || empty($type)) {
        echo json_encode(['status' => 'error', 'message' => 'All fields are required']);
        exit();
    }
    
    if (!in_array($type, ['income', 'expense'])) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid type']);
        exit();
    }
    
    $sql = "INSERT INTO meet_expense (user_id, title, amount, date, type) VALUES (?, ?, ?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    
    if ($stmt->execute([$user_id, $title, $amount, $date, $type])) {
        $transaction_id = $pdo->lastInsertId();
        echo json_encode([
            'status' => 'success', 
            'message' => 'Transaction added successfully',
            'transaction_id' => $transaction_id
        ]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to add transaction']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>