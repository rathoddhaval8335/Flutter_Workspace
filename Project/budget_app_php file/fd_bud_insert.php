<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";
$userid   = $_POST['user_id'] ?? '';
$cat_id   = $_POST['cat_id'] ?? '';
$cat_name = $_POST['cat_name'] ?? '';
$cat_icon = $_POST['cat_icon'] ?? '';
$budget   = $_POST['budget'] ?? '';
$month    = $_POST['month'] ?? ''; // Month parameter add kiya

// Correct column names in MySQL
$query = "INSERT INTO fd_budget (userid, cat_id, cat_name, cat_icon, budget, remaining, month) 
          VALUES ('$userid','$cat_id','$cat_name','$cat_icon','$budget','$budget','$month')";

if(mysqli_query($con, $query)){
    echo json_encode([
        "status" => "success",
        "message" => "Budget set successfully"
    ]);
}else{
    echo json_encode([
        "status" => "error",
        "message" => "Database error: " . mysqli_error($con)
    ]);
}
?>