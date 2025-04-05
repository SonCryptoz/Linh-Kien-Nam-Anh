<?php
session_start();

// Kết nối tới cơ sở dữ liệu
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database";

$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Kiểm tra xem người dùng đã đăng nhập chưa
if (isset($_SESSION['id'])) {
    $user_id = $_SESSION['id'];

    // Xóa tất cả sản phẩm trong giỏ hàng của người dùng hiện tại
    $sql = "DELETE FROM build WHERE user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);

    if ($stmt->execute()) {
        echo "<script>
            alert('Đã xóa tất cả sản phẩm khỏi giỏ hàng!');
            window.location.href = '../custom-pc.php'; // Chuyển hướng người dùng trở lại trang giỏ hàng
        </script>";
    } else {
        echo "Lỗi: " . $stmt->error;
    }
    $stmt->close();
} else {
    echo "<script>
        alert('Bạn chưa đăng nhập!');
        window.location.href = '../home.php'; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
    </script>";
}

$conn->close();
?>
