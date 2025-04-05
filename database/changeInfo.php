<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database";

// Kiểm tra xem người dùng đã đăng nhập chưa
if (isset($_SESSION['id'])) {
    $user_id = $_SESSION['id'];
} else {
    header('Location: index.php');
    exit();
}

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

mysqli_set_charset($conn, "utf8");

// Lấy dữ liệu từ form
$username = isset($_POST['username']) ? trim($_POST['username']) : '';
$userphone = isset($_POST['userphone']) ? trim($_POST['userphone']) : '';

// Kiểm tra dữ liệu hợp lệ
if (empty($username) || empty($userphone)) {
    echo "<script>
            alert('Vui lòng điền đầy đủ thông tin tài khoản!');
            window.location.href = '../my-account.php#account-tab';
          </script>";
    exit();
}

// Validate số điện thoại (chỉ chứa số, độ dài từ 10 đến 12 ký tự)
if (!preg_match('/^\d{10,12}$/', $userphone)) {
    echo "<script>
            alert('Số điện thoại không hợp lệ. Vui lòng nhập đúng định dạng!');
            window.location.href = '../my-account.php#account-tab';
          </script>";
    exit();
}

// Kiểm tra số điện thoại đã tồn tại trong cơ sở dữ liệu
$phoneCheckSql = "SELECT user_id FROM user WHERE user_phone = ? AND user_id != ?";
$phoneCheckStmt = $conn->prepare($phoneCheckSql);
$phoneCheckStmt->bind_param("si", $userphone, $user_id);
$phoneCheckStmt->execute();
$phoneCheckResult = $phoneCheckStmt->get_result();

if ($phoneCheckResult->num_rows > 0) {
    echo "<script>
            alert('Số điện thoại đã được sử dụng bởi tài khoản khác. Vui lòng nhập số khác!');
            window.location.href = '../my-account.php#account-tab';
          </script>";
    exit();
}

// Xử lý cập nhật ảnh nếu có ảnh được chọn
$avatarPath = "";
if (isset($_FILES['avatar']) && $_FILES['avatar']['error'] == UPLOAD_ERR_OK) {
    $targetDir = "../avatar/";
    $fileName = basename($_FILES['avatar']['name']);
    $targetFilePath = $targetDir . $fileName;

    if (!file_exists($targetDir)) {
        mkdir($targetDir, 0777, true);  // Tạo thư mục nếu chưa tồn tại
    }

    if (move_uploaded_file($_FILES['avatar']['tmp_name'], $targetFilePath)) {
        $avatarPath = "avatar/" . $fileName;  // Đường dẫn lưu trong cơ sở dữ liệu
    } else {
        echo "<script>
                alert('Không thể tải lên ảnh đại diện. Vui lòng thử lại!');
                window.location.href = '../my-account.php#account-tab';
              </script>";
        exit();
    }
}

// Cập nhật thông tin tài khoản và ảnh đại diện
if (!empty($avatarPath)) {
    $updateSql = "UPDATE user SET user_name = ?, user_phone = ?, avatar = ? WHERE user_id = ?";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bind_param("sssi", $username, $userphone, $avatarPath, $user_id);
} else {
    $updateSql = "UPDATE user SET user_name = ?, user_phone = ? WHERE user_id = ?";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bind_param("ssi", $username, $userphone, $user_id);
}

if ($updateStmt->execute()) {
    echo "<script>
            alert('Cập nhật thông tin thành công!');
            window.location.href = '../my-account.php#account-tab';
          </script>";
} else {
    echo "<script>
            alert('Có lỗi xảy ra, vui lòng thử lại!');
            window.location.href = '../my-account.php#account-tab';
          </script>";
}

$conn->close();
