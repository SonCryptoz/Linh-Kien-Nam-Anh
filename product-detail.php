<?php
session_start();
require_once('moneyPoint.php');
if (isset($_GET['id'])) {
    $id = $_GET['id'];
} else {
    header('Location: product-list.php?id=page_num=1');
}

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");

if ($conn->connect_error) {
    die("Lỗi không thể kết nối!");
}
mysqli_set_charset($conn, "utf8");

$sql = "SELECT  
            product.*, 
            category.category_name, 
            brand.brand_name 
        FROM 
            product
        LEFT JOIN 
            category ON product.category_id = category.category_id
        LEFT JOIN 
            brand ON product.brand_id = brand.brand_id
        WHERE 
            product.product_id = '$id';
        ";
$rs = $conn->query($sql);
if (!$rs) {
    die("Lỗi không thể truy xuất cơ sỡ dữ liệu!");
}
$info = NULL;
while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
    $info = $row;
}

// Kiểm tra xem 'product_thongso' có tồn tại và có giá trị không
if (isset($info['product_thongso']) && !empty($info['product_thongso'])) {
    // Nếu 'product_thongso' có giá trị, tiến hành tách chuỗi
    // Thực hiện tách chuỗi theo dấu '-'
    $amountArray = explode('-', $info['product_thongso']);

    // In ra giá trị của mảng sau khi tách

} else {
    // Nếu 'product_thongso' không có giá trị, gán mảng rỗng
    $amountArray = [];
}

// Kiểm tra xem 'product_thongso' có tồn tại và có giá trị không

$rowIndex = 0; // Biến đếm số thứ tự dòng

if (isset($info['product_thongso']) && !empty($info['product_thongso'])) {
    // Nếu 'product_thongso' có giá trị, tiến hành tách chuỗi
    // Thực hiện tách chuỗi theo dấu '-'
    $amountArray = explode('-', $info['product_thongso']);

    // Mảng lưu trữ tên thông số có dấu ':'
    $specNames = [];
    // Mảng lưu trữ giá trị thông số có dấu ':'
    $specValues = [];
    // Mảng lưu trữ thông số không có dấu ':'
    $noColon = [];

    // Lặp qua mảng và tách theo dấu ':'
    foreach ($amountArray as $item) {
        // Tách mỗi phần tử theo dấu ':'
        $parts = explode(':', $item);

        if (count($parts) == 2) {
            // Nếu có đúng 2 phần tử sau khi tách, thêm vào 2 mảng (specNames và specValues)
            $specNames[] = trim($parts[0]); // Thêm tên thông số vào mảng specNames
            $specValues[] = trim($parts[1]); // Thêm giá trị thông số vào mảng specValues
        } else {
            // Nếu không có dấu ':', thêm phần tử vào mảng noColon
            $noColon[] = $item;
        }
    }

    // In ra kết quả (hoặc sử dụng các mảng này trong HTML sau)

} else {
    // Nếu 'product_thongso' không có giá trị, gán mảng rỗng
    $amountArray = [];
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
    header('Location: index.php');
}

$sqlCart = "SELECT * FROM `cart` WHERE user_id = $user_id";
$rs = $conn->query($sqlCart);
if (!$rs) {
    die("Lỗi không thể truy xuất cơ sỡ dữ liệu!");
}
$productInCart = $rs->num_rows;

$_SESSION['cart-product'] = $id;

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
                <li class="breadcrumb-item active">Chi tiết sản phẩm</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Detail Start -->
    <div class="product-detail">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product-detail-top">
                        <div class="row align-items-center">
                            <div class="col-md-5">
                                <div class="carousel-container">
                                    <!-- Main Carousel (Top) -->
                                    <div class="main-carousel">
                                        <div class="main-carousel-track">
                                            <?php
                                            $sqlanhmota = "SELECT * FROM `product_details` where product_id='$id' ";
                                            $rsanhmota = $conn->query($sqlanhmota);
                                            if (!$rsanhmota) {
                                                die("Lỗi không thể truy xuất cơ sỡ dữ liệu!");
                                            }
                                            while ($row = $rsanhmota->fetch_array(MYSQLI_ASSOC)) {
                                                echo "<div class='main-carousel-slide'>";
                                                echo "<img src='" . $row['image_details'] . "' alt='Product Image'>";
                                                echo "</div>";
                                            }
                                            ?>
                                        </div>
                                        <div class="carousel-buttons">
                                            <button class="carousel-button main-prev">&#8592;</button>
                                            <button class="carousel-button main-next">&#8594;</button>
                                        </div>
                                    </div>

                                    <!-- Multi-Image Carousel (Bottom) -->
                                    <div class="multi-carousel">
                                        <div class="multi-carousel-track">
                                            <?php
                                            $sqlanhmota = "SELECT * FROM `product_details` where product_id='$id' ";
                                            $rsanhmota = $conn->query($sqlanhmota);
                                            if (!$rsanhmota) {
                                                die("Lỗi không thể truy xuất cơ sỡ dữ liệu!");
                                            }
                                            while ($row = $rsanhmota->fetch_array(MYSQLI_ASSOC)) {
                                                echo "<div class='multi-carousel-slide'>";
                                                echo "<div class='carousel-box'>";
                                                echo "<img src='" . $row['image_details'] . "' alt='Product Image'>";
                                                echo "</div>";
                                                echo "</div>";
                                            }
                                            ?>

                                        </div>
                                        <div class="carousel-buttons">
                                            <button class="carousel-button multi-prev">&#8592;</button>
                                            <button class="carousel-button multi-next">&#8594;</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="product-content">
                                    <div class="title-product">
                                        <h2><?php echo $info['product_name'] ?></h2>
                                    </div>
                                    <div class="price">
                                        <?php
                                        if ($info['price'] == 0) {
                                            echo "<p>Liên hệ</p>";
                                        } else {
                                            echo '<h4 class="header-checkout_text">Giá:</h4>';
                                            echo '<p>' . number_format($info['price'], 0, ',', '.') . ' đ</p>';
                                        }
                                        ?>
                                    </div>
                                    <div class="price">
                                        <h4 class="header-checkout_text">Giá mới:</h4>
                                        <p>
                                            <?php
                                            // Kiểm tra nếu giá = 0, không hiển thị gì
                                            if ($info['price'] == 0) {
                                                echo ""; // Không hiển thị gì
                                            } else {
                                                if ($info['discount'] == 0) {
                                                    echo number_format($info['price'], 0, ',', '.') . " đ";
                                                } else {
                                                    $discount = $info['price'] - ($info['price'] * $info['discount'] * 0.01);
                                                    echo number_format($discount, 0, ',', '.') . " đ - Giảm " . $info['discount'] . "%";
                                                }
                                            }
                                            ?>
                                        </p>
                                    </div>
                                    <div class="quantity">
                                        <h4 class="header-checkout_text">Số lượng:</h4>
                                        <form id="product-to-cart">
                                            <div onclick="minus_qty();" class="btn-minus"><i class="fa fa-minus"></i>
                                            </div>
                                            <input class="quantity-product quantity" type="text" value="1"
                                                name="amountProduct" id="amountProduct">
                                            <div onclick="plus_qty();" class="btn-plus"><i class="fas fa-plus"></i>
                                            </div>
                                        </form>
                                    </div>
                                    <h4 class="header-checkout_text" style="font-weight: 600; font-size: 15px;">
                                        <span>Hàng trong kho: </span>
                                        <span style="color: green; font-size: 20px;">
                                            <?php echo $info['amount']; ?>
                                        </span>
                                    </h4>
                                    <div class="action">
                                        <?php
                                        if ($info['amount'] > 0) {
                                            echo "<a style = 'margin-top: 20px'class='btn' name = 'submit' id='submit' type='submit' onclick=' addToCart(); return false' href=''><i class='fa fa-shopping-cart'></i>Thêm vào giỏ hàng</a>";
                                            echo "<a style='margin-top: 20px' class='btn' name='submit' id='submit' type='submit' onclick=' addBuild(); return false' href=''><i class='fa fa-heart'></i>Thêm vào cấu hình</a>";
                                        } else {
                                            echo "<a style = 'margin-top: 20px'class='btn';' href=''><i class='fa fa-shopping-cart'></i>Đã hết hàng</a>";
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row product-detail-bottom">
                        <div class="col-lg-12">
                            <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active" id="admin-list-nav" data-toggle="pill" href="#description"
                                    role="tab">Mô tả</a>
                                <a class="nav-link" id="new-admin-nav" data-toggle="pill" href="#specification"
                                    role="tab">Thông số kỹ thuật</a>
                            </div>
                            <div class="tab-content" style="font-size: 1.2rem;">
                                <div id="description" class="container tab-pane active">
                                    <h4>Mô tả</h4>
                                    <p style="text-align: justify;">
                                        <?php echo $info['description']; ?>
                                    </p>
                                    <img src="<?php echo $info["image_link"] ?>" style="width: 100%;
                                        height: 100%; 
                                        object-fit: cover; 
                                        max-width: 100%;
                                        max-height: 100%;">
                                    </img>
                                </div>
                                <div id="specification" class="container tab-pane fade">
                                    <!-- Xuất các thông số sản phẩm -->
                                    <table
                                        style="border: 1px solid black; border-collapse: collapse;width: 100%; margin-bottom:50px; font-size: 1.2rem;">
                                        <thead>
                                            <tr>
                                                <th style="border: 1px solid var(--primary-color); padding: 10px;">TÊN THÔNG SỐ</th>
                                                <th style="border: 1px solid var(--primary-color); padding: 10px;">GIÁ TRỊ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            if (!empty($specNames) && !empty($specValues)) {
                                                $count = count($specNames); // Số lượng thông số
                                            
                                                // Hiển thị thông số có dấu ':'
                                                for ($i = 0; $i < $count; $i++) {
                                                    // Kiểm tra dòng chẵn hay lẻ và gán màu nền
                                                    $rowColor = ($rowIndex % 2 == 0) ? '#f2f2f2' : '#ffffff'; // xám cho dòng chẵn, trắng cho dòng lẻ
                                                    echo "<tr style='background-color: $rowColor;'>
                                                        <td style='border: 1px solid var(--primary-color); padding: 10px; font-weight: bold;'>{$specNames[$i]}</td>
                                                        <td style='border: 1px solid var(--primary-color); padding: 10px;'>{$specValues[$i]}</td>
                                                      </tr>";
                                                    $rowIndex++; // Tăng chỉ số dòng
                                                }
                                            }

                                            // Hiển thị thông số không có dấu ':'
                                            if (!empty($noColon)) {
                                                foreach ($noColon as $item) {
                                                    // Kiểm tra dòng chẵn hay lẻ và gán màu nền
                                                    $rowColor = ($rowIndex % 2 == 0) ? '#f2f2f2' : '#ffffff'; // xám cho dòng chẵn, trắng cho dòng lẻ
                                                    echo "<tr style='background-color: $rowColor;'>
                                                        <td colspan='2' style='border: 1px solid var(--primary-color); padding: 10px; font-weight: bold;'>$item</td>
                                                      </tr>";
                                                    $rowIndex++; // Tăng chỉ số dòng
                                                }
                                            }

                                            // Nếu không có thông số sản phẩm
                                            if (empty($specNames) && empty($noColon)) {
                                                echo "<tr><td colspan='2' style='border: 1px solid black;'>Không có thông số sản phẩm.</td></tr>";
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                    <h4 style="margin-top: 30px;">Thông tin thêm</h4>
                                    <ul style="font-size: 1.2rem;">
                                        <li>Năm ra mắt: <?php echo $info['date_first_available']; ?></li>
                                    </ul>
                                    <ul style="font-size: 1.2rem;">
                                        <li>Thương hiệu: <?php echo $info['brand_name']; ?></li>
                                    </ul>
                                    <ul style="font-size: 1.2rem;">
                                        <li>Loại sản phẩm: <?php echo $info['category_name']; ?></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="featured-product product">
                        <div class="container-fluid1">
                            <div class="highlighted-products">
                                <h1>Sản phẩm liên quan </h1>
                            </div>
                            <div class="row align-items-center product-slider product-slider-3">
                                <?php
                                $sql3 = "SELECT * FROM `product` where category_id='$info[category_id]'";
                                $rs3 = $conn->query($sql3);
                                if (!$rs3) {
                                    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
                                }
                                while ($row = $rs3->fetch_array(MYSQLI_ASSOC)) {
                                    echo "<div class='col-md-4'>";
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
                                    echo "<a href='view-product-detail.php?id=" . $row['product_id'] . "'><i class='fa fa-search'></i></a>";
                                    echo "</div>";
                                    echo "</div>";
                                    echo "<div class='product-price' style='height: 100px;'>";
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
                </div>

                <!-- Side Bar Start -->
                <div class="col-lg-4 sidebar">
                    <div class="sidebar-widget category">
                        <h2 class="title">Loại sản phẩm</h2>
                        <nav class="navbar bg-light">
                            <ul class="navbar-nav">
                                <?php
                                $sql1 = "SELECT * FROM `category`";
                                $rs1 = $conn->query($sql1);
                                if (!$rs1) {
                                    die("Lỗi không thể truy xuất cơ sỡ dữ liệu!");
                                }
                                while ($row = $rs1->fetch_array(MYSQLI_ASSOC)) {
                                    echo "<li class='nav-item'><a class='nav-link' href='product-list.php?id=1&search=" . $row['category_name'] . "'>" . $row['category_name'] . "</a>";
                                }
                                ?>
                            </ul>
                        </nav>
                    </div>


                    <div class="sidebar-widget widget-slider">
                        <div class="sidebar-slider normal-slider">
                            <?php
                            $sql3 = "SELECT * FROM `product` ORDER BY sold LIMIT 5";
                            $rs3 = $conn->query($sql3);
                            if (!$rs3) {
                                die("Lỗi không thể truy xuất cơ sỡ dữ liệu!");
                            }
                            while ($row = $rs3->fetch_array(MYSQLI_ASSOC)) {
                                echo "<div class='product-item'>";
                                echo "<div class='product-image'>";
                                echo "<a href='product-detail.php?id=" . $row['product_id'] . "'>";
                                echo "<img src='" . $row['image_link'] . "' alt='Product Image'>";
                                echo "</a>";
                                echo "<div class='product-action'>";
                                echo "<a href='product-detail.php?id=" . $row['product_id'] . "'><i class='fa fa-search'></i></a>";
                                echo "</div>";
                                echo "</div>";
                                echo "<div class='product-price'>";
                                echo "<h2>" . $row['product_name'] . "</h2>";
                                if ($row['discount'] != 0) {
                                    $discount = $row['price'] - ($row['price'] * $row['discount'] * 0.01);
                                    echo "<h3><span>" . number_format($discount, 0, ',', '.') . "đ - Giảm " . $row['discount'] . "%</span></h3>";
                                } else {
                                    echo "<h3><span>" . number_format($row['price'], 0, ',', '.') . "đ</span></h3>";
                                }
                                echo "</div>";
                                echo "</div>";
                            }

                            ?>
                        </div>
                    </div>


                    <div class="sidebar-widget category">
                        <h2 class="title">Thương hiệu</h2>
                        <nav class="navbar bg-light">
                            <ul class="navbar-nav">
                                <?php
                                $sql2 = "SELECT * FROM `brand`";
                                $rs2 = $conn->query($sql2);
                                if (!$rs2) {
                                    die("Lỗi không thể truy xuất cơ sỡ dữ liệu!");
                                }
                                while ($row = $rs2->fetch_array(MYSQLI_ASSOC)) {
                                    echo "<li class='nav-item'><a class='nav-link' href='product-list.php?id=1&search=" . $row['brand_name'] . "'>" . $row['brand_name'] . "</a>";
                                }
                                ?>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- Side Bar End -->
            </div>
        </div>
    </div>
    <!-- Product Detail End -->


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
    <script src="js/addCart.js"></script>
    <script src="js/main.js"></script>
    <script src="js/addbuild.js"></script>
    <script>
        function minus_qty() {
            if (document.getElementById("amountProduct").value > 1) {
                document.getElementById("amountProduct").value -= 1;
            }

        }
        function plus_qty() {
            document.getElementById("amountProduct").value = Number(document.getElementById("amountProduct").value) + 1;
        }

        // Main Carousel (Single Image)
        const mainTrack = document.querySelector('.main-carousel-track');
        const mainSlides = Array.from(mainTrack.children);
        let mainIndex = 0;

        // Cập nhật vị trí slide chính
        const updateMainSlidePosition = () => {
            mainTrack.style.transform = `translateX(-${mainIndex * 100}%)`;
        };

        // Xử lý nút điều hướng cho slide chính (nếu tồn tại)
        const mainNextButton = document.querySelector('.main-next');
        const mainPrevButton = document.querySelector('.main-prev');

        if (mainNextButton && mainPrevButton) {
            mainNextButton.addEventListener('click', () => {
                mainIndex = (mainIndex + 1) % mainSlides.length; // Tới slide tiếp theo
                updateMainSlidePosition();
            });

            mainPrevButton.addEventListener('click', () => {
                mainIndex = (mainIndex - 1 + mainSlides.length) % mainSlides.length; // Quay lại slide trước đó
                updateMainSlidePosition();
            });
        }
        document.addEventListener('DOMContentLoaded', function () {
            const images = document.querySelectorAll('.main-carousel-slide img');
            const thumbnailImages = document.querySelectorAll('.multi-carousel-slide');

            // Lắng nghe sự kiện khi nhấn vào ảnh thumbnail
            thumbnailImages.forEach((thumbnail, index) => {
                thumbnail.addEventListener('click', function () {
                    // Lấy ra chỉ số ảnh được chọn từ thumbnail
                    const mainCarousel = document.querySelector('.main-carousel-track');
                    const slides = document.querySelectorAll('.main-carousel-slide');

                    // Cập nhật slide chính tương ứng với ảnh thumbnail được chọn
                    mainCarousel.style.transform = `translateX(-${index * 100}%)`;

                    // Xóa lớp 'selected' khỏi tất cả các thumbnail
                    thumbnailImages.forEach(img => img.classList.remove('selected'));

                    // Thêm lớp 'selected' vào thumbnail hiện tại
                    thumbnail.classList.add('selected');
                });
            });

            // Cập nhật thumbnail khi chuyển slide chính
            const mainNextButton = document.querySelector('.main-next');
            const mainPrevButton = document.querySelector('.main-prev');
            const mainTrack = document.querySelector('.main-carousel-track');
            const mainSlides = Array.from(mainTrack.children);
            let mainIndex = 0;

            const updateMainSlidePosition = () => {
                mainTrack.style.transform = `translateX(-${mainIndex * 100}%)`;
                // Cập nhật thumbnail khi chuyển slide chính
                thumbnailImages.forEach(thumbnail => thumbnail.classList.remove('selected'));
                thumbnailImages[mainIndex].classList.add('selected');
            };

            // Sự kiện cho nút Next và Prev của carousel chính
            mainNextButton.addEventListener('click', () => {
                mainIndex = (mainIndex + 1) % mainSlides.length;
                updateMainSlidePosition();
            });

            mainPrevButton.addEventListener('click', () => {
                mainIndex = (mainIndex - 1 + mainSlides.length) % mainSlides.length;
                updateMainSlidePosition();
            });

            // Khởi tạo vị trí ban đầu
            updateMainSlidePosition();
        });
        const slides = document.querySelectorAll('.multi-carousel-slide');

        slides.forEach(slide => {
            slide.addEventListener('click', () => {
                // Loại bỏ lớp 'selected' khỏi tất cả ảnh
                slides.forEach(s => s.classList.remove('selected'));

                // Thêm lớp 'selected' vào ảnh được chọn
                slide.classList.add('selected');
            });
        });

        // Multi-Image Carousel (Thumbnails)
        const multiTrack = document.querySelector('.multi-carousel-track');
        const multiSlides = Array.from(multiTrack.children);
        const slidesToShow = 4; // Số lượng thumbnail hiển thị cùng lúc
        let multiIndex = 0;

        // Xác định kích thước mỗi thumbnail
        const multiSlideWidth = multiTrack.getBoundingClientRect().width / slidesToShow;
        multiSlides.forEach(slide => {
            slide.style.width = `${multiSlideWidth}px`;
        });

        // Cập nhật vị trí slide nhỏ
        const updateMultiSlidePosition = () => {
            multiTrack.style.transform = `translateX(-${multiIndex * multiSlideWidth}px)`;
        };

        // Xử lý nút điều hướng cho slide nhỏ (nếu tồn tại)
        const multiNextButton = document.querySelector('.multi-next');
        const multiPrevButton = document.querySelector('.multi-prev');

        if (multiNextButton && multiPrevButton) {
            multiNextButton.addEventListener('click', () => {
                if (multiIndex < multiSlides.length - slidesToShow) {
                    multiIndex++; // Di chuyển tới
                } else {
                    multiIndex = 0; // Vòng lại đầu
                }
                updateMultiSlidePosition();
            });

            multiPrevButton.addEventListener('click', () => {
                if (multiIndex > 0) {
                    multiIndex--; // Di chuyển lui
                } else {
                    multiIndex = multiSlides.length - slidesToShow; // Vòng lại cuối
                }
                updateMultiSlidePosition();
            });
        }

        // Khi nhấn vào thumbnail, cập nhật slide chính
        const multiImages = document.querySelectorAll('.multi-carousel-slide img');
        multiImages.forEach((img, index) => {
            img.addEventListener('click', () => {
                mainIndex = index; // Cập nhật index chính
                updateMainSlidePosition();
            });
        });

        // Khởi tạo vị trí ban đầu
        updateMainSlidePosition();
        updateMultiSlidePosition();

    </script>
</body>

</html>