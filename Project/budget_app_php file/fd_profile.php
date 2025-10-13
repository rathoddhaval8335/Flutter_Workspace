<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

// Get User ID from request
$userid = $_POST['userid'] ?? '';

if (empty($userid)) {
    echo json_encode([
        "status" => "error",
        "message" => "User ID missing"
    ]);
    exit;
}

// Fetch user details including image
$query = "SELECT id, name, email, mobile_no, profile_image FROM fd_register WHERE id = ?";
$stmt = $con->prepare($query);
$stmt->bind_param("i", $userid);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();

    // Base URL automatically get karne ke liye
    $base_url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 
                "https" : "http") . "://" . $_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']) . "/";

    // Agar image stored hai to full URL bana do
    if (!empty($user['profile_image'])) {
        $user['profile_image'] = $base_url . $user['profile_image'];
    }

    echo json_encode([
        "status" => "success",
        "data" => $user
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "User not found"
    ]);
}

$stmt->close();
$con->close();
?>
