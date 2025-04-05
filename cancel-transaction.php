<?php

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");

if (isset($_GET['id'])) {
    $transaction_id = $_GET['id'];
    echo $transaction_id;
    // Xử lý logic hủy đơn ở đây
}
$transaction_id = intval($_GET['id']); // Ép kiểu thành số nguyên để tăng bảo mật

if ($conn->connect_error) {
    echo "<h5>Không thể kết nối cơ sở dữ liệu!</h5>";
    exit();
}

// Truy vấn thông tin giao dịch
$sql1 = "SELECT * FROM `transaction` WHERE transaction_id = " . $transaction_id;
$info = NULL;
$rs1 = $conn->query($sql1);
if ($rs1->num_rows > 0) {
    $info = $rs1->fetch_assoc();
    $user_name = $info['user_name']; // Giả định cột chứa tên người dùng là 'user_name'
}

// Cập nhật trạng thái của giao dịch
$sql2 = "UPDATE `transaction` SET status = 4 WHERE transaction_id = " . $transaction_id;
if (!$conn->query($sql2)) {
    echo "Lỗi khi cập nhật trạng thái giao dịch: " . $conn->error;
    exit();
}

// Truy vấn lại thông tin giao dịch
$sql1 = "SELECT * FROM `transaction` WHERE transaction_id = " . $transaction_id;
$rs1 = $conn->query($sql1);
if ($rs1->num_rows > 0) {
    $row = $rs1->fetch_assoc();
    $listB = explode('-', $row['product_id']);  // Danh sách các ID sản phẩm
    $listQty = explode('-', $row['amount']);   // Danh sách số lượng
} else {
    echo "Không tìm thấy giao dịch với ID = $transaction_id.";
    exit();
}

// Duyệt qua danh sách sản phẩm và cập nhật số lượng
$productDetails = ""; // Biến lưu thông tin sản phẩm để gửi Telegram
for ($i = 0; $i < count($listB); $i++) {
    $productId = intval($listB[$i]);  // Đảm bảo giá trị là số
    $productQty = intval($listQty[$i]);  // Đảm bảo số lượng là số

    // Truy vấn thông tin sản phẩm
    $sqlB = "SELECT * FROM product WHERE product_id = $productId";
    $rsB = $conn->query($sqlB);
    if ($rsB->num_rows > 0) {
        $rowB = $rsB->fetch_assoc();
        $qty = $rowB['amount'] + $productQty;   // Cập nhật số lượng
        $sold = $rowB['sold'] - $productQty;    // Giảm số lượng đã bán

        // Lưu thông tin sản phẩm để gửi Telegram
        $productName = $rowB['product_name'];
        $productDetails .= "- $productName (Số lượng: $productQty)\n";

        // Cập nhật lại thông tin sản phẩm
        $temp = "UPDATE `product` SET amount = $qty, sold = $sold WHERE product_id = " . $productId;
        if (!$conn->query($temp)) {
            echo "Lỗi khi cập nhật sản phẩm với ID = $productId: " . $conn->error;
            exit();
        }
    } else {
        echo "Không tìm thấy sản phẩm với ID = $productId.";
        exit();
    }
}

// Gửi thông báo đến Telegram
$token = "7670652950:AAEU9lKdUMbbaKKZHPJ0mYDuc1kYNvjdcI8"; // Thay bằng token bot của bạn
$chat_id = "-4601548459"; // Thay bằng ID của bạn
$telegramMessage = "Đơn hàng bị hủy:\n\n";
$telegramMessage .= "Tên khách hàng: $user_name\n";
$telegramMessage .= "Mã đơn hàng: $transaction_id\n";
$telegramMessage .= "Danh sách sản phẩm hủy:\n$productDetails";

$url = "https://api.telegram.org/bot$token/sendMessage";
$data = [
    'chat_id' => $chat_id,
    'text' => $telegramMessage
];

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

if (!$response) {
    echo "Không thể gửi thông báo Telegram.";
}

// Điều hướng đến trang tài khoản
header("Location: my-account.php");
exit();

?>
