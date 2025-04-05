<?php
session_start();
require_once('moneyPoint.php');
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "database";

if (isset($_SESSION['name']) && isset($_SESSION['id'])) {
    $eachPartName = preg_split("/\ /", $_SESSION['name']);
    $countName = count($eachPartName);

    $user_id = $_SESSION['id'];

    if ($countName == 1) {
        $name = $eachPartName[$countName - 1];
    } else {
        $name = $eachPartName[$countName - 2] . " " . $eachPartName[$countName - 1];
    }
} else {
    header('Location: index.php');
}

$id_transaction = $_GET['id_transaction'];

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");
if ($conn->connect_error) {
    die("Lỗi không thể kết nối!");
}
mysqli_set_charset($conn, "utf8");

$sqlTransaction = "SELECT * FROM `transaction` WHERE transaction_id = $id_transaction";
$rs = $conn->query($sqlTransaction);
if (!$rs) {
    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
}
$row = $rs->fetch_array(MYSQLI_ASSOC);

$amountArray = explode('-', $row['amount']);
$productArray = explode('-', $row['product_id']);
$totalPrice = $row['payment'];

$sqlCart = "SELECT * FROM `cart` WHERE user_id = $user_id";
$rs = $conn->query($sqlCart);
if (!$rs) {
    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
}
$productInCart = $rs->num_rows;

$avatarPath = 'img/avatar.jpg'; // Đường dẫn mặc định

// Truy vấn lấy đường dẫn avatar
$sql = "SELECT avatar FROM user WHERE user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();

if ($row && !empty($row['avatar'])) {
    $avatarPath = $row['avatar']; // Sử dụng ảnh đã lưu
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
                <li class="breadcrumb-item"><a href="cart.php">Giỏ hàng</a></li>
                <li class="breadcrumb-item active">Đơn hàng</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Cart Start -->
    <div class="cart-page">
        <?php
        echo "<div class='container-fluid'>";
        echo "<div class='row'>";
        echo "<div class='col-lg-8'>";
        echo "<div class='cart-page-inner-title'>";
        echo "<h4 style= 'text-align: center; font-size: 18px;
                        font-weight: 600; margin-bottom: 0px;'>
                        Mã đơn hàng:  " . $id_transaction . "</h4 class = 'text-align: center'>";
        echo "</div>";
        echo "</div>";
        echo "<div class='col-lg-8'>";
        echo "<div class='cart-page-inner'>";
        echo "<div class='table-responsive'>";
        echo "<table class='table table-bordered'>";
        echo "<thead class='thead-dark'>";
        echo "<tr>";
        echo "<th class ='header-checkout_text'>Sản phẩm</th>";
        echo "<th class ='header-checkout_text'>Đơn giá</th>";
        echo "<th class ='header-checkout_text'>Số lượng</th>";
        echo "<th class ='header-checkout_text'>Thành tiền</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody class='align-middle'>";
        for ($count = 0; $count < count($productArray); $count++) {
            echo "<tr>";
            echo "<td>";
            echo "<div class='img'>";

            $qslProduct = "SELECT * FROM `product` WHERE product_id = '$productArray[$count]'";
            $rs1 = $conn->query($qslProduct);

            // Kiểm tra nếu không có kết quả từ câu lệnh truy vấn
            if (!$rs1 || $rs1->num_rows == 0) {
                echo "<p>Không thể truy xuất dữ liệu sản phẩm hoặc sản phẩm không tồn tại!</p>";
                continue; // Bỏ qua phần này và tiếp tục vòng lặp
            }

            // Nếu có dữ liệu
            $productInfo = $rs1->fetch_array(MYSQLI_ASSOC);
            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'><img src='" . $productInfo['image_link'] . "' alt='Image'></a>";
            echo "<p>" . $productInfo['product_name'] . "</p>";
            echo "</div>";
            echo "</td>";

            $price = 0;
            if ($productInfo['discount'] == 0) {
                $price = $productInfo['price'];
            } else {
                $price = ($productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01));
            }
            echo "<td>" . number_format($price, 0, ',', '.') . "đ" . "</td>";

            // Kiểm tra phần tử trong mảng $amountArray
            if (isset($amountArray[$count])) {
                $amountOfProduct = $amountArray[$count];
                echo "<td>" . $amountOfProduct . "</td>";
                $sumPrice = $price * $amountOfProduct;
                echo "<td>" . moneyPoint($sumPrice) . "đ</td>";
            } else {
                echo "<td>0</td><td>0đ</td>";
            }

            echo "</tr>";
        }
        echo "<tr>";
        echo "<td></td>";
        echo "<td></td>";
        echo "<td class = 'header-checkout_text'>Tổng</td>";
        $shipCost = 35000;
        echo "<td><p class = 'title-checkout-text' style = 'margin: 5px 0px;'>(Ship: " . moneyPoint($shipCost) . "đ)</p>
            <h5 style ='font-size: 18px; font-weight: 600;  color: rgb(235, 33, 1);'>" . moneyPoint($totalPrice) . "đ</h5></td>";
        echo "</tr>";
        echo "</tbody>";

        echo "</table>";
        echo "</div>";
        echo "</div>";
        echo "</div>";
        echo "</div>";
        echo "</div>";
        echo "</div>";

        ?>
    </div>
    <!-- Cart End -->

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