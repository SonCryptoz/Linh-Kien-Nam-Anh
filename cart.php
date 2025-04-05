<?php
session_start();
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");

if ($conn->connect_error) {
    die("Lỗi không thể kết nối!");
}
mysqli_set_charset($conn, "utf8");
if (isset($_SESSION['name']) && isset($_SESSION['id'])) {
    $eachPartName = preg_split("/\ /", $_SESSION['name']);
    $user_id = $_SESSION['id'];
    $countName = count($eachPartName);
    if ($countName == 1) {
        $name = $eachPartName[$countName - 1];
    } else {
        $name = $eachPartName[$countName - 2] . " " . $eachPartName[$countName - 1];
    }
} else {
    header('Location: index.php');
}

$totalPrice = 0;

function moneyPoint($money)
{
    $caseString = "";

    $thousandPoint = 3;
    $milionPoint = 6;
    $bilionPoint = 9;
    $thousandBilionPoint = 12;
    $milionBilionPoint = 15;

    $money_str = (string) $money;
    $money_str = strrev($money_str);

    $moneyLength = strlen($money_str);
    for ($i = 0; $i < $moneyLength; $i++) {
        if ($i == $thousandPoint or $i == $milionPoint or $i == $bilionPoint or $i == $thousandBilionPoint or $i == $milionBilionPoint) {
            $caseString .= ("." . $money_str[$i]);
        } else {
            $caseString .= $money_str[$i];
        }
    }
    $money_point = strrev($caseString);
    return $money_point;
}

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
                <div class="col-md-3">
                    <div class="user">
                        <a href="product-list.php" class="btncartindex">
                            <div class="icon-container">
                                <i class="fa fas fa-desktop"></i>
                            </div>
                            <span>Sản phẩm</span>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="user">
                        <a href="custom-pc.php" class="btncartindex">
                            <div class="icon-container">
                                <i class="fa fas fa-tools"></i>
                            </div>
                            <span>Xây dựng cấu hình</span>
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
                <li class="breadcrumb-item active">Giỏ hàng</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Cart Start -->
    <div class="cart-page">
        <?php
        echo "<div class='container-fluid'>";
        echo "<div class='row'>";
        $sqlCart = "SELECT * FROM `cart` WHERE user_id = $user_id";
        $rs = $conn->query($sqlCart);
        if (!$rs) {
            die("Lỗi không thể truy xuất cơ sở dữ liệu!");
        }
        $count = $rs->num_rows;
        if ($count > 0) {
            echo "<div class='col-lg-8'>";
            echo "<div class='cart-page-inner'>";
            echo "<div class='table-responsive'>";
            echo "<table class='table table-bordered'>";
            echo "<thead class='thead-dark'>";
            echo "<tr>";
            echo "<th class ='header-checkout_text'>Sản phẩm</th>";
            echo "<th class ='header-checkout_text'>Đơn giá</th>";
            echo "<th class ='header-checkout_text'>Số lượng</th>";
            echo "<th class ='header-checkout_text'>Tổng tiền</th>";
            echo "<th class ='header-checkout_text'>Xóa</th>";
            echo "</tr>";
            echo "</thead>";
            echo "<tbody class='align-middle'>";
            while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                echo "<tr>";
                echo "<td style='text-align: center;'>";
                echo "<div class='img'>";
                $id_product = $row['product_id'];
                $qslProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                $rs1 = $conn->query($qslProduct);
                if (!$rs1) {
                    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
                }
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
                echo "<td style='text-align: center;'>" . number_format($price, 0, ',', '.') . "đ" . "</td>";

                echo "<td style='text-align: center;'>" . $row['qty'] . "</td>";
                $sumPrice = $price * $row['qty'];
                $totalPrice += $sumPrice;
                echo "<td style='text-align: center;'>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";
                echo "<td style='text-align: center;'><a class='btn cart' href='database/deleteCartItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";

            }
            echo "</tbody>";
            echo "</table>";
            echo "</div>";
            echo "<div style='text-align: center; margin-top: 30px;'>
                                        <a style='border-radius: 22px;
                                                  padding: 10px 30px;
                                                  font-size: 14px;
                                                  font-weight: 600;
                                                  background: linear-gradient(90deg, var(--primary) 0%, #0056b3 100%);
                                                  color: white;
                                                  text-decoration: none;' 
                                           class='btn' 
                                           href='product-list.php'>TIẾP TỤC MUA SẮM</a>
                                        </div>";

            echo "</div>";
            echo "</div>";
            echo "<div class='col-lg-4'>";
            echo "<div class='cart-page-inner'>";
            echo "<div class='row'>";
            echo "<div class='col-md-10 header-cart'>";
            echo "<h4 class ='header-checkout_text'>Tổng giá trị giỏ hàng</h4>";
            echo "</div>";
            echo "<div class='col-md-12'>";
            echo "<div class='cart-summary'>";
            echo "<div class='cart-content'>";
            echo "<p class = 'checkout-text'>Tạm tính<span class = 'checkout-price'>" . number_format($totalPrice, 0, ',', '.') . "đ</span></p>";
            echo "<h2>Thành tiền<span class = 'total-checkout-price' > " . number_format($totalPrice, 0, ',', '.') . "đ</span></h2>";
            echo "</div>";
            echo "<form  action='checkout.php'>";
            echo "<div class='cart-btn'>";
            echo "<button type='submit'>TIẾP TỤC THANH TOÁN</button>";
            echo "</div>";
            echo "</form>";
            echo "</div>";
            echo "</div>";
            echo "</div>";
            echo "</div>";
            echo "</div>";
            echo "</div>";
            echo "</div>";
        } else {
            echo "<div class='col-lg-2'>";
            echo "</div>";
            echo "<div class='col-lg-8'>";
            echo "<div class='cart-page-inner'>";
            echo "<div class='table-responsive'>";
            echo "<h4 class = 'header-checkout_text'>GIỎ HÀNG TRỐNG</h4>";
            echo "<div style = 'height: 200px; display: flex; align-item: center; justify-content: center;
                                                            margin-top: 40px; margin-bottom: 60px;'>";
            echo "<img src='img/emptycart.svg' alt=''>";
            echo "</div>";
            echo "<p style = 'font-size: 13px;
                                        font-weight: 600;
                                        color: rgb(67, 70, 87);
                                        text-align: center;'>Chưa có sản phẩm trong giỏ hàng của bạn!</p>";
            echo "<div style = 'text-align: center;'>";
            echo " <a style = 'margin-top: 30px; border-radius: 22px;
                                                            padding: 10px 30px 10px 30px; font-size: 14px;
                                                            font-weight: 600; background: linear-gradient(90deg
                                                            , var(--primary) 0%, #0056b3 100%);
                                                            color: var(--white-color);    ' 
                                                            class='btn' href='product-list.php'></i>TIẾP TỤC MUA SẮM</a>";
            echo "</div>";
            echo "</div>";
            echo "</div>";
            echo "</div>";
        }
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