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
                <li class="breadcrumb-item active">Sản phẩm</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product List Start -->
    <div class="product-view">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="product-view-top">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="product-short">
                                            <div class="dropdown">
                                                <?php
                                                if (isset($_GET['sort'])) {
                                                    $sort_name = "";
                                                    if ($sort == 1) {
                                                        $sort_name = "Mới nhất";
                                                    } elseif ($sort == 3) {
                                                        $sort_name = "Giá từ thấp đến cao";
                                                    } elseif ($sort == 4) {
                                                        $sort_name = "Giá từ cao đến thấp";
                                                    } else {
                                                        $sort_name = "Bán chạy nhất";
                                                    }
                                                    echo "<div class='dropdown-toggle' data-toggle='dropdown'>" . $sort_name . "</div>";
                                                } else {
                                                    echo "<div class='dropdown-toggle' data-toggle='dropdown'>Sắp xếp theo</div>";
                                                }
                                                ?>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <?php
                                                    $link1 = "product-list.php?id=1";
                                                    if (isset($_GET['price_from'])) {
                                                        $link1 = $link1 . "&price_from=" . $price_from;
                                                        if (isset($_GET['search']) && strlen($_GET['search']) > 0) {
                                                            $link1 = $link1 . "&search=" . $search;
                                                        }
                                                    } else {
                                                        if (isset($_GET['search']) && strlen($_GET['search']) > 0) {
                                                            $link1 = $link1 . "&search=" . $search;
                                                        }

                                                    }
                                                    echo "<a href='" . $link1 . "&sort=1' class='dropdown-item'>Mới nhất</a>";
                                                    echo "<a href='" . $link1 . "&sort=2' class='dropdown-item'>Bán chạy nhất</a>";
                                                    echo "<a href='" . $link1 . "&sort=3' class='dropdown-item'>Giá từ thấp đến cao</a>";
                                                    echo "<a href='" . $link1 . "&sort=4' class='dropdown-item'>Giá từ cao đến thấp</a>";
                                                    ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="product-price-range">
                                            <div class="dropdown">
                                                <?php
                                                if (isset($_GET['price_from'])) {
                                                    $price_from_name = "";
                                                    if ($price_from == 1) {
                                                        $price_from_name = "Dưới 1.000.000đ";
                                                    } elseif ($price_from == 2) {
                                                        $price_from_name = "1.000.000đ - 10.000.000đ";
                                                    } elseif ($price_from == 3) {
                                                        $price_from_name = "10.000.000đ - 50.000.000đ";
                                                    } else {
                                                        $price_from_name = "Trên 50.000.000đ";
                                                    }
                                                    echo "<div class='dropdown-toggle' data-toggle='dropdown'>" . $price_from_name . "</div>";
                                                } else {
                                                    echo "<div class='dropdown-toggle' data-toggle='dropdown'>Tầm giá</div>";
                                                }
                                                ?>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <?php
                                                    $link2 = "product-list.php?id=1";
                                                    if (isset($_GET['sort'])) {
                                                        $link2 = $link2 . "&sort=" . $sort;
                                                        if (isset($_GET['search']) && strlen($_GET['search']) > 0) {
                                                            $link2 = $link2 . "&search=" . $search;
                                                        }
                                                    } else {
                                                        if (isset($_GET['search']) && strlen($_GET['search']) > 0) {
                                                            $link2 = $link2 . "&search=" . $search;
                                                        }
                                                    }
                                                    echo "<a href='" . $link2 . "&price_from=1' class='dropdown-item'>Dưới 1.000.000đ</a>";
                                                    echo "<a href='" . $link2 . "&price_from=2' class='dropdown-item'>1.000.000đ - 10.000.000đ</a>";
                                                    echo "<a href='" . $link2 . "&price_from=3' class='dropdown-item'>10.000.000đ - 50.000.000đ</a>";
                                                    echo "<a href='" . $link2 . "&price_from=4' class='dropdown-item'>Trên 50.000.000đ</a>";
                                                    ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php
                        $sql = "SELECT * FROM `product`";
                        if (isset($_GET['price_from'])) {
                            if ($_GET['price_from'] == 1) {
                                $sql = $sql . " WHERE price <= 1000000";
                            } elseif ($_GET['price_from'] == 2) {
                                $sql = $sql . " WHERE price > 1000000 AND price <= 10000000";
                            } elseif ($_GET['price_from'] == 3) {
                                $sql = $sql . " WHERE price > 10000000 AND price <= 50000000";
                            } else {
                                $sql = $sql . " WHERE price > 50000000";
                            }
                            if (isset($_GET['search']) && strlen($_GET['search']) > 0) {
                                $sql = $sql . " AND (product_name LIKE '%" . $search . "%' OR category_id = 
                                        (SELECT category_id FROM `category` WHERE category_name LIKE '%" . $search . "%') OR brand_id = 
                                        (SELECT brand_id FROM `brand` WHERE brand_name LIKE '%" . $search . "%'))";
                            }
                        } else {
                            if (isset($_GET['search']) && strlen($_GET['search']) > 0) {
                                $sql = $sql . " WHERE product_name LIKE '%" . $search . "%' OR category_id = 
                                        (SELECT category_id FROM `category` WHERE category_name LIKE '%" . $search . "%') OR brand_id = 
                                        (SELECT brand_id FROM `brand` WHERE brand_name LIKE '%" . $search . "%')";
                            }
                        }
                        if (isset($_GET['sort'])) {
                            if ($_GET['sort'] == 1) {
                                $sql = $sql . " ORDER BY saledate DESC";
                            } elseif ($_GET['sort'] == 3) {
                                $sql = $sql . " ORDER BY price ASC";
                            } elseif ($_GET['sort'] == 4) {
                                $sql = $sql . " ORDER BY price DESC";
                            } else {
                                $sql = $sql . " ORDER BY sold DESC";
                            }
                        }
                        $rs = $conn->query($sql);

                        if (!$rs) {
                            die("Không có sản phẩm nào để hiển thị!");
                        }
                        $count_product = 0;
                        $numProductInAPage = 15;
                        echo "<div class='col-lg-12' style = 'display: contents;'>";
                        while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
                            if ($count_product >= ($page_number - 1) * $numProductInAPage && $count_product < ($page_number - 1) * $numProductInAPage + $numProductInAPage) {
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
                                echo "<a href='product-detail.php?id=" . $row['product_id'] . "'><i class='fa fa-search'></i></a>";
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
                                        echo "<h3 style='position: absolute; bottom: 20px; '><span style='font-size: 1.2rem;'>" . number_format($row['price'], 0, ',', '.') . " đ</span></h3>";
                                    }
                                }
                                echo "</div>";
                                echo "</div>";
                                echo "</div>";
                            }
                            if ($count_product == (($page_number - 1) * $numProductInAPage + $numProductInAPage))
                                break;
                            $count_product++;
                        }
                        echo "</div>";
                        ?>
                    </div>
                    <!-- Pagination Start -->
                    <div class="col-md-12">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <?php
                                $totalProduct = mysqli_num_rows($rs);
                                $totalPage = $totalProduct / $numProductInAPage;
                                if ($totalPage > floor($totalPage)) {
                                    for ($count = 1; $count <= floor($totalPage) + 1; $count++) {
                                        $link = "product-list.php?page_num=" . $count;
                                        if (isset($_GET['sort'])) {
                                            $link = $link . "&sort=" . $sort;
                                        }
                                        if (isset($_GET['price_from'])) {
                                            $link = $link . "&price_from=" . $price_from;
                                        }
                                        if (isset($_GET['search']) && strlen($_GET['search']) > 0) {
                                            $link = $link . "&search=" . $search;
                                        }
                                        if ($count == $page_number)
                                            echo "<li class='page-item active'><a class='page-link' href='" . $link . "'>" . $count . "</a></li>";
                                        else
                                            echo "<li class='page-item'><a class='page-link' href='" . $link . "'>" . $count . "</a></li>";
                                    }
                                } else {
                                    for ($count = 1; $count < floor($totalPage) + 1; $count++) {
                                        $link = "product-list.php?page_num=" . $count;
                                        if (isset($_GET['sort'])) {
                                            $link = $link . $sort;
                                        }
                                        if (isset($_GET['price_from'])) {
                                            $link = $link . $price_from;
                                        }
                                        if (isset($_GET['search']) && strlen($_GET['search']) > 0) {
                                            $link = $link . "&search=" . $search;
                                        }
                                        if ($count == $page_number)
                                            echo "<li class='page-item active'><a class='page-link' href='" . $link . "'>" . $count . "</a></li>";
                                        else
                                            echo "<li class='page-item'><a class='page-link' href='" . $link . "'>" . $count . "</a></li>";
                                    }
                                }
                                ?>
                            </ul>
                        </nav>
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
                                    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
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
                                die("Lỗi không thể truy xuất cơ sở dữ liệu!");
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
                                    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
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
        function continue_page() {
            let currentPage = document.getElementsByClassName("active")[2].value;
            alert(currentPage);
        }
    </script>
</body>

</html>