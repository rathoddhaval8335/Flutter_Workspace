<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";
$userid = $_GET['userid'] ?? $_POST['userid'] ?? '';

if (empty($userid)) {
    echo json_encode(["error" => "User ID is required"]);
    exit();
}

$stmt = $con->prepare("SELECT id, userid, cat_id, cat_name, cat_icon, remaining, budget 
                        FROM fd_budget WHERE userid = ?");
$stmt->bind_param("s", $userid);
$stmt->execute();
$result = $stmt->get_result();

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = [
        "id" => $row['id'],
        "userid" => $row['userid'],
        "cat_id" => $row['cat_id'],
        "cat_name" => $row['cat_name'],
        "cat_icon" => $row['cat_icon'],
        "remaining" => $row['remaining'],
        "budget" => $row['budget']
    ];
}

echo json_encode($data);

$stmt->close();
$con->close();
?>
