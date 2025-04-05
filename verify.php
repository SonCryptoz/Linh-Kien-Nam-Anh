<?php
// Kết nối MySQL
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database";

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$alertMessage = '';  // Biến chứa thông báo
$confirmationStatus = '';  // Biến để lưu trạng thái xác nhận

if (isset($_GET['code'])) {
    $verification_code = $_GET['code'];

    // Kiểm tra mã xác nhận trong cơ sở dữ liệu
    $sql = "SELECT * FROM user WHERE verification_code = '$verification_code' AND is_verified = FALSE";
    $result = $conn->query($sql);

    // Kiểm tra xem có lỗi trong truy vấn hay không
    if ($result === false) {
        $alertMessage = 'Lỗi truy vấn: ' . $conn->error;
    } else {
        if ($result->num_rows > 0) {
            // Cập nhật trạng thái người dùng là đã xác nhận
            $sql_update = "UPDATE user SET is_verified = TRUE WHERE verification_code = '$verification_code'";
            if ($conn->query($sql_update) === TRUE) {
                $alertMessage = 'Email của bạn đã được xác nhận thành công!';
                $confirmationStatus = 'success';  // Đánh dấu đã xác nhận thành công
            } else {
                $alertMessage = 'Có lỗi xảy ra trong quá trình xác nhận!';
                $confirmationStatus = 'error';  // Đánh dấu lỗi trong quá trình xác nhận
            }
        } else {
            $alertMessage = 'Mã xác nhận không hợp lệ hoặc đã được xác nhận!';
            $confirmationStatus = 'warning';  // Mã không hợp lệ hoặc đã xác nhận
        }
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận email</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }

        .alert {
            text-align: center;
            font-size: 1.2rem;
        }
    </style>
</head>

<body>
    <div class="container">
        <!-- Hiển thị thông báo -->
        <?php if ($alertMessage): ?>
            <div class="alert alert-<?php echo $confirmationStatus; ?>">
                <?php echo $alertMessage; ?>
            </div>
        <?php endif; ?>

        <!-- Kiểm tra kết quả và hiển thị nút điều hướng -->
        <?php if ($confirmationStatus === 'success'): ?>
            <div class="text-center mt-3">
                <a href="login.html" class="btn btn-primary">Trở về trang chủ</a>
            </div>
        <?php elseif ($confirmationStatus === 'error' || $confirmationStatus === 'warning'): ?>
            <div class="text-center mt-3">
                <a href="codedangky.php" class="btn btn-primary">Trở lại </a>
            </div>
        <?php endif; ?>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
