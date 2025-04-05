<?php
session_start();
require_once('moneyPoint.php');

if (isset($_SESSION['name']) && isset($_SESSION['id'])) {
    $eachPartName = preg_split("/\ /", $_SESSION['name']);
    $countName = count($eachPartName);
    if ($countName == 1) {
        $name = $eachPartName[$countName - 1];
    } else {
        $name = $eachPartName[$countName - 2] . " " . $eachPartName[$countName - 1];
    }
    $user_id = $_SESSION['id'];
} else {
    header('Location: index.php');
}
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");
if ($conn->connect_error) {
    die("Lỗi không thể kết nối!");
}
mysqli_set_charset($conn, "utf8");
$sqlCart = "SELECT * FROM `cart` WHERE user_id = $user_id";
$rs = $conn->query($sqlCart);
if (!$rs) {
    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
}
$productInCart = $rs->num_rows;

$avatarPath = 'img/avatar.jpg'; // Đường dẫn mặc định
$username = $userphone = "";

$sql = "SELECT user_name, user_phone, avatar FROM user WHERE user_id = ?";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    die("Lỗi chuẩn bị truy vấn: " . $conn->error);
}
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    $username = !empty($row['user_name']) ? $row['user_name'] : '';
    $userphone = !empty($row['user_phone']) ? $row['user_phone'] : '';
    $avatarPath = !empty($row['avatar']) ? $row['avatar'] : 'img/avatar.jpg';
} else {
    echo "<script>
            alert('Không tìm thấy thông tin người dùng!');
            window.location.href = '../index.php';
          </script>";
    exit();
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Linh-kien-nam-anh</title>

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
        rel="stylesheet">

    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="lib/slick/slick.css" rel="stylesheet">
    <link href="lib/slick/slick-theme.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/base.css" rel="stylesheet">
</head>

<body>
    <!-- Nav Bar Start -->
    <div class="nav">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                <a href="#" class="navbar-brand">MENU</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div style='text-align: center;'>
                        <a style='border-radius: 22px;
                        top: 0%;                   
                        font-size: 13px;
                        font-weight: 600;
                        background: linear-gradient(90deg, rgba(255,152,0,1) 0%, rgba(247,105,93,1) 100%);
                        color: white;
                        text-decoration: none;' class='btn' href=' '>📞 0856.788.999</a>
                    </div>
                    <div style='text-align: center;'>
                        <a style='border-radius: 22px;
                        top: 0%;                   
                        font-size: 13px;
                        font-weight: 600;
                        background: linear-gradient(90deg, rgba(255,152,0,1) 0%, rgba(247,105,93,1) 100%);
                        color: white;
                        text-decoration: none;' class='btn' href=' '>✉ cskh@namanhtechdigital.vn</a>
                    </div>
                    <div class="navbar-nav ml-auto">
                        <div class="header__navbar-item header__navbar-user">
                            <img class="avatar-img" src="<?php echo $avatarPath; ?>" />
                            <span class="header__navbar-user-name"><?php echo $name; ?></span>

                            <ul class="header__navbar-user-menu">
                                <li class="header__navbar-user-item">
                                    <a href="my-account.php">Tài khoản của tôi</a>
                                </li>
                                <li class="header__navbar-user-item header__navbar-user-item--separate">
                                    <a href="logout.php"
                                        onclick="return confirm('Bạn có chắc chắn muốn đăng xuất?');">Đăng xuất</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Nav Bar End -->

    <!-- Bottom Bar Start -->
    <div class="bottom-bar">
        <div class="container-fluid">
            <div class="row align-items-center">
            <div class="col-md-2">
                    <div class="logo">
                        <a href="home.php">
                            <img src="img/logo.png" alt="Logo">
                        </a>
                    </div>
                </div>
                <form method="get" action="product-list.php?" class="col-md-4">
                    <div class="search">
                        <input type="text" placeholder="Tìm kiếm" name="search">
                        <button><i class="fa fa-search" type="submit"></i></button>
                    </div>
                </form>
                <div class="col-md-2">
                    <div class="user">
                        <a href="product-list.php" class="btncartindex">
                            <div class="icon-container">
                                <i class="fa fas fa-desktop"></i>
                            </div>
                            <span>Sản phẩm</span>
                        </a>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="user">
                        <a href="custom-pc.php" class="btncartindex">
                            <div class="icon-container">
                                <i class="fa fas fa-tools"></i>
                            </div>
                            <span>Xây dựng cấu hình</span>
                        </a>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="user">
                        <a href="cart.php" class="btncartindex">
                            <div class="icon-container">
                                <i class="fa fa-shopping-cart"></i>
                                <?php
                                if ($productInCart > 0) {
                                    echo "<div class='notify-box'>";
                                    echo "<div class='notify-cart'>";
                                    echo "<span style='color: var(--white-color); font-size: 10px;'>" . $productInCart . "</span>";
                                    echo "</div>";
                                    echo "</div>";
                                }
                                ?>
                            </div>
                            <span>Giỏ hàng</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bottom Bar End -->

    <div class="social-buttons">
        <a href="https://www.facebook.com" target="_blank" class="social-btn fb">
            <i class="fab fa-facebook"></i>
        </a>
        <a href="https://www.messenger.com/?locale=vi_VN" target="_blank" class="social-btn mess">
            <i class="fab fa-facebook-messenger"></i>
        </a>
        <a href="https://web.telegram.org" target="_blank" class="social-btn tele">
            <i class="fab fa-telegram"></i>
        </a>
    </div>

    <!-- Breadcrumb Start -->
    <div class="breadcrumb-wrap">
        <div class="container-fluid">
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="home.php">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="product-list.php">Sản phẩm</a></li>
                <li class="breadcrumb-item active">Tài khoản của tôi</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- My Account Start -->
    <div class="my-account">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="orders-nav" data-toggle="pill" href="#orders-tab" role="tab"><i
                                class="fa fa-shopping-bag"></i>Lịch sử mua hàng</a>
                        <a class="nav-link" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i
                                class="fa fa-user"></i>Tài khoản</a>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="orders-tab" role="tabpanel"
                            aria-labelledby="orders-nav">
                            <div class="table-responsive" style="overflow-y: auto; height: 400px;">
                                <table class="table table-bordered" style="border-collapse: collapse; width: 100%;">
                                    <thead class="thead-dark" style="position: sticky; top: 0;">
                                        <tr>
                                            <th style="box-shadow: inset 0 0 2px #000000;">Mã đơn hàng</th>
                                            <th style="box-shadow: inset 0 0 2px #000000;">Sản phẩm</th>
                                            <th style="box-shadow: inset 0 0 2px #000000;">Ngày đặt</th>
                                            <th style="box-shadow: inset 0 0 2px #000000;">Địa chỉ</th>
                                            <th style="box-shadow: inset 0 0 2px #000000;">Tổng tiền</th>
                                            <th style="box-shadow: inset 0 0 2px #000000;">Trạng thái</th>
                                            <th style="border-color: white white white white;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $sqlTransaction = "SELECT * FROM `transaction` WHERE user_id = $user_id";
                                        $rs1 = $conn->query($sqlTransaction);
                                        if (!$rs1) {
                                            die("Lỗi không thể truy xuất cơ sở dữ liệu!");
                                        }
                                        while ($row = $rs1->fetch_assoc()) {
                                            echo "<tr>";
                                            echo "<td>" . $row["transaction_id"] . "</td>";
                                            echo "<td><a class ='btn' href='submit-checkout.php?id_transaction=" . $row['transaction_id'] . "'>Xem</a></td>";
                                            $dateTime = new DateTime($row["date"]);
                                            $formatter = new IntlDateFormatter('vi_VN', IntlDateFormatter::FULL, IntlDateFormatter::SHORT);
                                            $formatter->setPattern("EEEE, dd-MM-yyyy HH:mm:ss");
                                            echo "<td>" . $formatter->format($dateTime) . "</td>";                                                                                                                                
                                            echo "<td>" . $row['address'] . "</td>";
                                            echo "<td>" . moneyPoint($row["payment"]) . "đ</td>";
                                            echo "<td>" . approveStatus($row["status"]) . "</td>";
                                            if ($row['status'] < 2) {
                                                echo "<td style='border-color: white white white white;'><a href='cancel-transaction.php?id=" . $row['transaction_id'] . " 'class = 'fail-auth__form btn'>Hủy đơn</a></td>";
                                            }
                                            echo "</tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
                            <div class="row">
                                <div class="col-md-6">
                                    <h5>Đổi mật khẩu</h5>
                                    <form action="database/changePassword.php" method="POST">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input class="form-control" type="password" name="password"
                                                    id="password" placeholder="Mật khẩu hiện tại" required>
                                            </div>
                                            <div class="col-md-6">
                                            </div>
                                            <div class="col-md-6">
                                                <input class="form-control" type="password" name="newPassword"
                                                    id="newPassword" placeholder="Mật khẩu mới" required>
                                            </div>
                                            <div class="col-md-12">
                                                <button type="submit" class="btn">Lưu thay đổi</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 info-account">
                                    <form action="database/changeInfo.php" method="POST" enctype="multipart/form-data"
                                        class="row">
                                        <div class="col-md-6">
                                            <h5>Thông tin tài khoản</h5>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input class="form-control" type="text" name="username"
                                                        id="username" placeholder="Tên tài khoản"
                                                        value="<?php echo htmlspecialchars($username); ?>">
                                                </div>
                                                <div class="col-md-12">
                                                    <input class="form-control" type="tel" name="userphone"
                                                        id="userphone" placeholder="Tel:" pattern="[0-9]{10}"
                                                        value="<?php echo htmlspecialchars($userphone); ?>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="avatar-custom">
                                                <img id="previewAvatar" class="avatar-image"
                                                    src="<?php echo $avatarPath; ?>" alt="Avatar" />
                                                <label for="fileInput" class="custom-file-upload">
                                                    <input id="fileInput" class="form-image-avatar" type="file"
                                                        name="avatar" accept="image/*" onchange="previewImage(event)">
                                                    Chọn avatar
                                                </label>
                                            </div>
                                        </div>
                                        <div class="info-submit">
                                            <button type="submit" class="btn">Lưu thay đổi</button>
                                        </div>
                                    </form>
                                </div>
                                <script>
                                    function previewImage(event) {
                                        const file = event.target.files[0];
                                        if (file) {
                                            const reader = new FileReader();
                                            reader.onload = function (e) {
                                                document.getElementById('previewAvatar').src = e.target.result; // Hiển thị ảnh đã chọn
                                            }
                                            reader.readAsDataURL(file); // Đọc dữ liệu ảnh dưới dạng URL
                                        }
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- My Account End -->

    <!-- Footer Start -->
    <div class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="footer-widget">
                        <h2>Liên lạc</h2>
                        <div class="contact-info">
                            <span>CÔNG TY TNHH CÔNG NGHỆ VÀ TRUYỀN THÔNG SỐ NAM ANH</span>
                            <p><i class="fa fa-map-marker"></i>Trụ sở chính: Số 22/189 đường Tuệ Tĩnh kéo dài, khu 12,
                                P.Bình Hàn, TP.Hải Dương, Tỉnh
                                Hải Dương</p>
                            <p><i class="fa fa-map-marker"></i>VPGD: Số 59, đường Bùi Thị Xuân, phường Lê Thanh Nghị,
                                thành
                                phố Hải Dương, tỉnh Hải Dương.</p>
                            <p><i class="fas fa-globe-americas"></i>namanhtechdigital.vn</p>
                            <p><i class="fa fa-envelope"></i>cskh@namanhtechdigital.vn</p>
                            <p><i class="fas fa-id-card-alt"></i>MST: 0801.433.823</p>
                            <p><i class="fa fa-phone"></i>0856-788-999</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="footer-widget">
                        <h2>Theo dõi chúng tôi</h2>
                        <div class="contact-info">
                            <div class="social">
                                <a href="https://www.facebook.com/profile.php?id=100055098847345&locale=vi_VN"><i
                                        class="fab fa-facebook"></i></a>
                                <a href="https://www.instagram.com/haituoivit/"><i class="fab fa-instagram"></i></a>
                                <a href="https://www.youtube.com/@hailuuuc9590"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="footer-widget">
                        <h2>Thông tin về cửa hàng</h2>
                        <ul>
                            <li><a href="https://namanhtechdigital.vn/page/we.php">Về chúng tôi</a></li>
                            <li><a href="#">Chính sách bảo mật</a></li>
                            <li><a href="#">Điều khoản và điều kiện</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="footer-widget">
                        <h2>Thông tin mua hàng</h2>
                        <ul>
                            <li><a href="#">Chính sách thanh toán</a></li>
                            <li><a href="#">Chính sách giao hàng</a></li>
                            <li><a href="#">Chính sách hoàn trả</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row payment align-items-center">
                <div class="col-md-6">
                    <div class="payment-method">
                        <h2>Chấp nhận thanh toán</h2>
                        <img src="img/payment-method.png" alt="Payment Method" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->



    <!-- Back to Top -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/slick/slick.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>