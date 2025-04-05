<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận Email</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 50px;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-size: 16px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .error, .success {
            color: #ff4d4d;
            text-align: center;
        }
        .success {
            color: #28a745;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Xác Nhận Email</h2>
    <!-- Form nhập mã xác nhận -->
    <form action="verify.php" method="get">
        <label for="verification_code">Nhập mã xác nhận:</label>
        <input type="text" id="verification_code" name="code" placeholder="Mã xác nhận của bạn" required>
        <button type="submit" class="btn">Xác nhận</button>
    </form>
</div>

</body>
</html>
