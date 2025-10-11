<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$income_id = $_POST['income_id'] ?? '';

if(empty($income_id)) {
    echo json_encode(["success" => false, "message" => "Income ID is required."]);
    exit;
}

$sql = "DELETE FROM fd_amount_income WHERE income_id = ?";
$stmt = $con->prepare($sql);

if($stmt){
    $stmt->bind_param("i", $income_id);
    if($stmt->execute()){
        echo json_encode(["success" => true, "message" => "Income deleted successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Execution failed: ".$stmt->error]);
    }
    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Preparation failed: ".$con->error]);
}
$con->close();

?>

