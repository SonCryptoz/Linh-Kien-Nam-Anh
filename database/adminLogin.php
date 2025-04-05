<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database";

// Kết nối cơ sở dữ liệu
$conn = mysqli_connect($servername, $username, $password, $dbname);
if (!$conn) {
    die("Connection failed. Please try again later.");
}

mysqli_set_charset($conn, "utf8");

// Kiểm tra đầu vào
if (!empty($_POST["phone"]) && !empty($_POST["password"])) {
    $getPhone = $_POST["phone"];
    $getPassword = $_POST["password"];

    // Sử dụng prepared statement để tránh SQL Injection
    $stmt = $conn->prepare("SELECT * FROM admin WHERE admin_phone = ?");
    $stmt->bind_param("s", $getPhone);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($getPassword, $row['admin_password'])) {
            $_SESSION['name'] = $row['admin_name'];
            $_SESSION['id'] = $row['admin_id'];
            $_SESSION['authority'] = $row['authority'];

            if ($row['authority'] === 1) {
                echo '1'; // Chuyển hướng admin
            } else {
                echo 'Không có quyền truy cập hợp lệ.';
            }
        } else {
            echo 'Sai mật khẩu, vui lòng thử lại!';
        }
    } else {
        echo 'Số điện thoại không tồn tại!';
    }
    $stmt->close();
} else {
    echo 'Vui lòng nhập đầy đủ thông tin!';
}

$conn->close();
?>