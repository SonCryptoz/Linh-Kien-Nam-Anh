function addBuild() {
    // Lấy các phần tử liên quan đến build (giả sử có class 'build-input')
    var buildInputElements = document.getElementsByClassName('quantity-product');

    // Tạo FormData để chứa dữ liệu
    var addBuildData = new FormData();

    // Thêm dữ liệu từ buildInputElements vào FormData (chỉ lấy phần tử đầu tiên để giữ cấu trúc tương tự)
    addBuildData.append(buildInputElements[0].name, buildInputElements[0].value);

    // Tạo yêu cầu AJAX
    var ajax_request = new XMLHttpRequest();

    // Cấu hình yêu cầu với phương thức POST đến URL xử lý (ví dụ: 'database/userBuild.php')
    ajax_request.open('POST', 'database/userBuild.php');

    // Gửi dữ liệu
    ajax_request.send(addBuildData);

    // Xử lý phản hồi từ server
    ajax_request.onreadystatechange = function() {
        if (ajax_request.readyState == 4 && ajax_request.status == 200) {
            // Hiển thị thông báo từ server
            alert(ajax_request.responseText); 
            // Tải lại trang để cập nhật (giống như addToCart)
            location.reload();
            if (ajax_request.responseText.includes('Thêm sản phẩm vào Xây dựng cấu hình thành công!')) {
                window.location.href = "../custom-pc.php"; // Chuyển hướng sau khi hiển thị thông báo
            }
        }
    }
}
