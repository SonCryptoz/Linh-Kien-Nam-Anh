<?php
session_start();
$id = $_GET['id'];
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");

if ($conn->connect_error) {
    die("Lỗi không thể kết nối!");
}
mysqli_set_charset($conn, "utf8");
$sql = "SELECT * FROM `product` WHERE product_id='" . $id . "'";
$rs = $conn->query($sql);

if (!$rs) {
    die("Lỗi không thể truy xuất cơ sở dữ liệu!");
}
$info = NULL;
while ($row = $rs->fetch_array(MYSQLI_ASSOC)) {
    $info = $row;
}

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
                        <a href="admin.php" class="nav-item nav-link active">TRANG CHỦ</a>
                        <a href="product-management.php" class="nav-item nav-link">QUẢN LÝ SẢN PHẨM</a>
                    </div>
                    <div class="navbar-nav ml-auto">
                        <div class="header__navbar-item header__navbar-user">
                            <img class="avatar-img" src="../img/avatar.jpg" />
                            <span class="header__navbar-user-name"><?php echo $name; ?></span>

                            <ul class="header__navbar-user-menu">
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
                <li class="breadcrumb-item active">SỬA SẢN PHẨM</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Add category Start -->
    <div class="add">
        <div class="container-fluid">
            <div class="row">
                <form class="add-item" method="post" enctype="multipart/form-data" onsubmit="return confirmUpdate()">
                    <div class="row">
                        <div class="col-md-6">
                            <label>Mã loại sản phẩm</label>
                            <input class="form-control" type="text" value="<?php echo $info['category_id'] ?>"
                                name="category_id" list="category_list">
                            <datalist id="category_list">
                                <?php
                                $dbhost = 'localhost';
                                $dbuser = 'root';
                                $dbpass = '';
                                $conn = new mysqli($dbhost, $dbuser, $dbpass, "database");
                                $sql1 = "SELECT * FROM `category` ORDER BY category_id";
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
                                mysqli_set_charset($conn, "utf8");
                                ?>
                            </datalist>
                        </div>
                        <div class="col-md-6">
                            <label>Thương hiệu</label>
                            <input class="form-control" type="text" value="<?php echo $info['brand_id'] ?>"
                                name="brand_id" list="brand_list">
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
                            <input class="form-control" type="text" value="<?php echo $info['product_id'] ?>"
                                name="product_id">
                        </div>
                        <div class="col-md-6">
                            <label>Tên sản phẩm</label>
                            <input class="form-control" type="text" value="<?php echo $info['product_name'] ?>"
                                name="product_name">
                        </div>
                        <div class="col-md-6">
                            <label>Giá (đã có VAT)</label>
                            <input class="form-control" type="text" value="<?php echo $info['price'] ?>" name="price">
                        </div>
                        <div class="col-md-6">
                            <label>Mô tả sản phẩm</label>
                            <textarea class="form-control"
                                name="description"><?php echo htmlspecialchars($info['description']); ?></textarea>
                        </div>
                        <div class="col-md-6">
                            <label>Thông số kỹ thuật</label>
                            <textarea class="form-control"
                                name="specifications"><?php echo htmlspecialchars($info['product_thongso']); ?></textarea>
                        </div>
                        <div class="col-md-6">
                            <label>Giảm giá (%)</label>
                            <input class="form-control" type="text" value="<?php echo $info['discount'] ?>"
                                name="discount">
                        </div>
                        <div class="col-md-6">
                            <label>Chọn ảnh</label>
                            <div class="custom-image-form">
                                <input class="form-control-image" type="file" name="image_file" value="<?php echo $info['image_link']; ?>">
                                <img id="previewImage" src="<?php echo "../" . $info['image_link']; ?>"
                                    alt="Product Image" class="image-form">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>Năm phát hành</label>
                            <input class="form-control" type="text" value="<?php echo $info['date_first_available'] ?>"
                                name="date_first_available">
                        </div>
                        <div class="col-md-6">
                            <label>Số lượng trong kho</label>
                            <input class="form-control" type="text" value="<?php echo $info['amount'] ?>" name="amount">
                        </div>
                        <div class="col-md-12">
                            <button class="btn" type="submit">Sửa</button>
                        </div>
                    </div>
                    <br>
                    <?php
                    if ($_SERVER['REQUEST_METHOD'] == "POST") {
                        // Lấy và làm sạch dữ liệu từ form
                        $category_id = htmlspecialchars(trim($_POST['category_id'] ?? ''));
                        $product_id = htmlspecialchars(trim($_POST['product_id'] ?? ''));
                        $product_name = htmlspecialchars(trim($_POST['product_name'] ?? ''));
                        $brand_id = htmlspecialchars(trim($_POST['brand_id'] ?? ''));
                        $price = filter_var($_POST['price'], FILTER_VALIDATE_FLOAT);
                        $description = htmlspecialchars(trim($_POST['description'] ?? ''));
                        $specifications = htmlspecialchars(trim($_POST['specifications'] ?? ''));
                        $discount = filter_var($_POST['discount'], FILTER_VALIDATE_FLOAT);
                        $date_first_available = htmlspecialchars(trim($_POST['date_first_available'] ?? ''));
                        $amount = filter_var($_POST['amount'], FILTER_VALIDATE_INT);
                        $imageLink = ''; // Giá trị mặc định cho hình ảnh
                    
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
                        if ($price === false || $price < 0)
                            $errors[] = "Giá sản phẩm phải là một số dương.";
                        if (empty($description))
                            $errors[] = "Mô tả sản phẩm không được để trống.";
                        if (empty($specifications))
                            $errors[] = "Thông số kỹ thuật sản phẩm không được để trống.";
                        if ($discount === false || $discount < 0 || $discount > 100)
                            $errors[] = "Giảm giá phải là một số từ 0 đến 100.";
                        if (!preg_match('/^\d{4}$/', $date_first_available) || $date_first_available < 2000 || $date_first_available > date("Y")) {
                            $errors[] = "Năm ra mắt không hợp lệ.";
                        }
                        if ($amount === false || $amount < 0)
                            $errors[] = "Số lượng trong kho không hợp lệ.";

                        // Kiểm tra và upload file ảnh
                        $imageLink = $info['image_link'] ?? '';
                        $uploadDir = '../uploads/';
                        if (isset($_FILES['image_file']) && $_FILES['image_file']['error'] == 0) {
                            $allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                            $fileType = mime_content_type($_FILES['image_file']['tmp_name']);
                            $maxFileSize = 2 * 1024 * 1024; // 2MB
                        
                            if (!in_array($fileType, $allowedTypes)) {
                                $errors[] = "Chỉ được phép tải lên ảnh định dạng JPG, PNG, WEBP, hoặc GIF.";
                            }
                        
                            if ($_FILES['image_file']['size'] > $maxFileSize) {
                                $errors[] = "Kích thước file không được vượt quá 2MB.";
                            }
                        
                            if (empty($errors)) {
                                $uniqueFileName = $uploadDir . basename($_FILES['image_file']['name']); // Dùng tên file gốc
                                if (move_uploaded_file($_FILES['image_file']['tmp_name'], $uniqueFileName)) {
                                    $imageLink = $uniqueFileName;
                                } else {
                                    $errors[] = "Không thể tải tệp lên.";
                                }
                            }
                        } else {
                            $errors[] = "Vui lòng chọn ảnh để tải lên.";
                        }                        

                        // Hiển thị lỗi nếu có
                        if (!empty($errors)) {
                            $errorMessage = implode("\n", $errors);
                            echo "<script>
                                    alert(" . json_encode("Có lỗi xảy ra:\n" . $errorMessage) . ");
                                  </script>";
                            return;
                        }

                        $sale_date = date("Y-m-d"); // Tạo một biến để lưu giá trị ngày hiện tại
                    
                        // Thực hiện câu lệnh UPDATE với prepared statements
                        $stmt = $conn->prepare("UPDATE `product` SET 
                                category_id = ?, 
                                product_name = ?, 
                                brand_id = ?, 
                                price = ?, 
                                description = ?, 
                                discount = ?, 
                                image_link = ?, 
                                date_first_available = ?, 
                                amount = ?, 
                                saledate = ?, 
                                product_thongso = ? 
                            WHERE product_id = ?");

                        $stmt->bind_param(
                            "sssdsdsssiss",
                            $category_id,
                            $product_name,
                            $brand_id,
                            $price,
                            $description,
                            $discount,
                            $imageLink,
                            $date_first_available,
                            $amount,
                            $sale_date,
                            $specifications,
                            $product_id
                        );

                        if ($stmt->execute()) {
                            echo "<script>
                                    alert('Sửa thành công!');
                                </script>";
                        } else {
                            echo "<script>alert('Không thể sửa cơ sở dữ liệu!');</script>";
                        }
                    }
                    ?>
                </form>
                <script>
                    function confirmUpdate() {
                        return confirm("Bạn có chắc chắn muốn sửa sản phẩm?");
                    }

                    document.querySelector("input[name='image_file']").addEventListener("change", function (event) {
                        const file = event.target.files[0];
                        if (file) {
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                document.getElementById("previewImage").src = e.target.result;
                            };
                            reader.readAsDataURL(file);
                        }
                    });
                </script>
            </div>
        </div>
    </div>
    <!-- Add category End -->


    <!-- Back to Top -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/slick/slick.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>

</html>