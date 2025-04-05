<?php
// thongbao.php
session_start();
require_once('moneyPoint.php');
session_start();
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");

if ($conn->connect_error) {
    die("Lỗi không thể kết nối!");
}
if (isset($_SESSION['id']) && isset($_SESSION['totalPrice'])) {
    $user_id = $_SESSION['id'];
    $totalPrice = $_SESSION['totalPrice'];
}

// Kiểm tra nếu yêu cầu là POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Nhận dữ liệu từ form
    $name = htmlspecialchars($_POST['name'] ?? ''); // Dùng htmlspecialchars để bảo mật
    $phone = htmlspecialchars($_POST['phone'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');
    $address = htmlspecialchars($_POST['address'] ?? '');
    $message = htmlspecialchars($_POST['message'] ?? '');

    // Tạo thông báo muốn gửi tới Telegram
    $telegramMessage = "Thông tin đơn hàng:\n\n";
    $telegramMessage .= "Họ tên: $name\n";
    $telegramMessage .= "Số điện thoại: $phone\n";
    $telegramMessage .= "Email: $email\n";
    $telegramMessage .= "Địa chỉ: $address\n";
    $telegramMessage .= "Ghi chú: $message\n\n";
    $telegramMessage .= "Danh sách sản phẩm:\n";

    // Lấy danh sách sản phẩm trong giỏ hàng của người dùng
    $sqlCart = "SELECT cart.qty, product.product_name 
                FROM cart 
                JOIN product ON cart.product_id = product.product_id 
                WHERE cart.user_id = $user_id";
    $result = $conn->query($sqlCart);

    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $productName = $row['product_name'];
            $quantity = $row['qty'];
            $telegramMessage .= "- $productName : $quantity \n";
        }
    } else {
        $telegramMessage .= "Không có sản phẩm nào trong giỏ hàng.\n";
    }

    $telegramMessage .= "\nTổng tiền: " . moneyPoint($totalPrice) . " đ";

    // Cấu hình API Telegram
    $token = "7670652950:AAEU9lKdUMbbaKKZHPJ0mYDuc1kYNvjdcI8"; // Thay token bot của bạn vào đây
    $chat_id = "-4601548459"; // Thay chat_id của bạn vào đây (có thể là ID nhóm hoặc người dùng)

    // URL Telegram API để gửi tin nhắn
    $url = "https://api.telegram.org/bot$token/sendMessage";

    // Dữ liệu gửi
    $data = [
        'chat_id' => $chat_id,
        'text' => $telegramMessage
    ];

    // Gửi yêu cầu với cURL
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $response = curl_exec($ch);
    curl_close($ch);

    if ($response) {
        echo "Thông báo đã được gửi!";
    } else {
        echo "Lỗi khi gửi thông báo!";
    }
} else {
    echo "Vui lòng gửi thông tin qua form.";
}
?>
