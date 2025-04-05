<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
session_start();
require '../vendor/autoload.php';

ini_set('display_errors', 1);
error_reporting(E_ALL);

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database";

// Lấy dữ liệu từ biểu mẫu
$getName = $_POST["name"] ?? '';
$getEmail = $_POST["email"] ?? '';
$getPhone = $_POST["phone"] ?? '';
$getPassword = $_POST["password"] ?? '';
$captcha_input = $_POST['captcha_input'] ?? '';
if (empty($captcha_input)) {
    echo '<div class="fail-auth__form">Vui lòng nhập mã xác nhận!</div>';
    exit();
}

if (empty($getName) || empty($getEmail) || empty($getPhone) || empty($getPassword)) {
    echo '<div class="fail-auth__form">Vui lòng điền đầy đủ thông tin!</div>';
    exit();
}

// Mã hóa mật khẩu
$hashedPassword = password_hash($getPassword, PASSWORD_BCRYPT);

// Kết nối cơ sở dữ liệu
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

mysqli_set_charset($conn, "utf8");
$captcha_input = str_replace('-', '', strtoupper($captcha_input));
$session_captcha = str_replace('-', '', $_SESSION['captcha'] ?? '');
// Hàm tạo mã xác minh ngẫu nhiên
function generateVerificationCode()
{
    return bin2hex(random_bytes(16)); // Tạo mã 32 ký tự
}

$verificationCode = generateVerificationCode();

// Kiểm tra email hoặc số điện thoại trùng lặp
$checkQuery = "SELECT COUNT(*), is_verified FROM user WHERE user_email = ? OR user_phone = ?";
$checkStmt = $conn->prepare($checkQuery);

// Kiểm tra nếu câu lệnh chuẩn bị thất bại
if (!$checkStmt) {
    die('Error preparing statement: ' . $conn->error);
}

$checkStmt->bind_param("ss", $getEmail, $getPhone);
$checkStmt->execute();
$checkStmt->bind_result($count, $is_verified);
$checkStmt->fetch();


if ($captcha_input !== $session_captcha) {
    echo '<div class="fail-auth__form">Mã xác nhận không chính xác. Vui lòng thử lại!</div>';
    exit();


} else {
    if ($count > 0) {
        // Nếu email hoặc số điện thoại đã tồn tại và chưa được xác minh
        if ($is_verified == 0) {
            // Đảm bảo bạn đã đọc hết kết quả trước khi thực hiện câu lệnh UPDATE
            $checkStmt->free_result(); // Đóng kết quả của câu lệnh SELECT

            // Xóa email và số điện thoại cũ
            $deleteQuery = "UPDATE user SET user_email = NULL, user_phone = NULL WHERE user_email = ? OR user_phone = ?";
            $deleteStmt = $conn->prepare($deleteQuery);

            // Kiểm tra nếu câu lệnh chuẩn bị thất bại
            if (!$deleteStmt) {
                die('Error preparing delete statement: ' . $conn->error);
            }

            // Kiểm tra kiểu dữ liệu của $getEmail và $getPhone
            if (!is_string($getEmail) || !is_string($getPhone)) {
                die('Error: $getEmail or $getPhone is not a valid string');
            }

            // Gắn tham số vào câu lệnh DELETE
            $deleteStmt->bind_param("ss", $getEmail, $getPhone);

            // Kiểm tra lỗi khi gọi execute()
            if ($deleteStmt->execute()) {
                echo '<div class="fail-auth__form">Email hoặc số điện thoại đã được sử dụng và đã bị xóa do chưa xác minh!</div>';
            } else {
                echo '<div class="fail-auth__form">Không thể xóa email và số điện thoại cũ!</div>';
            }

            $deleteStmt->close();
        } else {
            echo '<div class="fail-auth__form">Email hoặc số điện thoại đã được sử dụng!</div>';
        }
        $checkStmt->close(); // Đóng câu lệnh kiểm tra email/số điện thoại
        $conn->close(); // Đóng kết nối cơ sở dữ liệu
        exit(); // Dừng mã ở đây nếu đã tồn tại email hoặc số điện thoại
    }
}

$checkStmt->close();

// Chèn dữ liệu vào cơ sở dữ liệu
$sql = "INSERT INTO user (user_name, user_email, user_phone, user_password, verification_code) VALUES (?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);

// Kiểm tra nếu câu lệnh chuẩn bị thất bại
if (!$stmt) {
    die('Error preparing insert statement: ' . $conn->error);
}

$stmt->bind_param("sssss", $getName, $getEmail, $getPhone, $hashedPassword, $verificationCode);

if ($stmt->execute()) {
    // Gửi email xác nhận
    $mail = new PHPMailer(true);
    try {
        // Cấu hình SMTP
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';  // SMTP server (ví dụ Gmail)
        $mail->SMTPAuth = true;
        $mail->Username = 'virtrung123z@gmail.com';  // Địa chỉ email gửi
        $mail->Password = 'kelx bjrt gbbd pteh';  // Mật khẩu email gửi
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Cấu hình người nhận và nội dung email
        $mail->setFrom('virtrung123z@gmail.com', 'anh trung vippro');
        $mail->addAddress($getEmail, $getName);  // Người nhận

        $mail->isHTML(true);
        $mail->Subject = 'Xác nhận đăng ký tài khoản';

        // Sử dụng encodeHeader để mã hóa tiêu đề email với encoding hợp lệ
        $mail->Subject = '=?UTF-8?B?' . base64_encode('Xác nhận đăng ký tài khoản') . '?=';
        $mail->Body = '
            <html>
            <body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #ffffff;">
                <div style="width: 100%; background-color: #ffffff; text-align: center;">
                    <!-- Logo của bạn -->
                    <img src="https://namanhtechdigital.vn/img/logo.png" alt="Logo" style="width: 150px; height: auto; margin-bottom: 20px;">
                </div>
                
                <div style="width: 100%; max-width: 600px; background-color: #ffffff; margin: 0 auto; padding: 30px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
                    <h2 style="color: #333; text-align: center;">Thông Báo Mã Xác Minh</h2>
                    <p style="font-size: 16px; color: #333; text-align: center;">
                        Xin chào ' . $getName . ',<br><br>
                        Đây là mã xác minh của bạn: <strong style="font-size: 20px; color: #546ce8;">' . $verificationCode . '</strong><br><br>
                        Vui lòng không chia sẻ mã này với bất kỳ ai để bảo mật tài khoản của bạn.
                    </p>
                    <hr style="border: 1px solid #ddd;">
                    <p style="font-size: 14px; color: #f44336; text-align: center;">
                        <strong>Cảnh báo:</strong> Không cung cấp mã này cho bất kỳ ai, kể cả người lạ. Mã này chỉ dành cho bạn để xác minh tài khoản.
                    </p>
                    <p style="font-size: 14px; color: #333; text-align: center;">
                        Nếu bạn không yêu cầu mã xác minh này, vui lòng bỏ qua email này.
                    </p>
                </div>
            </body>
            </html>
        ';

        // Gửi email
        $mail->send();

        // Chuyển hướng sang trang "codedangky.php" sau khi đăng ký thành công
        echo '<meta http-equiv="refresh" content="0;url=../codedangky.php" />';
    } catch (Exception $e) {
        echo '<div class="fail-auth__form">Không thể gửi email xác nhận. Vui lòng kiểm tra kết nối mạng!</div>';
    }
} else {
    echo '<div class="fail-auth__form">Có lỗi xảy ra, vui lòng thử lại!</div>';
}

$stmt->close();
$conn->close();
?>