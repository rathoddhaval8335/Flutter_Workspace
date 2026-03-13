<?php
require_once 'db.php';

// CORS headers allow karo
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');
header('Access-Control-Max-Age: 86400');

// Preflight request handle karo
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    $name = $data['name'] ?? '';
    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';
    $con_password = $data['con_password'] ?? '';
    
    // Validation
    if (empty($name) || empty($email) || empty($password) || empty($con_password)) {
        echo json_encode(['status' => 'error', 'message' => 'All fields are required']);
        exit();
    }
    
    if ($password !== $con_password) {
        echo json_encode(['status' => 'error', 'message' => 'Passwords do not match']);
        exit();
    }
    
    // Check if email already exists
    $check_sql = "SELECT id FROM register WHERE email = ?";
    $check_stmt = $pdo->prepare($check_sql);
    $check_stmt->execute([$email]);
    
    if ($check_stmt->rowCount() > 0) {
        echo json_encode(['status' => 'error', 'message' => 'Email already exists']);
        exit();
    }
    
    // Hash password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    
    // Insert user
    $sql = "INSERT INTO register (name, email, password) VALUES (?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    
    if ($stmt->execute([$name, $email, $hashed_password])) {
        $user_id = $pdo->lastInsertId();
        echo json_encode([
            'status' => 'success', 
            'message' => 'Registration successful',
            'user_id' => $user_id
        ]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Registration failed']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>