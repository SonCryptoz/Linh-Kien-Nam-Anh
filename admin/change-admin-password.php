<?php
session_start();
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$conn = new mysqli($dbhost, $dbuser, $dbpass, "database");
if ($conn->connect_error) {
    die("Lỗi không thể kết nối!");
}
$id = $_GET['id'];

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
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="database" name="keywords">
    <meta content="database" name="description">

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">

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
            <ul class="breadcrumb">
                <li class="breadcrumb-item active">ĐỔI MẬT KHẨU</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->
    <div style="padding: 20px; width: 50%; margin: auto;">
        <form class="add-item" method="post" action=>
            <div class="row">
                <div class="col-md-12">
                    <label>Mật khẩu mới</label>
                    <input class="form-control" type="password" name="new_pass">
                </div>
                <div class="col-md-12">
                    <label>Nhập lại mật khẩu</label>
                    <input class="form-control" type="password" name="re_pass">
                </div>
                <div class="col-md-12">
                    <button class="btn" type="submit">Đổi</button>
                </div>
            </div>
            <h5 style="color: red;">
                <?php
                if ($_SERVER['REQUEST_METHOD'] == "POST") {
                    if(empty($_POST['new_pass']) ||empty( $_POST['re_pass'])) {
                        echo "<script>alert('Vui lòng nhập đầy đủ thông tin.'); window.history.back();</script>";
                        exit;
                    }
                    if ((strlen($_POST['new_pass']) >= 10 && strlen($_POST['re_pass']) >= 10)) {
                        if ($_POST['new_pass'] == $_POST['re_pass']) {
                            $sql1 = "UPDATE `admin` SET `admin_password` = MD5('" . $_POST['new_pass'] . "') WHERE admin_id = " . $id;
                            $rs1 = $conn->query($sql1);
                            if (!$rs1) {
                                echo "<script language='javascript'>window.alert('Không thể đổi mật khẩu!');</script>";
                            } else {
                                echo "<script>
                                                alert('Thay đổi mật khẩu thành công, vui lòng đăng nhập lại!');
                                                window.location.href = 'logout.php';
                                            </script>";
                            }
                        } else {
                            echo "<script language='javascript'>window.alert('Mật khẩu và nhập lại mật khẩu không giống nhau!');</script>";
                        }
                    } else {
                        echo "<script language='javascript'>window.alert('Mật khẩu phải dài hơn 10 kí tự!');</script>";
                    }
                }
                ?>
            </h5>
        </form>
    </div>
</body>

</html>