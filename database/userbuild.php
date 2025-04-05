<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database";

if (isset($_POST["amountProduct"]) && is_numeric($_POST["amountProduct"]) && $_POST["amountProduct"] > 0) {
    $getQuantity = $_POST["amountProduct"];
} else { 
    echo "Số lượng không hợp lệ!";
    exit();
}

$user_id = $_SESSION['id'];
$product_id = $_SESSION['cart-product']; // hoặc sản phẩm khác nếu cần

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Kiểm tra sản phẩm trong giỏ hàng
$sql = "SELECT * FROM build WHERE user_id = $user_id and product_id = '$product_id'";
$rs = $conn->query($sql);

// Lấy thông tin sản phẩm từ bảng product
$sqlB = "SELECT * FROM product WHERE product_id = '$product_id'";
$rsB = $conn->query($sqlB);

if ($rsB->num_rows > 0) {
    $rowB = $rsB->fetch_assoc();
    $amountB = $rowB['amount']; // Số lượng tồn kho của sản phẩm
    
    if ($amountB >= $getQuantity) {
        if ($rs->num_rows > 0) {
            // Cập nhật số lượng sản phẩm nếu đã có trong bảng build
            $row = $rs->fetch_assoc();
            $qty = $row['qty'] + $getQuantity;
            $sql1 = "UPDATE build SET qty = $qty WHERE user_id = $user_id and product_id = '$product_id'";
        } else {
            // Thêm sản phẩm mới vào bảng build
            $sql1 = "INSERT INTO build (user_id, product_id, qty) VALUES($user_id, '$product_id', $getQuantity)";
        }

        // Thực thi câu lệnh SQL
        if ($conn->query($sql1) === TRUE) {
            echo "Thêm sản phẩm vào Xây dựng cấu hình thành công!";
        } else {
            echo "Lỗi: " . $conn->error;
        }
    } else {
        echo "Số lượng sản phẩm không đủ!";
    }
} else {
    echo "Sản phẩm không tồn tại!";
}

$conn->close();
?>
