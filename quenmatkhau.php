<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Linh-kien-nam-anh</title>

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
        rel="stylesheet" />

    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="lib/slick/slick.css" rel="stylesheet" />
    <link href="lib/slick/slick-theme.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/base.css" rel="stylesheet" />
</head>

<body>
    <div class="header-auth-form">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-2">
                    <div class="logo">
                        <a href="index.php">
                            <img src="img/logo.png" alt="Logo" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="body-auth-form">
        <div class="auth-form">
            <div class="auth-form__container">
                <div class="auth-form__header">
                    <h3 class="auth-form__heading">Quên mật khẩu</h3>
                    <a href="login.html" class="auth-form__switch-btn">Đăng nhập</a>
                </div>
                <div id="auth-form__notify-text"></div>
                <form id="quenmk">
                    <div class="auth-form__form">
                        <div class="auth-form__group">
                            <input id="phone1" name="phone1" type="text" class="auth-form__input form_data"
                                placeholder="Số điện thoại/Email" onkeyup="checkForm()" />
                        </div>
                    </div>

                    <div class="auth-form__aside">
                        <div class="auth-form__help">
                            <a href="register.php" class="auth-form__help-link auth-form__help-foget">Đăng ký </a>
                            <span class="auth-form__separate"></span>
                            <a href="" class="auth-form__help-link">Cần trợ giúp?</a>
                        </div>
                    </div>

                    <div class="auth-form__controls">
                        <input type="button" class="btns auth-form__controls-back btns--normal"
                            onclick="location.href='login.html'" value="TRỞ LẠI" />
                        <input type="button" class="btns btns--primary" id="submit" onclick="resetmk()"
                            value="TIẾP THEO" />
                    </div>
                </form>
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

    <!-- Khu vực hiển thị loading -->
    <div id="loading-container" class="hidden">
        <?php include 'loading.php'; ?>
    </div>

    <script>
        function checkForm() {
            var phone1 = document.getElementById('phone1').value;

            // Kiểm tra nếu trường số điện thoại/Email đã có dữ liệu
            if (phone1 !== "") {
                document.getElementById('submit').disabled = false;  // Kích hoạt nút "TIẾP THEO"
            } else {
                document.getElementById('submit').disabled = true;   // Vô hiệu hóa nút nếu thiếu thông tin
            }
        }

        function resetmk() {
            var phone1 = document.getElementById('phone1').value;

            // Hiển thị hiệu ứng loading
            startLoading();

            // Gửi thông tin qua Ajax
            var formData = new FormData();
            formData.append('phone1', phone1);

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'database/process.php', true);
            xhr.onload = function () {
                if (xhr.status == 200) {
                    alert(xhr.responseText);
                    if (xhr.responseText.includes('Mật khẩu mới đã được gửi qua email')) {
                        window.location.href = "./login.html"; // Chuyển hướng sau khi hiển thị thông báo
                    }
                } else {
                    alert("Có lỗi xảy ra, vui lòng thử lại!");
                }
                stopLoading();
            };
            xhr.onerror = function () {
                alert("Không thể kết nối đến máy chủ. Vui lòng kiểm tra lại!");
                stopLoading(); // Dừng loading nếu có lỗi kết nối
            };
            xhr.send(formData);
        }

        // Hiển thị hiệu ứng loading
        function startLoading() {
            document.getElementById('loading-container').classList.remove('hidden');
        }

        // Dừng hiệu ứng loading
        function stopLoading() {
            document.getElementById('loading-container').classList.add('hidden');
        }
    </script>
</body>

</html>