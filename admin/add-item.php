<?php
session_start();

if (isset($_SESSION['name']) && isset($_SESSION['id']) && isset($_SESSION['authority'])) {
    $eachPartName = preg_split("/\ /", $_SESSION['name']);
    $countName = count($eachPartName);
    if ($countName == 1) {
        $name = $eachPartName[$countName - 1];
    } else {
        $name = $eachPartName[$countName - 2] . " " . $eachPartName[$countName - 1];
    }
    $user_id = $_SESSION['id'];
} else {
    header('Location: admin-login.html');
}

if ($_SESSION['authority'] == 2) {
    header('Location: transaction-management.php');
}

function add2DB($sql)
{
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '';
    $conn = new mysqli($dbhost, $dbuser, $dbpass, "database");

    if ($conn->connect_error) {
        echo "<script language='javascript'>window.alert('Không thể kết nối vào cơ sở dữ liệu!');</script>";
    } else {
        $rs = $conn->query($sql);
        if (!$rs) {
            echo "<script language='javascript'>window.alert('Không thể thêm vào cơ sở dữ liệu!');</script>";
        } else {
            echo "<script language='javascript'>window.alert('Đã thêm vào cơ sở dữ liệu!');</script>";
        }
    }
    mysqli_set_charset($conn, "utf8");
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
    <link href="../lib/slick/slick.css" rel="stylesheet">
    <link href="../lib/slick/slick-theme.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/base.css" rel="stylesheet">
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
                    <div class="navbar-nav mr-auto">
                        <a href="admin.php" class="nav-item nav-link">QUẢN LÝ THÔNG TIN</a>
                        <a href="transaction-management.php" class="nav-item nav-link">QUẢN LÝ ĐƠN HÀNG</a>
                        <a href="product-management.php" class="nav-item nav-link">QUẢN LÝ SẢN PHẨM</a>
                        <a href="add-item.php" class="nav-item nav-link active">THÊM SẢN PHẨM</a>
                    </div>
                    <div class="header__navbar-item header__navbar-user">
                        <img class="avatar-img" src="../img/avatar.jpg" />
                        <span class="header__navbar-user-name"><?php echo $name; ?></span>

                        <ul class="header__navbar-user-menu">
                            <li class="header__navbar-user-item header__navbar-user-item--separate">
                                <a href="logout.php" onclick="return confirm('Bạn có chắc chắn muốn đăng xuất?');">Đăng
                                    xuất</a>
                            </li>
                        </ul>
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
                <div class="col-md-3">
                    <div class="logo">
                        <a href="admin.php">
                            <img src="../img/logo.png" alt="Logo">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bottom Bar End -->

    <!-- Breadcrumb Start -->
    <div class="breadcrumb-wrap">
        <div class="container-fluid">
            <ul class="breadcrumb" style="margin-bottom: 30px;">
                <li class="breadcrumb-item active">THÊM SẢN PHẨM</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Add category Start -->
    <div class="add">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <form class="add-item" method="post" action="">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Mã loại sản phẩm</label>
                                <input class="form-control" type="text" placeholder="VD: LH01" name="category_id">
                            </div>
                            <div class="col-md-6">
                                <label>Tên loại sản phẩm</label>
                                <input class="form-control" type="text" placeholder="VD: Vi xử lý" name="category_name">
                            </div>
                            <div class="col-md-12">
                                <button class="btn" type="submit">Thêm</button>
                            </div>
                        </div>
                        <br>
                        <?php
                        if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['category_name']) && isset($_POST['category_id'])) {
                            $category_id = trim($_POST['category_id']);
                            $category_name = trim($_POST['category_name']);

                            try {
                                if (!empty($category_id) && !empty($category_name)) {
                                    if (preg_match('/^[a-zA-Z0-9]+$/', $category_id) && strlen($category_name) <= 255) {
                                        $sql = "INSERT INTO `category` (category_id, category_name) VALUES ('$category_id', '$category_name')";
                                        add2DB($sql);
                                    } else {
                                        echo "<script>alert('Mã loại sản phẩm chỉ được chứa ký tự chữ và số. Tên loại sản phẩm không được vượt quá 255 ký tự.');</script>";
                                    }
                                } else {
                                    echo "<script>alert('Vui lòng điền đầy đủ thông tin.');</script>";
                                }
                            } catch (Exception $e) {
                                echo "<script>alert('Đã xảy ra lỗi: " . addslashes($e->getMessage()) . "');</script>";
                            }
                        }
                        ?>
                    </form>
                    <form class="add-item" method="post">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Mã thương hiệu</label>
                                <input class="form-control" type="text" placeholder="VD: BR01" name="brand_id">
                            </div>
                            <div class="col-md-6">
                                <label>Tên thương hiệu</label>
                                <input class="form-control" type="text" placeholder="VD: Asus" name="brand_name">
                            </div>
                            <div class="col-md-12">
                                <button class="btn" type="submit">Thêm</button>
                            </div>
                        </div>
                        <br>
                        <?php
                        if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['brand_name']) && isset($_POST['brand_id'])) {
                            $brand_id = trim($_POST['brand_id']);
                            $brand_name = trim($_POST['brand_name']);

                            try {
                                if (!empty($brand_id) && !empty($brand_name)) {
                                    if (preg_match('/^[a-zA-Z0-9]+$/', $brand_id) && strlen($brand_name) <= 255) {
                                        $sql = "INSERT INTO `brand` (brand_id, brand_name) VALUES ('$brand_id', '$brand_name')";
                                        add2DB($sql);
                                    } else {
                                        echo "<script>alert('Mã thương hiệu chỉ được chứa ký tự chữ và số. Tên thương hiệu không được vượt quá 255 ký tự.');</script>";
                                    }
                                } else {
                                    echo "<script>alert('Vui lòng điền đầy đủ thông tin.');</script>";
                                }
                            } catch (Exception $e) {
                                echo "<script>alert('Đã xảy ra lỗi: " . addslashes($e->getMessage()) . "');</script>";
                            }
                        }
                        ?>
                    </form>
                    <form class="add-item" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Mã sản phẩm</label>
                                <input class="form-control" type="text" placeholder="VD: MNC01"
                                    name="details_product_id">
                            </div>
                            <div class="col-md-6">
                                <label>Ảnh chi tiết sản phẩm (có thể thêm nhiều)</label>
                                <input class="form-image" type="file" name="details_image_file" accept="image/*">
                            </div>
                            <div class="col-md-12">
                                <button class="btn" type="submit">Thêm</button>
                            </div>
                        </div>
                        <br>
                        <?php
                        if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['details_product_id']) && isset($_FILES['details_image_file'])) {
                            $details_product_id = trim($_POST['details_product_id']);
                            $image_file = $_FILES['details_image_file'];

                            // Kiểm tra mã sản phẩm
                            if (!empty($details_product_id)) {
                                if (preg_match('/^[a-zA-Z0-9]+$/', $details_product_id)) {
                                    // Kiểm tra và xử lý file ảnh
                                    $upload_dir = '../upload_details/'; // Thư mục để lưu ảnh
                                    $target_file = $upload_dir . basename($image_file['name']);
                                    $image_type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

                                    if (in_array($image_type, ['jpg', 'jpeg', 'png', 'webp', 'gif', 'avif'])) {
                                        if (move_uploaded_file($image_file['tmp_name'], $target_file)) {
                                            try {
                                                // Thêm dữ liệu vào bảng product_details
                                                $sql = "INSERT INTO `product_details` (product_id, image_details) VALUES ('$details_product_id', '$target_file')";
                                                add2DB($sql);
                                            } catch (Exception $e) {
                                                // echo "<script>alert('Đã xảy ra lỗi khi thêm dữ liệu: " . addslashes($e->getMessage()) . "');</script>";
                                                echo "<script>alert('Lỗi không đúng mã sản phẩm hoặc không tồn tại!');</script>";
                                            }
                                        } else {
                                            echo "<script>alert('Không thể tải lên ảnh. Vui lòng thử lại.');</script>";
                                        }
                                    } else {
                                        echo "<script>alert('Chỉ cho phép các định dạng ảnh JPG, JPEG, PNG, WEBP, GIF. AVIF.');</script>";
                                    }
                                } else {
                                    echo "<script>alert('Mã sản phẩm chỉ được chứa ký tự chữ và số.');</script>";
                                }
                            } else {
                                echo "<script>alert('Vui lòng điền đầy đủ thông tin.');</script>";
                            }
                        }
                        ?>
                    </form>
                </div>
                <div class="col-lg-6">
                    <form class="add-item" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Mã loại sản phẩm</label>
                                <input class="form-control" type="text" placeholder="Mã" name="category_id"
                                    list="category_list">
                                <datalist id="category_list">
                                    <?php
                                    $dbhost = 'localhost';
                                    $dbuser = 'root';
                                    $dbpass = '';
                                    $conn = new mysqli($dbhost, $dbuser, $dbpass, "database");
                                    $sql1 = "SELECT * FROM category ORDER BY category_id";
                                    if ($conn->connect_error) {
                                        echo "<h5>Không thể kết nối cơ sở dữ liệu!</h5>";
                                    } else {
                                        $rs1 = $conn->query($sql1);
                                        if (!$rs1) {
                                            echo "<h5>Không thể thêm vào cơ sở dữ liệu!</h5>";
                                        } else {
                                            while ($row = $rs1->fetch_array(MYSQLI_ASSOC)) {
                                                echo "<option value='" . $row['category_id'] . "'>";
                                            }
                                        }
                                    }
                                    ?>
                                </datalist>
                            </div>
                            <div class="col-md-6">
                                <label>Mã thương hiệu</label>
                                <input class="form-control" type="text" placeholder="Mã" name="brand_id"
                                    list="brand_list">
                                <datalist id="brand_list">
                                    <?php
                                    $dbhost = 'localhost';
                                    $dbuser = 'root';
                                    $dbpass = '';
                                    $conn = new mysqli($dbhost, $dbuser, $dbpass, "database");
                                    $sql1 = "SELECT * FROM brand ORDER BY brand_id";
                                    if ($conn->connect_error) {
                                        echo "<h5>Không thể kết nối cơ sở dữ liệu!</h5>";
                                    } else {
                                        $rs1 = $conn->query($sql1);
                                        if (!$rs1) {
                                            echo "<h5>Không thể thêm vào cơ sở dữ liệu!</h5>";
                                        } else {
                                            while ($row = $rs1->fetch_array(MYSQLI_ASSOC)) {
                                                echo "<option value='" . $row['brand_id'] . "'>";
                                            }
                                        }
                                    }
                                    ?>
                                </datalist>
                            </div>
                            <div class="col-md-6">
                                <label>Mã sản phẩm</label>
                                <input class="form-control" type="text" placeholder="Mã" name="product_id">
                            </div>
                            <div class="col-md-6">
                                <label>Tên sản phẩm</label>
                                <input class="form-control" type="text" placeholder="VD: Chuột Logitech G102"
                                    name="product_name">
                            </div>
                            <div class="col-md-6">
                                <label>Giá (đã có VAT)</label>
                                <input class="form-control" type="text" placeholder="VD: 250000" name="price">
                            </div>
                            <div class="col-md-6">
                                <label>Mô tả sản phẩm</label>
                                <textarea class="form-control" type="text" placeholder="Nội dung"
                                    name="description"></textarea>
                            </div>
                            <div class="col-md-6">
                                <label>Giảm giá</label>
                                <input class="form-control" type="text" placeholder="VD: 50" name="discount">
                            </div>
                            <div class="col-md-6">
                                <label>Thông số kỹ thuật</label>
                                <textarea class="form-control" type="text" placeholder="Nội dung"
                                    name="specifications"></textarea>
                            </div>
                            <div class="col-md-6">
                                <label>Ảnh sản phẩm</label>
                                <input class="form-image" type="file" name="image_file" accept="image/*">
                            </div>
                            <div class="col-md-6">
                                <label>Năm ra mắt</label>
                                <input class="form-control" type="text" placeholder="VD:2021"
                                    name="date_first_available">
                            </div>
                            <div class="col-md-6">
                                <label>Số lượng trong kho</label>
                                <input class="form-control" type="text" placeholder="VD: 500" name="amount">
                            </div>
                            <div class="col-md-12">
                                <button class="btn" type="submit" name="add_product">Thêm</button>
                            </div>
                        </div>
                        <br>
                        <?php
                        try {
                            if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['add_product'])) {
                                // Lấy và làm sạch dữ liệu từ form
                                $category_id = trim($_POST['category_id'] ?? '');
                                $product_id = trim($_POST['product_id'] ?? '');
                                $product_name = trim($_POST['product_name'] ?? '');
                                $brand_id = trim($_POST['brand_id'] ?? '');
                                $price = trim($_POST['price'] ?? '');
                                $description = trim($_POST['description'] ?? '');
                                $specifications = trim($_POST['specifications'] ?? '');
                                $discount = trim($_POST['discount'] ?? '');
                                $date_first_available = trim($_POST['date_first_available'] ?? '');
                                $amount = trim($_POST['amount'] ?? '');

                                $image_link = ''; // Giá trị mặc định cho hình ảnh
                                $details_image_link = ''; // Giá trị mặc định cho hình ảnh
                        
                                $errors = []; // Danh sách lỗi
                        
                                // Kiểm tra tính hợp lệ cơ bản
                                if (empty($category_id))
                                    $errors[] = "Mã loại sản phẩm không được để trống.";
                                if (empty($product_id))
                                    $errors[] = "Mã sản phẩm không được để trống.";
                                if (empty($product_name))
                                    $errors[] = "Tên sản phẩm không được để trống.";
                                if (empty($brand_id))
                                    $errors[] = "Mã thương hiệu không được để trống.";
                                if (!isset($price) || $price === '')
                                    $errors[] = "Giá sản phẩm không được để trống.";
                                if (empty($description))
                                    $errors[] = "Mô tả sản phẩm không được để trống.";
                                if (empty($specifications))
                                    $errors[] = "Thông số kỹ thuật sản phẩm không được để trống.";
                                if (!isset($discount) || $discount === '')
                                    $errors[] = "Giảm giá không được để trống.";
                                if (empty($date_first_available))
                                    $errors[] = "Năm ra mắt không được để trống.";
                                if (!isset($amount) || $amount === '')
                                    $errors[] = "Số lượng trong kho không được để trống.";

                                // Kiểm tra cụ thể từng trường
                                if (!empty($category_id) && !preg_match('/^[a-zA-Z0-9]+$/', $category_id)) {
                                    $errors[] = "Mã loại sản phẩm không hợp lệ.";
                                }
                                if (!empty($product_id) && !preg_match('/^[a-zA-Z0-9]+$/', $product_id)) {
                                    $errors[] = "Mã sản phẩm không hợp lệ.";
                                }
                                if (!empty($product_name) && strlen($product_name) > 255) {
                                    $errors[] = "Tên sản phẩm quá dài (tối đa 255 ký tự).";
                                }
                                if (!empty($brand_id) && !preg_match('/^[a-zA-Z0-9]+$/', $brand_id)) {
                                    $errors[] = "Mã thương hiệu không hợp lệ.";
                                }
                                if (!empty($price) && (!is_numeric($price) || $price < 0)) {
                                    $errors[] = "Giá sản phẩm phải là một số dương.";
                                }
                                if (!empty($description) && strlen($description) > 1000) {
                                    $errors[] = "Mô tả sản phẩm quá dài (tối đa 1000 ký tự).";
                                }
                                if (!empty($specifications) && strlen($specifications) > 1000) {
                                    $errors[] = "Thông só kỹ thuật sản phẩm quá dài (tối đa 1000 ký tự).";
                                }
                                if (!empty($discount) && (!is_numeric($discount) || $discount < 0 || $discount > 100)) {
                                    $errors[] = "Giảm giá phải là một số từ 0 đến 100.";
                                }
                                if (!empty($date_first_available) && (!preg_match('/^\d{4}$/', $date_first_available) || $date_first_available < 2000 || $date_first_available > date("Y"))) {
                                    $errors[] = "Năm ra mắt không hợp lệ.";
                                }
                                if (!empty($amount) && (!is_numeric($amount) || $amount < 0)) {
                                    $errors[] = "Số lượng trong kho không hợp lệ.";
                                }

                                // Xử lý tệp ảnh
                                if (isset($_FILES['image_file'])) {
                                    if ($_FILES['image_file']['error'] == UPLOAD_ERR_NO_FILE) {
                                        $errors[] = "Vui lòng tải lên ảnh sản phẩm.";
                                    } elseif ($_FILES['image_file']['error'] != UPLOAD_ERR_OK) {
                                        $errors[] = "Đã xảy ra lỗi khi tải lên ảnh sản phẩm.";
                                    } else {
                                        $upload_dir = "../uploads/";
                                        $original_file_name = basename($_FILES['image_file']['name']);
                                        $safe_file_name = preg_replace("/[^a-zA-Z0-9\.\-_]/", "_", $original_file_name);
                                        $file_tmp_path = $_FILES['image_file']['tmp_name'];
                                        $file_ext = strtolower(pathinfo($safe_file_name, PATHINFO_EXTENSION));
                                        $allowed_extensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

                                        if (!in_array($file_ext, $allowed_extensions)) {
                                            $errors[] = "Chỉ chấp nhận các tệp có định dạng JPG, JPEG, PNG, GIF, WEBP.";
                                        } elseif (!move_uploaded_file($file_tmp_path, $upload_dir . $safe_file_name)) {
                                            $errors[] = "Không thể lưu ảnh sản phẩm.";
                                        } else {
                                            $image_link = "uploads/" . $safe_file_name; // Đường dẫn lưu trong CSDL
                                        }
                                    }
                                }

                                // Nếu có lỗi, hiển thị lỗi và giữ lại dữ liệu cũ
                                if (!empty($errors)) {
                                    $errorMessage = implode("\n", $errors);
                                    echo "<script>
                                            alert(" . json_encode("Có lỗi xảy ra:\n" . $errorMessage) . ");
                                          </script>";
                                    return;
                                }

                                $sql = "INSERT INTO `product` (category_id, product_id, product_name, brand_id, price, description, discount, image_link, date_first_available, amount, saledate, product_thongso) 
                                VALUES ('$category_id', '$product_id', '$product_name', '$brand_id', $price, '$description', $discount, '$image_link', '$date_first_available', $amount, '" . date("Y-m-d") . "', '$specifications');";
                        
                                // Gọi hàm add2DB để thực thi câu lệnh SQL
                                add2DB($sql);
                            }
                        } catch (Exception $e) {
                            echo "<script>alert('Đã xảy ra lỗi: " . addslashes($e->getMessage()) . "');</script>";
                        }
                        ?>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Add category End -->


</body>

</html>