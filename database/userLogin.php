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

if (!empty($_POST["phone"]) && !empty($_POST["password"])) { 
    $getPhone = $_POST["phone"];
    $getPassword = $_POST["password"];

    $stmt = $conn->prepare("SELECT * FROM user WHERE user_phone = ?");
    $stmt->bind_param("s", $getPhone);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($getPassword, $row['user_password'])) {
            session_regenerate_id(true);
            $_SESSION['name'] = $row['user_name'];
            $_SESSION['id'] = $row['user_id'];
            echo '';
        } else {
            echo '<div class="fail-auth__form">Sai mật khẩu, vui lòng kiểm tra lại!</div>';
        }
    } else {
        echo '<div class="fail-auth__form">Không tìm thấy tài khoản, vui lòng kiểm tra lại!</div>';
    }
    $stmt->close();
} else {
    echo '<div class="fail-auth__form">Vui lòng nhập đầy đủ thông tin!</div>';
}

$conn->close();
?>