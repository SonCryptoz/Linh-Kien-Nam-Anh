<?php
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");
if ($conn->connect_error) {
    die("Lỗi không thể kết nối!");
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $phone = trim($_POST['phone']);
    $password = trim($_POST['pass']);
    $authority = trim($_POST['authority']);
    if(empty($name) || empty($phone) || empty($password) || empty($authority)) {
        echo "<script>alert('Vui lòng nhập đầy đủ thông tin.'); window.history.back();</script>";
        exit;
    }    
    if (empty($name)) {
        echo "<script>alert('Tên không được để trống.'); window.history.back();</script>";
        exit;
    }
    if (empty($phone) || !preg_match('/^\d{10}$/', $phone)) {
        echo "<script>alert('Số điện thoại phải là 10 chữ số.'); window.history.back();</script>";
        exit;
    }
    if (empty($password) || strlen($password) < 10) {
        echo "<script>alert('Mật khẩu phải có ít nhất 10 ký tự.'); window.history.back();</script>";
        exit;
    }
    if (!in_array($authority, ['1', '2'])) {
        echo "<script>alert('Phân quyền chỉ có thể là 1 (Admin) hoặc 2 (Nhân viên).'); window.history.back();</script>";
        exit;
    }

    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    $stmt = $conn->prepare("INSERT INTO admin (admin_name, admin_phone, admin_password, authority) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("sssi", $name, $phone, $hashed_password, $authority);

    if ($stmt->execute()) {
        echo "<script>alert('Thêm admin thành công!'); window.location.href = 'admin.php';</script>";
    } else {
        echo "<script>alert('Lỗi khi thêm admin: " . $stmt->error . "'); window.history.back();</script>";
    }
}
?>