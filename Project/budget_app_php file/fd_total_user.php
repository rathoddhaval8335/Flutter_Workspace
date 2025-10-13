<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type");

include "connect.php"; // Make sure this connects to your DB correctly

$response = array();

try {
    // Query to count total users from fd_register table
    $query = "SELECT COUNT(*) AS total_users FROM fd_register";
    $result = mysqli_query($con, $query);

    if ($result) {
        $row = mysqli_fetch_assoc($result);
        $response['status'] = 'success';
        $response['total_users'] = (int)$row['total_users'];
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Query failed: ' . mysqli_error($con);
    }
} catch (Exception $e) {
    $response['status'] = 'error';
    $response['message'] = $e->getMessage();
}

// Return JSON response
echo json_encode($response, JSON_PRETTY_PRINT);

// Close connection
mysqli_close($con);
?>
