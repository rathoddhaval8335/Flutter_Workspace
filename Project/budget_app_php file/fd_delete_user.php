<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php";

$response = [];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_POST['id'] ?? '';

    if ($user_id != '') {
        $query = "DELETE FROM fd_register WHERE id = '$user_id'";
        if (mysqli_query($con, $query)) {
            $response['status'] = 'success';
            $response['message'] = 'User deleted successfully';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Delete failed: ' . mysqli_error($con);
        }
    } else {
        $response['status'] = 'error';
        $response['message'] = 'User ID missing';
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'Invalid request method';
}

echo json_encode($response, JSON_PRETTY_PRINT);
mysqli_close($con);
?>
