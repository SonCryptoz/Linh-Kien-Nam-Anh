<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Kiểm tra reCAPTCHA
    $secretKey = "6LcvXrqgAAAAAHleQg8JZqw4hLZMSa1BKgjg7II9"; // Thay bằng Secret Key của bạn
    $responseKey = $_POST['g-recaptcha-response']; // Lấy giá trị từ reCAPTCHA
    $userIP = $_SERVER['REMOTE_ADDR']; // Lấy IP của người dùng

    // Gửi yêu cầu xác thực đến Google
    $url = "https://www.google.com/recaptcha/api/siteverify";
    $data = [
        'secret' => $secretKey,
        'response' => $responseKey,
        'remoteip' => $userIP
    ];

    // Khởi tạo cURL để gửi POST request
    $options = [
        'http' => [
            'method' => 'POST',
            'header' => 'Content-type: application/x-www-form-urlencoded',
            'content' => http_build_query($data)
        ]
    ];
    $context = stream_context_create($options);
    $result = file_get_contents($url, false, $context);
    $response = json_decode($result);

    // Kiểm tra nếu reCAPTCHA hợp lệ
    if ($response->success) {
        // reCAPTCHA hợp lệ, tiếp tục xử lý đăng ký
        // Xử lý dữ liệu đăng ký của bạn ở đây
        echo "Đăng ký thành công!";
    } else {
        // reCAPTCHA không hợp lệ, thông báo lỗi
        echo "Vui lòng xác nhận bạn không phải là robot!";
    }
}
?>