<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database";  // Thay đổi theo tên database của bạn

// Kiểm tra kết nối cơ sở dữ liệu
$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Kiểm tra xem người dùng đã đăng nhập chưa
if (!isset($_SESSION['id'])) {
    echo "Bạn chưa đăng nhập!";
    exit;
}

$user_id = $_SESSION['id'];

// Lấy các dữ liệu từ bảng `build` và chèn vào bảng `cart`
$sqlBuild = "SELECT * FROM build WHERE user_id = $user_id";  // Thay đổi điều kiện nếu cần
$resultBuild = $conn->query($sqlBuild);

// Kiểm tra xem truy vấn có thành công không
if (!$resultBuild) {
    die("Lỗi truy vấn: " . $conn->error);
}

if ($resultBuild->num_rows > 0) {
    // Duyệt qua từng bản ghi trong bảng `build`
    while ($rowBuild = $resultBuild->fetch_assoc()) {
        $product_id = $rowBuild['product_id'];  // Lấy `product_id` từ bảng `build`
        $qty = $rowBuild['qty'];      // Lấy `qty` từ bảng `build` thay vì `quantity`

        // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
        $checkCart = "SELECT * FROM cart WHERE user_id = $user_id AND product_id = '$product_id'";
        $resultCheck = $conn->query($checkCart);

        // Kiểm tra xem truy vấn kiểm tra giỏ hàng có thành công không
        if (!$resultCheck) {
            die("Lỗi truy vấn kiểm tra giỏ hàng: " . $conn->error);
        }

        if ($resultCheck->num_rows > 0) {
            // Nếu sản phẩm đã có trong giỏ, cập nhật số lượng
            $rowCart = $resultCheck->fetch_assoc();
            $new_qty = $rowCart['qty'] + $qty;  // Cộng thêm số lượng (`qty` thay vì `quantity`)
            $updateCart = "UPDATE cart SET qty = $new_qty WHERE user_id = $user_id AND product_id = '$product_id' ";  // Thay `quantity` thành `qty`
            $conn->query($updateCart);
        } else {
            // Nếu sản phẩm chưa có trong giỏ, thêm mới vào bảng `cart`
            $insertCart = "INSERT INTO cart (user_id, product_id, qty) VALUES ($user_id,'$product_id', $qty)";  // Thay `quantity` thành `qty`
            $conn->query($insertCart);
        }
    }

    echo "Sản phẩm đã được thêm vào giỏ hàng!";
} else {
    echo "Không có sản phẩm trong bảng build!";
}

$conn->close();
?>
