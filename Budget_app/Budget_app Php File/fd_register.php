<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");

include "connect.php"; // $con = mysqli connection

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';
    $mobile_no = $_POST['mobile_no'] ?? '';

    if(empty($name) || empty($email) || empty($password) || empty($mobile_no)){
        echo json_encode(["success" => false, "message" => "All fields are required"]);
        exit;
    }

    // Check if email exists
    $check = $con->prepare("SELECT id FROM fd_register WHERE email=?");
    $check->bind_param("s", $email);
    $check->execute();
    $res = $check->get_result();

    if($res->num_rows > 0){
        echo json_encode(["success" => false, "message" => "Email already exists"]);
        exit;
    }

    // Insert user
    $stmt = $con->prepare("INSERT INTO fd_register(name,email,password,mobile_no) VALUES(?,?,?,?)");
    $stmt->bind_param("ssss", $name, $email, $password, $mobile_no);
    $result = $stmt->execute();

    if($result){
        echo json_encode(["success" => true, "message" => "Registration successful"]);
    } else {
        echo json_encode(["success" => false, "message" => "Registration failed"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request"]);
}
?>
