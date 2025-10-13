<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

error_reporting(0); // suppress warnings/notices

include "connect.php"; // database connection

$admin_name = isset($_POST['admin_name']) ? $_POST['admin_name'] : '';
$new_pass   = isset($_POST['new_pass']) ? $_POST['new_pass'] : '';

if(empty($admin_name) || empty($new_pass)){
    echo json_encode([
        "status" => "error",
        "message" => "Admin name and new password are required"
    ]);
    exit;
}

// Hash the password
$hashed_pass = password_hash($new_pass, PASSWORD_DEFAULT);

// Check if admin exists
$checkSql = "SELECT admin_name FROM fd_admin WHERE admin_name=?";
$stmt = $con->prepare($checkSql);
$stmt->bind_param("s", $admin_name);
$stmt->execute();
$result = $stmt->get_result();

if($result->num_rows > 0){
    // Admin exists, update password
    $updateSql = "UPDATE fd_admin SET pass=? WHERE admin_name=?";
    $stmt2 = $con->prepare($updateSql);
    $stmt2->bind_param("ss", $hashed_pass, $admin_name);

    if($stmt2->execute()){
        echo json_encode([
            "status" => "success",
            "message" => "Password updated successfully"
        ]);
    } else {
        echo json_encode([
            "status" => "error",
            "message" => "Failed to update password"
        ]);
    }
    $stmt2->close();
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Admin not found"
    ]);
}

$stmt->close();
$con->close();
exit;
?>
