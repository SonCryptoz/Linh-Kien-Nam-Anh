<?php
// Sử dụng autoload của Composer để tải PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Tải autoload từ thư mục vendor của Composer
require __DIR__ . '/autoload.php';

// Tạo đối tượng PHPMailer
$mail = new PHPMailer(true);

try {
    // Cấu hình SMTP server
    $mail->isSMTP();  // Chọn giao thức SMTP
    $mail->Host = 'smtp.gmail.com';  // SMTP server của Gmail
    $mail->SMTPAuth = true;  // Bật xác thực SMTP
    $mail->Username = 'virtrung123z@gmail.com';  // Thay bằng email của bạn
    $mail->Password = 'kelx bjrt gbbd pteh';  // Thay bằng mật khẩu của email (hoặc mã ứng dụng nếu sử dụng Gmail)
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;  // Bật mã hóa SSL/TLS
    $mail->Port = 587;  // Cổng của Gmail SMTP

    // Thiết lập thông tin người gửi và người nhận
    $mail->setFrom('virtrung123z@gmail.com', 'anh trung vjpprovjppro');  // Thay bằng email và tên người gửi
    $mail->addAddress('tjentrung9z@gmail.com', 'th lol nao dodo');  // Thay bằng email người nhận
    $mail->SMTPDebug = 2; // Hiển thị log chi tiết quá trình gửi mail

    // Tiêu đề và nội dung email
    $mail->isHTML(true);  // Chọn định dạng HTML cho email
    $mail->Subject = 'Test Email from PHPMailer';
    $mail->Body    = 'This is the <b>HTML</b> message body'; 

    // Gửi email
    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}
?>
