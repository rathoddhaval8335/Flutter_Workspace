<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $cat_name = $_POST['cat_name'] ?? '';
    $cat_icon = $_POST['cat_icon'] ?? '';
    $cat_type = $_POST['cat_type'] ?? '';

    if (empty($cat_name) || empty($cat_icon) || empty($cat_type)) {
        echo json_encode(["success" => false, "message" => "All fields are required"]);
        exit;
    }

    // Insert query (create_at will be current timestamp automatically)
    $query = "INSERT INTO fd_category (cat_name, cat_icon, cat_type) 
              VALUES ('$cat_name', '$cat_icon', '$cat_type')";

    if (mysqli_query($con, $query)) {
        echo json_encode(["success" => true, "message" => "Category added successfully"]);
    } else {
        echo json_encode(["success" => false, "message" => "Failed to add category"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid Request"]);
}
?>
