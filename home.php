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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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

    <!-- Main Slider Start -->
    <div class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <nav class="navbar bg-light">
                    <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Case+máy+tính"><i
                                        class="bi bi-pc"></i>Case máy tính</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Main"><i
                                        class="bi bi-pci-card"></i>Mainboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Vi+xử+lý"><i
                                        class="bi bi-cpu"></i>Vi xử lý</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=RAM"><i
                                        class="fas fa-microchip"></i>RAM</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=VGA"><i
                                        class="bi bi-gpu-card"></i>Card đồ họa</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=SSD"><i
                                        class="bi bi-hdd"></i>Ổ cứng SSD</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=HDD"><i
                                        class="bi bi-hdd"></i>Ổ cứng HDD</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Màn+hình"><i
                                        class="bi bi-display"></i>Màn hình</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Chuột"><i
                                        class="bi bi-mouse2"></i>Chuột</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Bàn+phím"><i
                                        class="bi bi-keyboard"></i>Bàn phím</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Tai+nghe"><i
                                        class="bi bi-headphones"></i>Tai nghe</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Case+máy+tính"><i
                                        class="bi bi-pc"></i>Case máy tính</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Tản+nhiệt"><i
                                        class="fas fa-fan"></i>Tản nhiệt</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Loa"><i
                                        class="bi bi-speaker"></i>Loa</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Thiết+bị+mạng"><i
                                        class="bi bi-router"></i>Thiết bị mạng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Camera"><i
                                        class="bi bi-webcam"></i>Camera</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product-list.php?page_num=1&search=Phụ+kiện+khác"><i
                                        class="bi bi-box"></i>Phụ kiện khác</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-6">
                    <div class="header-slider normal-slider">
                        <div class="header-slider-item">
                            <img class="header-img" src="img/ad-img/case-ad.webp" alt="Slider Image" />
                        </div>
                        <div class="header-slider-item ">
                            <img class="header-img" src="img/ad-img/main-ad.jpg" alt="Slider Image" />
                        </div>
                        <div class="header-slider-item">
                            <img class="header-img" src="img/ad-img/cpu-ad.jpg" alt="Slider Image" />
                        </div>
                        <div class="header-slider-item">
                            <img class="header-img" src="img/ad-img/card-ad.jpg" alt="Slider Image" />
                        </div>
                    </div>
                    <div class="">
                        <div class="header-img-bottom">
                            <div class="img-item" style="padding: 30px 15px 0 0;">
                                <img src="img/chuotheafer.png" style="width: 100%; height: 275px; object-fit: cover;" />
                            </div>
                            <div class="img-item" style="padding: 30px 0 0 15px;">
                                <img src="img/ad-img/monitor.jpg"
                                    style="width: 100%; height: 275px; object-fit: cover;" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="header-img">
                        <div class="img-item" style="padding: 0 0 15px 0;">
                            <img src="img/taingheheader.png" />
                        </div>
                        <div class="img-item" style="padding: 15px 0 0 0;">
                            <img src="img/gheheader.png" />
                        </div>
                        <div class="img-item" style="padding: 30px 0 0 0;">
                            <img src="img/caseheader.webp" style="height: 275px; object-fit: cover;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Slider End -->

    <!-- Featured Product Start -->
    <div class="featured-product product">
        <div class="container-fluid">
            <div class="highlighted-products">
                <h1>Sản phẩm nổi bật</h1>
            </div>
            <div class="row align-items-center product-slider product-slider-4">
                <?php
                $sql3 = "SELECT * FROM `product` ORDER BY sold DESC LIMIT 10";
                $rs3 = $conn->query($sql3);
                if (!$rs3) {
                    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
                }
                while ($row = $rs3->fetch_array(MYSQLI_ASSOC)) {
                    echo "<div class='col-lg-3'>";
                    if ($row['discount'] != 0) {
                        echo "<div class='product-item__sale-off'>";
                        echo "<span class = 'product-item__sale-off-percent'>" . $row['discount'] . "%</span>";
                        echo "</div>";
                    }
                    echo "<div class='product-item'>";
                    echo "<div class='product-image'>";
                    echo "<a href='product-detail.html?id=" . $row['product_id'] . "'>";
                    echo "<img src='" . $row['image_link'] . "?>' alt='Product Image'>";
                    echo "</a>";
                    echo "<div class='product-action'>";
                    echo "<a href='product-detail.php?id=" . $row['product_id'] . "'><i class='fa fa-search'></i></a>";
                    echo "</div>";
                    echo "</div>";
                    echo "<div class='product-price' style='height: 100px; padding:10px 50px 0;'>";
                    echo "<h2 style = 'line-height: 20px;
                        max-height: 40px;
                        overflow: hidden;
                        flex: 1;
                        display: -webkit-box;
                        -webkit-box-orient: vertical;
                        -webkit-line-clamp: 2;'>" . $row['product_name'] . "</h2>";
                    if ($row['discount'] != 0) {
                        $discount = $row['price'] - ($row['price'] * $row['discount'] * 0.01);
                        echo "<h3 style = 'position: absolute; bottom: 27px; font-size: 1.1rem;'><span>" . number_format($discount, 0, ',', '.') . " đ</span></h3>";
                        echo "<h3 style='position: absolute; bottom: 7px; text-decoration: line-through; color: #888888; font-size:13px; font-weight: 500;'><span>" . number_format($row['price'], 0, ',', '.') . " đ</span></h3>";
                    } else {
                        if ($row['price'] == 0) {
                            echo "<h3 style='position: absolute; bottom: 20px; color: red'><span>Liên hệ</span></h3>";
                        } else {
                            echo "<h3 style='position: absolute; bottom: 20px;'><span style='font-size: 1.2rem;'>" . number_format($row['price'], 0, ',', '.') . " đ</span></h3>";
                        }
                    }
                    echo "</div>";
                    echo "</div>";
                    echo "</div>";
                }
                ?>
            </div>
            <div class="row align-items-center product-slider product-slider-4">
                <?php
                $sql3 = "SELECT * FROM `product` where category_id='MOR'";
                $rs3 = $conn->query($sql3);
                if (!$rs3) {
                    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
                }
                while ($row = $rs3->fetch_array(MYSQLI_ASSOC)) {
                    echo "<div class='col-lg-3'>";
                    if ($row['discount'] != 0) {
                        echo "<div class='product-item__sale-off'>";
                        echo "<span class = 'product-item__sale-off-percent'>" . $row['discount'] . "%</span>";
                        echo "</div>";
                    }
                    echo "<div class='product-item'>";
                    echo "<div class='product-image'>";
                    echo "<a href='product-detail.html?id=" . $row['product_id'] . "'>";
                    echo "<img src='" . $row['image_link'] . "?>' alt='Product Image'>";
                    echo "</a>";
                    echo "<div class='product-action'>";
                    echo "<a href='product-detail.php?id=" . $row['product_id'] . "'><i class='fa fa-search'></i></a>";
                    echo "</div>";
                    echo "</div>";
                    echo "<div class='product-price' style='height: 100px; padding:10px 50px 0;'>";
                    echo "<h2 style = 'line-height: 20px;
                        max-height: 40px;
                        overflow: hidden;
                        flex: 1;
                        display: -webkit-box;
                        -webkit-box-orient: vertical;
                        -webkit-line-clamp: 2;'>" . $row['product_name'] . "</h2>";
                    if ($row['discount'] != 0) {
                        $discount = $row['price'] - ($row['price'] * $row['discount'] * 0.01);
                        echo "<h3 style = 'position: absolute; bottom: 27px; font-size: 1.1rem;'><span>" . number_format($discount, 0, ',', '.') . " đ</span></h3>";
                        echo "<h3 style='position: absolute; bottom: 7px; text-decoration: line-through; color: #888888; font-size:13px; font-weight: 500;'><span>" . number_format($row['price'], 0, ',', '.') . " đ</span></h3>";
                    } else {
                        if ($row['price'] == 0) {
                            echo "<h3 style='position: absolute; bottom: 20px; color: red'><span>Liên hệ</span></h3>";
                        } else {
                            echo "<h3 style='position: absolute; bottom: 20px;'><span style='font-size: 1.2rem;'>" . number_format($row['price'], 0, ',', '.') . " đ</span></h3>";
                        }
                    }
                    echo "</div>";
                    echo "</div>";
                    echo "</div>";
                }
                ?>
            </div>
            <div class="row align-items-center product-slider product-slider-4">
                <?php
                $sql3 = "SELECT * FROM `product` where category_id='VGA'";
                $rs3 = $conn->query($sql3);
                if (!$rs3) {
                    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
                }
                while ($row = $rs3->fetch_array(MYSQLI_ASSOC)) {
                    echo "<div class='col-lg-3'>";
                    if ($row['discount'] != 0) {
                        echo "<div class='product-item__sale-off'>";
                        echo "<span class = 'product-item__sale-off-percent'>" . $row['discount'] . "%</span>";
                        echo "</div>";
                    }
                    echo "<div class='product-item'>";
                    echo "<div class='product-image'>";
                    echo "<a href='product-detail.html?id=" . $row['product_id'] . "'>";
                    echo "<img src='" . $row['image_link'] . "?>' alt='Product Image'>";
                    echo "</a>";
                    echo "<div class='product-action'>";
                    echo "<a href='product-detail.php?id=" . $row['product_id'] . "'><i class='fa fa-search'></i></a>";
                    echo "</div>";
                    echo "</div>";
                    echo "<div class='product-price' style='height: 100px; padding:10px 50px 0;'>";
                    echo "<h2 style = 'line-height: 20px;
                        max-height: 40px;
                        overflow: hidden;
                        flex: 1;
                        display: -webkit-box;
                        -webkit-box-orient: vertical;
                        -webkit-line-clamp: 2;'>" . $row['product_name'] . "</h2>";
                    if ($row['discount'] != 0) {
                        $discount = $row['price'] - ($row['price'] * $row['discount'] * 0.01);
                        echo "<h3 style = 'position: absolute; bottom: 27px; font-size: 1.1rem;'><span>" . number_format($discount, 0, ',', '.') . " đ</span></h3>";
                        echo "<h3 style='position: absolute; bottom: 7px; text-decoration: line-through; color: #888888; font-size:13px; font-weight: 500;'><span>" . number_format($row['price'], 0, ',', '.') . " đ</span></h3>";
                    } else {
                        if ($row['price'] == 0) {
                            echo "<h3 style='position: absolute; bottom: 20px; color: red'><span>Liên hệ</span></h3>";
                        } else {
                            echo "<h3 style='position: absolute; bottom: 20px;'><span style='font-size: 1.2rem;'>" . number_format($row['price'], 0, ',', '.') . " đ</span></h3>";
                        }
                    }
                    echo "</div>";
                    echo "</div>";
                    echo "</div>";
                }
                ?>
            </div>
        </div>
    </div>
    <!-- Featured Product End -->

    <!-- Brand Start -->
    <div class="brand">
        <div class="container-fluid">
            <div class="brand-slider">
                <div class="brand-item"><img src="img/brand/msi-logo.png" alt=""></div>
                <div class="brand-item"><img src="" alt=""></div>
                <div class="brand-item"><img src="img/brand/acer-logo.jpg" alt=""></div>
                <div class="brand-item"><img src="" alt=""></div>
                <div class="brand-item"><img src="img/brand/asus-logo.png" alt=""></div>
                <div class="brand-item"><img src="" alt=""></div>
                <div class="brand-item"><img src="img/brand/cooler-master-logo.png" alt=""></div>
                <div class="brand-item"><img src="" alt=""></div>
                <div class="brand-item"><img src="img/brand/lenovo-logo.png" alt=""></div>
                <div class="brand-item"><img src="" alt=""></div>
                <div class="brand-item"><img src="img/brand/gigabyte-logo.png" alt=""></div>
                <div class="brand-item"><img src="" alt=""></div>
                <div class="brand-item"><img src="img/brand/hp-logo.png" alt=""></div>
                <div class="brand-item"><img src="" alt=""></div>
            </div>
        </div>
    </div>
    <!-- Brand End -->

    <!-- Category Start-->
    <div class="category">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="category-item ch-400">
                        <img src="img/ad-img/case.jpg" />
                        <a class="category-name" href="product-list.php?search=vỏ+case">
                            <p>CASE</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="category-item ch-250">
                        <img src="img/ad-img/mainboard.jpg" />
                        <a class="category-name" href="product-list.php?search=main">
                            <p>MAINBOARD</p>
                        </a>
                    </div>
                    <div class="category-item ch-150">
                        <img src="img/ad-img/vga.jpg" />
                        <a class="category-name" href="product-list.php?search=vga">
                            <p>VGA</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="category-item ch-150">
                        <img src="img/ad-img/monitor.jpg" />
                        <a class="category-name" href="product-list.php?search=màn+hình">
                            <p>MONITOR</p>
                        </a>
                    </div>
                    <div class="category-item ch-250">
                        <img src="img/ad-img/cpu.png" />
                        <a class="category-name" href="product-list.php?search=vi+xử+lý">
                            <p>CPU</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="category-item ch-400">
                        <img src="img/ad-img/keyboard.webp" />
                        <a class="category-name" href="product-list.php?search=bàn+phím">
                            <p>KEYBOARD</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Category End-->

    <!-- Feature Start-->
    <div class="feature">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-6 feature-col">
                    <div class="feature-content">
                        <i class="fas fa-handshake"></i>
                        <h2>Uy tín, chất lượng</h2>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 feature-col">
                    <div class="feature-content">
                        <i class="fa fa-truck"></i>
                        <h2>Giao hàng nhanh chóng</h2>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 feature-col">
                    <div class="feature-content">
                        <i class="fa fa-sync-alt"></i>
                        <h2>Đổi trả trong vòng 7 ngày</h2>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 feature-col">
                    <div class="feature-content">
                        <i class="fa fa-comments"></i>
                        <h2>Hỗ trợ 24/7</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Feature End-->

    <!-- Call to Action Start -->
    <div class="call-to-action">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1>Liên hệ với Nam Anh</h1>
                </div>
                <div class="col-md-6">
                    <a href="tel:0856788999">0856-788-999</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Call to Action End -->

    <!-- Google Map Start -->
    <div class="contact">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-12">
                    <div class="contact-map">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d232.9090068087773!2d106.33024116983677!3d20.93065357040594!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31359b3bbfce0e15%3A0xf531ac4756c0845c!2zNTkgQsO5aSBUaOG7iyBYdcOibiwgUC4gTMOqIFRoYW5oIG5naOG7iywgSOG6o2kgRMawxqFuZywgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1736483422805!5m2!1sen!2s"
                            width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Google Map End -->

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
    <script>
        function mustInput() {
            alert('Vui lòng đăng nhập!');
        }
    </script>

</body>

</html>