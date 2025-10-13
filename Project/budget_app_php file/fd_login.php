<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

error_reporting(0);
include "connect.php";

if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    if(empty($email) || empty($password)){
        echo json_encode(["status" => false, "message" => "Email or Password missing"]);
        exit;
    }

    $stmt = $con->prepare("SELECT id, name, email FROM fd_register WHERE email=? AND password=?");
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if($result->num_rows > 0){
        $user = $result->fetch_assoc();
        echo json_encode([
            "status" => true,
            "message" => "Login successful",
            "data" => $user
        ]);
    } else {
        echo json_encode(["status" => false, "message" => "Invalid email or password"]);
    }
} else {
    echo json_encode(["status" => false, "message" => "Invalid request method"]);
}
?>
