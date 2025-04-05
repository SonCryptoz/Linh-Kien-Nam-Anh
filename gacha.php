<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>CAPTCHA nhập chữ</title>
    <style>
        .captcha {
            font-family: Arial, sans-serif;
            font-size: 24px;
            font-weight: bold;
            color: #444;
            background: #f0f0f0;
            padding: 10px;
            display: inline-block;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <form action="verify_captcha.php" method="POST">
        <label for="captcha">Nhập mã CAPTCHA:</label>
        <div class="captcha">
            <?php
            session_start();
            // Tạo chuỗi ngẫu nhiên
            $captcha_text = substr(str_shuffle("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"), 0, 6);
            $_SESSION['captcha'] = $captcha_text; // Lưu chuỗi vào session
            echo $captcha_text; // Hiển thị chuỗi
            ?>
        </div>
        <br><br>
        <input type="text" id="captcha" name="captcha_input" required>
        <br><br>
        <input type="submit" value="Xác nhận">
    </form>
</body>
</html>
