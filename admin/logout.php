<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    session_start();
    session_unset();
    session_destroy();
    session_write_close();
    setcookie(session_name(), '', 0, '/');

    echo "<script>
        alert('Đăng xuất thành công!');
        window.location.href = document.referrer || 'index.php'; // Quay lại trang trước nếu có
    </script>";
} else {
    header("Location: index.php"); // Chỉ điều hướng về trang chính nếu cần
}
?>
