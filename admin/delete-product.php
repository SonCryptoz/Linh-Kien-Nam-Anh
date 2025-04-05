<?php
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");

if ($conn->connect_error) {
    die("Lỗi không thể kết nối: " . $conn->connect_error);
}

$id = isset($_GET['id']) ? $_GET['id'] : '';  // Lấy ID từ query string

if (!empty($id)) {
    $stmt = $conn->prepare("DELETE FROM `product` WHERE product_id = ?");
    $stmt->bind_param("s", $id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "<script>
                alert('Xóa sản phẩm thành công.');
                window.location.href = 'product-management.php';
              </script>";
    } else {
        echo "<script>
                alert('Sản phẩm không tồn tại hoặc không thể xóa.');
                window.location.href = 'product-management.php';
              </script>";
    }
    $stmt->close();
} else {
    echo "<script>
            alert('ID sản phẩm không hợp lệ.');
            window.location.href = 'product-management.php';
          </script>";
}

$conn->close();
?>
