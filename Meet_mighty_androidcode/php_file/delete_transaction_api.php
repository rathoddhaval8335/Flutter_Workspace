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

if ($_SERVER['REQUEST_METHOD'] === 'POST' || $_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    $transaction_id = $data['transaction_id'] ?? $_GET['id'] ?? '';
    $user_id = $data['user_id'] ?? $_GET['user_id'] ?? '';
    
    if (empty($transaction_id) || empty($user_id)) {
        echo json_encode(['status' => 'error', 'message' => 'Transaction ID and User ID are required']);
        exit();
    }
    
    // Verify transaction belongs to user
    $check_sql = "SELECT id FROM meet_expense WHERE id = ? AND user_id = ?";
    $check_stmt = $pdo->prepare($check_sql);
    $check_stmt->execute([$transaction_id, $user_id]);
    
    if ($check_stmt->rowCount() == 0) {
        echo json_encode(['status' => 'error', 'message' => 'Transaction not found or unauthorized']);
        exit();
    }
    
    $sql = "DELETE FROM meet_expense WHERE id = ? AND user_id = ?";
    $stmt = $pdo->prepare($sql);
    
    if ($stmt->execute([$transaction_id, $user_id])) {
        echo json_encode(['status' => 'success', 'message' => 'Transaction deleted successfully']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to delete transaction']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>