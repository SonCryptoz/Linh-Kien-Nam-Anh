<?php
session_start();
require_once('moneyPoint.php');

$sort = 0;
$price_from = 0;
$search = NULL;
if (isset($_GET['sort'])) {
    $sort = $_GET['sort'];
}
if (isset($_GET['price_from'])) {
    $price_from = $_GET['price_from'];
}
if (isset($_GET['search']) && strlen($_GET['search']) == 0) {
    header('Location: product-list.php');
} else if (isset($_GET['search'])) {
    $search = $_GET['search'];
}
if (isset($_GET['page_num'])) {
    $page_number = $_GET['page_num'];
} else {
    $page_number = 1;
}

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';

$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");

mysqli_set_charset($conn, "utf8");
if ($conn->connect_error) {
    die("Không thể kết nối!");
}

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
    header('Location: product-list.php');
}

$sqlCart = "SELECT * FROM `cart` WHERE user_id = $user_id";
$rs = $conn->query($sqlCart);
if (!$rs) {
    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
}
$productInCart = $rs->num_rows;
$totalPrice = 0;
$sumPrice = 0;

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
    <div class="breadcrumb-wrap" style="margin-bottom: 30px;">
        <div class="container-fluid">
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="home.php">Trang chủ</a></li>
                <li class="breadcrumb-item active">Xây dựng cấu hình</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!--Build Table Start-->
    <div class="cart-page-inner">

        <div class="table-responsive">
            <table class="table table-bordered">
                <tr>
                    <th class="col-md-3">1. Vi xử lý</th>
                    <td class="col-md-7" style="width: 75%;">
                        <a href="product-list.php?type=build&search=vi+xử+lý" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'CPU'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice; // Cộng dồn tổng giá
                        

                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>

                    </td>
                    <!-- #region -->
                </tr>
                <tr>
                    <th class="col-md-3">2. Mainboard</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=main" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'MNC'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";



                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">3. Ram</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=ram" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'RAM'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">4. HDD</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=hdd" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'HDD'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">5. SSD</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=ssd" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'SSD'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">6. Card đồ họa</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=vga" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'VGA'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">7. Nguồn</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=nguồn" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'PSU'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">8. Vỏ case</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=vỏ+case" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'CAS'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">9. Màn hình</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=màn+hình" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'MOR'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">10. Chuột</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=chuột" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'MOU'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">11. Bàn phím</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=bàn+phím" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'KEY'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">12. Tai nghe</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=tai+nghe" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'PHO'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">13. Loa</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=loa" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'SPK'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
                <tr>
                    <th class="col-md-3">14. Tản nhiệt</th>
                    <td class="col-md-7">
                        <a href="product-list.php?type=build&search=tản+nhiệt" class="btn cart">
                            <i class="fas fa-plus" type="submit"></i>
                            <span>Thêm</span>
                        </a>
                        <?php
                        // Truy vấn sản phẩm trong bảng 'build' của người dùng
                        $sqlBuild = "
                        SELECT b.*, p.product_name, p.price 
                        FROM `build` b
                        INNER JOIN `product` p ON b.product_id = p.product_id
                        WHERE b.user_id = $user_id AND p.category_id = 'COL'";

                        $rs = $conn->query($sqlBuild);

                        // Kiểm tra lỗi truy vấn
                        if (!$rs) {
                            echo "Lỗi không thể truy xuất cơ sở dữ liệu!";
                            exit();
                        }

                        // Đếm số lượng kết quả
                        $count = $rs->num_rows;

                        // Kiểm tra và thông báo nếu có sản phẩm trong bảng build
                        if ($count > 0) {

                        } else {
                            echo "Chưa có sản phẩm trong cấu hình!";
                        }

                        // Lặp qua từng sản phẩm trong bảng 'build'
                        echo "<div class='cart-page-inner'>";
                        echo "<div class='table-responsive'>";
                        echo "<table class='table table-bordered'>";
                        echo "<tbody class='align-middle'>";

                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            // Truy vấn thông tin sản phẩm từ bảng 'product' theo product_id
                            $id_product = $row['product_id'];
                            $sqlProduct = "SELECT * FROM `product` WHERE product_id = '$id_product'";
                            $rsProduct = $conn->query($sqlProduct);

                            // Kiểm tra lỗi khi truy vấn sản phẩm
                            if (!$rsProduct) {
                                echo "Lỗi không thể truy xuất thông tin sản phẩm!";
                                exit();
                            }

                            $productInfo = $rsProduct->fetch_array(MYSQLI_ASSOC);

                            // Hiển thị thông tin sản phẩm
                            echo "<tr>";
                            echo "<td>";
                            echo "<div class='img'>";
                            echo "<div style='display: flex; align-items: center;'>";
                            echo "<a href='product-detail.php?id=" . $productInfo['product_id'] . "'>";
                            echo "<img style='max-width:60px; max-height:60px;' src='" . $productInfo['image_link'] . "' alt='Image'>";
                            echo "</a>";
                            echo "<p style='margin-left: 10px;'>" . $productInfo['product_name'] . "</p>";
                            echo "</div>";
                            echo "</div>";
                            echo "</td>";

                            // Tính giá sản phẩm
                            $price = $productInfo['discount'] == 0 ? $productInfo['price'] : $productInfo['price'] - ($productInfo['price'] * $productInfo['discount'] * 0.01);
                            echo "<td>" . $productInfo['description'] . "</td>";

                            // Hiển thị số lượng và tính tổng tiền
                            echo "<td>" . $row['qty'] . "</td>";
                            $sumPrice = $price * $row['qty'];
                            $totalPrice += $sumPrice;
                            echo "<td>" . number_format($sumPrice, 0, ',', '.') . "đ</td>";

                            // Thêm nút xóa sản phẩm
                            echo "<td><a class='btn cart' href='database/deleteBuidItem.php?user_id=" . $row['user_id'] . "&product_id=" . $row['product_id'] . "'><i class='fa fa-trash'></i></a></td>";
                            echo "</tr>";
                        }

                        echo "</tbody>";
                        echo "</table>";
                        echo "</div>";
                        echo "</div>";

                        // Đóng kết nối sau khi hoàn tất công việc
                        
                        ?>
                    </td>

                </tr>
            </table>
        </div>
    </div>
    <!--Build Table End-->

    <!-- Send To Cart Start -->
    <div class="container">
        <f class="row">
            <form method="POST" id="clearCartForm" action="database/clear_cart.php">
                <button style="margin-top: 20px; background-color: red; color: white;" class="btn" name="clear_cart"
                    type="submit">
                    <i class="fa fa-trash"></i> Xóa tất cả
                </button>
            </form>
            <div class="col">
                <form method="POST" id="addToCartForm" action="database/add_to_cart.php">
                    <!-- Các trường nhập liệu cần thiết cho giỏ hàng -->
                    <input type="hidden" name="product_id" value="1"> <!-- Dữ liệu về sản phẩm -->

                    <!-- Nút thêm vào giỏ hàng -->
                    <button style="margin-top: 20px" class="btn" name="submit" type="submit" onclick="addToCart(event)">
                        <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                    </button>
                </form>
            </div>

            <script>
                function addToCart(event) {
                    event.preventDefault();  // Ngừng hành động mặc định của form (không chuyển trang)

                    var form = document.getElementById("addToCartForm");

                    // Tạo đối tượng FormData từ form để gửi dữ liệu
                    var formData = new FormData(form);

                    // Tạo yêu cầu AJAX
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", form.action, true);

                    // Xử lý khi gửi dữ liệu thành công
                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            alert('Tất cả sản phẩm đã được thêm vào giỏ hàng!');
                            // Nếu muốn, bạn có thể tải lại giỏ hàng hoặc thực hiện một hành động khác.
                        } else {
                            alert('Có lỗi xảy ra khi thêm vào giỏ hàng.');
                        }
                    };

                    // Gửi yêu cầu AJAX
                    xhr.send(formData);
                }
            </script>

            <div class="col-7">
                <h3 class="cart-btn">
                    <span>
                        Tạm tính:
                    </span>
                    <span class="total-checkout-price">
                        <?php echo number_format($totalPrice, 0, ',', '.') . " đ"; ?>
                    </span>
                </h3>
            </div>
    </div>
    <br />
    </div>
    <!-- Send To Cart End -->

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
    <script src="js/addbuildtocart.js"></script>
    <script>
        function mustInput() {
            alert("Vui lòng đăng nhập!");
        }
    </script>
</body>

</html>