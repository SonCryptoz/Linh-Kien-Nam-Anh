<?php
session_start();
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../vendor/autoload.php'; // Nhúng PHPMailer

ini_set('display_errors', 1);
error_reporting(E_ALL);

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database";
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function sendPasswordEmail($email, $name, $newPassword)
{
    $mail = new PHPMailer(true);
    try {
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'virtrung123z@gmail.com';
        $mail->Password = 'kelx bjrt gbbd pteh';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        $mail->setFrom('virtrung123z@gmail.com', 'anh trung vippro');
        $mail->addAddress($email, $name);

        $mail->isHTML(true);
        $mail->Subject = '=?UTF-8?B?' . base64_encode('Mật khẩu mới của bạn') . '?=';
        $mail->Body = '
                <html>
                <body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #ffffff;">
                    <div style="width: 100%; background-color: #ffffff; padding: 20px 20px 20px 0; text-align: center;">
                        <!-- Logo của bạn -->
                        <img src="https://namanhtechdigital.vn/img/logo.png" alt="Logo" style="width: 150px; height: auto; margin-bottom: 20px;">
                    </div>
                    
                    <div style="width: 100%; max-width: 600px; background-color: #ffffff; margin: 0 auto; padding: 30px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
                        <h2 style="color: #333; text-align: center;">Thông Báo Mật khẩu mới </h2>
                        <p style="font-size: 16px; color: #333; text-align: center;">
                            Xin chào ' . $name . ',<br><br>
                           <br><br>Mật khẩu mới của bạn là: <strong>' . $newPassword . '</strong><br>
                            Vui lòng không chia sẻ mật khẩu này với bất kỳ ai để bảo mật tài khoản của bạn.
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

        $mail->send();
        return true;
    } catch (Exception $e) {
        return 'Không thể gửi email. Lỗi: ' . $mail->ErrorInfo;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $phone = isset($_POST['phone1']) ? trim($_POST['phone1']) : '';

    if (empty($phone)) {
        echo 'Vui lòng nhập số điện thoại hoặc email';
        exit;
    }

    $sqlemail = "SELECT * FROM user WHERE user_email = ? OR user_phone = ?";
    $stmt = $conn->prepare($sqlemail);

    if (!$stmt) {
        die("Lỗi khi chuẩn bị câu lệnh: " . $conn->error);
    }

    $stmt->bind_param("ss", $phone, $phone);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $email = $row['user_email'];
        $name = $row['user_name'];

        $newPassword = bin2hex(random_bytes(4));
        $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

        $updateSQL = "UPDATE user SET user_password = ? WHERE user_email = ? OR user_phone = ?";
        $updateStmt = $conn->prepare($updateSQL);

        if (!$updateStmt) {
            die("Lỗi khi chuẩn bị câu lệnh cập nhật: " . $conn->error);
        }

        $updateStmt->bind_param("sss", $hashedPassword, $phone, $phone);
        if ($updateStmt->execute()) {
            $emailResult = sendPasswordEmail($email, $name, $newPassword);
            echo $emailResult === true
                ? 'Mật khẩu mới đã được gửi qua email ' . $email
                : $emailResult;
        } else {
            echo 'Cập nhật mật khẩu không thành công. Vui lòng thử lại sau';
        }
        $updateStmt->close();
    } else {
        echo 'Không tìm thấy người dùng với thông tin đã cung cấp';
    }
    $stmt->close();
} else {
    echo "Yêu cầu không hợp lệ.";
}

$conn->close();
?>