<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$admin_name = $_POST['admin_name'] ?? '';
$pass = $_POST['pass'] ?? '';

if($admin_name == '' || $pass == '') {
    echo json_encode(["status"=>"error","message"=>"Username or Password missing"]);
    exit;
}

// Fetch admin by username
$sql = "SELECT * FROM fd_admin WHERE admin_name=?";
$stmt = $con->prepare($sql);
$stmt->bind_param("s", $admin_name);
$stmt->execute();
$result = $stmt->get_result();

if($result->num_rows > 0){
    $row = $result->fetch_assoc();
    $hashed_pass = $row['pass'];

    if(password_verify($pass, $hashed_pass)){
        echo json_encode(["status"=>"success","message"=>"Login successful"]);
    } else {
        echo json_encode(["status"=>"error","message"=>"Invalid credentials"]);
    }
} else {
    echo json_encode(["status"=>"error","message"=>"Invalid credentials"]);
}

$stmt->close();
$con->close();
?>
