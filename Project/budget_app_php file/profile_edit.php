<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");
include "connect.php";

// Check if required fields are provided
if (isset($_POST['id']) && isset($_POST['name']) && isset($_POST['email']) && isset($_POST['mobile_no'])) {
    $id = $_POST['id'];
    $name = mysqli_real_escape_string($con, $_POST['name']);
    $email = mysqli_real_escape_string($con, $_POST['email']);
    $mobile_no = mysqli_real_escape_string($con, $_POST['mobile_no']);

    // Validate required fields
    if (empty($id) || empty($name) || empty($email) || empty($mobile_no)) {
        echo json_encode([
            "success" => false,
            "message" => "All fields are required"
        ]);
        exit;
    }

    // Check if user exists
    $check_sql = "SELECT * FROM fd_register WHERE id = '$id'";
    $check_result = mysqli_query($con, $check_sql);
    
    if (mysqli_num_rows($check_result) == 0) {
        echo json_encode([
            "success" => false,
            "message" => "User not found"
        ]);
        exit;
    }

    // Check if email already exists for other users
    $email_check_sql = "SELECT id FROM fd_register WHERE email = '$email' AND id != '$id'";
    $email_check_result = mysqli_query($con, $email_check_sql);
    
    if (mysqli_num_rows($email_check_result) > 0) {
        echo json_encode([
            "success" => false,
            "message" => "Email already exists"
        ]);
        exit;
    }

    $image_updated = false;
    $target_file = "";

    // Handle profile image upload if provided
    if (isset($_FILES['profile_image']) && $_FILES['profile_image']['error'] === UPLOAD_ERR_OK) {
        $image = $_FILES['profile_image'];

        // Folder where images will be saved
        $upload_dir = "uploads/";

        // Create folder if not exists
        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        // Generate unique filename
        $image_name = time() . "_" . basename($image["name"]);
        $target_file = $upload_dir . $image_name;

        // Validate file type
        $allowed_types = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'];
        $file_type = mime_content_type($image["tmp_name"]);
        
        if (!in_array($file_type, $allowed_types)) {
            echo json_encode([
                "success" => false,
                "message" => "Only JPG, JPEG, PNG & GIF images are allowed"
            ]);
            exit;
        }

        // Validate file size (max 2MB)
        if ($image['size'] > 2 * 1024 * 1024) {
            echo json_encode([
                "success" => false,
                "message" => "Image size should be less than 2MB"
            ]);
            exit;
        }

        // Move uploaded file
        if (move_uploaded_file($image["tmp_name"], $target_file)) {
            $image_updated = true;
            
            // Delete old profile image if exists
            $old_image_sql = "SELECT profile_image FROM fd_register WHERE id = '$id'";
            $old_image_result = mysqli_query($con, $old_image_sql);
            if ($old_image_row = mysqli_fetch_assoc($old_image_result)) {
                if (!empty($old_image_row['profile_image']) && file_exists($old_image_row['profile_image'])) {
                    unlink($old_image_row['profile_image']);
                }
            }
        } else {
            echo json_encode([
                "success" => false,
                "message" => "Failed to upload image"
            ]);
            exit;
        }
    }

    // Update user data in database
    if ($image_updated) {
        // Update with profile image
        $sql = "UPDATE fd_register SET 
                name = '$name', 
                email = '$email', 
                mobile_no = '$mobile_no', 
                profile_image = '$target_file' 
                WHERE id = '$id'";
    } else {
        // Update without profile image
        $sql = "UPDATE fd_register SET 
                name = '$name', 
                email = '$email', 
                mobile_no = '$mobile_no' 
                WHERE id = '$id'";
    }

    if (mysqli_query($con, $sql)) {
        if (mysqli_affected_rows($con) > 0) {
            echo json_encode([
                "success" => true,
                "message" => "Profile updated successfully",
                "image_url" => $image_updated ? $target_file : null
            ]);
        } else {
            echo json_encode([
                "success" => true,
                "message" => "No changes made to profile",
                "image_url" => null
            ]);
        }
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Database update failed: " . mysqli_error($con)
        ]);
    }
} else {
    echo json_encode([
        "success" => false,
        "message" => "Required fields are missing"
    ]);
}
?>