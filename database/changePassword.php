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

if (isset($_POST["password"])) {
    $currentPassword = $_POST["password"];
}

if (isset($_POST["newPassword"])) {
    $newPassword = $_POST["newPassword"];
}

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

mysqli_set_charset($conn, "utf8");

// Lấy mật khẩu băm hiện tại từ cơ sở dữ liệu
$sql = "SELECT user_password FROM user WHERE user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();

if ($row && password_verify($currentPassword, $row['user_password'])) {
    $newHashedPassword = password_hash($newPassword, PASSWORD_BCRYPT);
    $updateSql = "UPDATE user SET user_password = ? WHERE user_id = ?";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bind_param("si", $newHashedPassword, $user_id);

    if ($updateStmt->execute()) {
        echo "
        <script>
            alert('Thay đổi mật khẩu thành công, vui lòng đăng nhập lại!');
            window.location.href = '../logout.php';
        </script>";
    } else {
        echo "
        <script>
            alert('Có lỗi xảy ra, vui lòng thử lại!');
            window.location.href = '../my-account.php#account-tab';
        </script>";
    }
} else {
    echo "
    <script>
        alert('Mật khẩu hiện tại không đúng, vui lòng nhập lại!');
        window.location.href = '../my-account.php#account-tab';
    </script>";
}

$conn->close();
?>
