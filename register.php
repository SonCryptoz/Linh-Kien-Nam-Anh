<?php
session_start();
?>
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
    <link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">

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
                    <h3 class="auth-form__heading">Đăng ký</h3>
                    <a href="login.html" class="auth-form__switch-btn">Đăng nhập</a>
                </div>
                <div id="auth-form__notify-text"></div>
                <form id="register-form">
                    <div id="loading-message" style="display: none;">Đang tải, hãy đợi chút...</div>
                    <div class="auth-form__form">
                        <div class="auth-form__group">
                            <input id="name" name="name" type="text" onkeyup="checkUserName()"
                                class="auth-form__input form_data" placeholder="Họ và tên" />
                        </div>
                        <div class="auth-form__group">
                            <input id="email" name="email" type="text" onkeyup="checkUserEmail()"
                                class="auth-form__input form_data" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$"
                                placeholder="Email của bạn" />
                        </div>
                        <div class="auth-form__group">
                            <input id="phone" name="phone" type="text" onkeyup="checkUserPhone()"
                                class="auth-form__input form_data" placeholder="Số điện thoại" />
                        </div>
                        <div class="auth-form__group">
                            <input id="password" name="password" type="password" onkeyup="checkUserPassword()"
                                class="auth-form__input form_data" placeholder="Mật khẩu của bạn" />
                            <i id="togglePassword" class="fa fa-eye"></i>
                        </div>
                    </div>
                    <div class="auth-form__group">
                        <div style="margin-top: 18px;">
                            <label for="captcha">Mã xác nhận:</label>
                            <div class="captcha"
                                style="position: relative; display: inline-block; font-size: 20px; font-weight: bold; font-family: 'Comic Sans MS', cursive, sans-serif;">
                                <?php
                                $captcha_text = substr(str_shuffle("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"), 0, 10);
                                $_SESSION['captcha'] = $captcha_text; // Lưu CAPTCHA vào session
                                
                                // Hiển thị từng ký tự với dấu gạch ngang
                                $characters = str_split($captcha_text);
                                foreach ($characters as $char) {
                                    echo '<span style="position: relative; margin: 0 4px; user-select: none;">' . $char . '</span>';
                                }
                                ?>
                            </div>
                            <input id="captcha" name="captcha_input" type="text" class="auth-form__input form_data"
                                placeholder="Nhập mã xác nhận" required />
                        </div>
                    </div>
                    <div class="auth-form__aside">
                        <p class="auth-form__policy-text">
                            Bằng việc đăng ký, bạn đã đồng ý về
                            <a href="" class="auth-form__text-link">Điều khoản dịch vụ</a>
                            &
                            <a href="" class="auth-form__text-link">Chính sách bảo mật</a>
                        </p>
                    </div>
                    <div class="auth-form__controls">
                        <input type="button" class="btns auth-form__controls-back btns--normal"
                            onclick="location.href='index.php'" value="TRỞ LẠI" />

                        <input class="btns btns--primary" type="submit" name="submit" id="submit"
                            onclick="success(); return false" value="ĐĂNG KÝ " />
                    </div>
                </form>
            </div>

            <div class="auth-form__socials">
                <a href=" " onclick="mustInput();" class="auth-form__socials--faceproduct btns--size-s btn--with-icon">
                    <i class="auth-form__socials-icon fab fa-facebook"></i>
                    <span class="auth-form__socials-text">Đăng ký với Facebook</span>
                </a>
                <a href=" " onclick="mustInput();" class="auth-form__socials--google btns--size-s btn--with-icon">
                    <i class="auth-form__socials-icon fab fa-google"></i>
                    <span class="auth-form__socials-text">Đăng ký với Google</span>
                </a>
            </div>
        </div>
    </div>

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
                    <a href="tel:0856788999 ">0856-788-999</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Call to Action End -->

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
    <!-- Template Javascript -->
    <script src="js/registerForm.js "></script>
    <script
        src="https://www.google.com/recaptcha/enterprise.js?render=6LcvXrgqAAAAAHleQq8JZqw4hLZMSa1BKgjg7Il9"></script>
    <script>
        document.getElementById('togglePassword').addEventListener('click', function () {
            const passwordInput = document.getElementById('password');
            const icon = this;
        
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });        
        function mustInput() {
            alert('Tính năng chưa được hỗ trợ! Bạn đăng ký tài khoản bằng cách nhập thông tin vào form trên nhé.');
        }
    </script>

</body>

</html>