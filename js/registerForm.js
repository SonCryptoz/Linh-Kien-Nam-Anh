function success() {
    let isValid = true;

    startLoading();

    if (!checkUserEmail()) {
        isValid = false;
    }

    if (!checkUserName()) {
        isValid = false;
    }

    if (!checkUserPhone()) {
        isValid = false;
    }

    if (!checkUserPassword()) {
        isValid = false;
    }

    if (isValid) {
        save_data();
    } else {
        showNotification('Vui lòng điền đầy đủ thông tin hợp lệ!', 'error');
        stopLoading();
    }
}

function checkUserPhone() {
    var getPhone = document.getElementById("phone").value.trim();
    var numberPattern = /^[0-9]{10,12}$/;

    if (getPhone === '') {
        showNotification('Số điện thoại không được để trống!', 'error');
        return false;
    }
    if (!numberPattern.test(getPhone)) {
        showNotification('Số điện thoại phải từ 10 đến 12 chữ số!', 'error');
        return false;
    }
    return true;
}

function checkUserName() {
    var getName = document.getElementById("name").value.trim();
    var namePattern = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỹỳỵỷỹ\s]{5,}$/;

    if (getName === '') {
        showNotification('Tên không được để trống!', 'error');
        return false;
    }
    if (!namePattern.test(getName)) {
        showNotification('Tên phải chứa ít nhất 5 ký tự và chỉ bao gồm chữ cái!', 'error');
        return false;
    }
    return true;
}

function checkUserEmail() {
    var getEmail = document.getElementById("email").value.trim();
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (getEmail === '') {
        showNotification('Email không được để trống!', 'error');
        return false;
    }
    if (!emailPattern.test(getEmail)) {
        showNotification('Email không đúng định dạng!', 'error');
        return false;
    }
    return true;
}

function checkUserPassword() {
    var getPassword = document.getElementById("password").value.trim();

    if (getPassword === '') {
        showNotification('Mật khẩu không được để trống!', 'error');
        return false;
    }
    if (getPassword.length < 10) {
        showNotification('Mật khẩu phải chứa ít nhất 10 ký tự!', 'error');
        return false;
    }
    return true;
}

function save_data() {
    var form_elements = document.getElementsByClassName('form_data');
    var form_data = new FormData();

    for (var count = 0; count < form_elements.length; count++) {
        form_data.append(form_elements[count].name, form_elements[count].value.trim());
    }

    var ajax_request = new XMLHttpRequest();
    ajax_request.open('POST', 'database/userRegister.php');
    ajax_request.send(form_data);

    ajax_request.onreadystatechange = function() {
        if (ajax_request.readyState == 4 && ajax_request.status == 200) { 
            showNotification(ajax_request.responseText, 'success');
            stopLoading(); // Dừng loading khi hoàn tất
        } else if (ajax_request.readyState == 4) {
            showNotification('Có lỗi xảy ra, vui lòng thử lại!', 'error');
            stopLoading(); // Dừng loading khi có lỗi
        }
    };
}

function startLoading() {
    // Hiển thị loading-container
    document.getElementById('loading-container').classList.remove('hidden');
}

function stopLoading() {
    // Ẩn loading-container
    document.getElementById('loading-container').classList.add('hidden');
}

function showNotification(message, type) {
    var notifyElement = document.getElementById('auth-form__notify-text');
    var className = type === 'success' ? 'success-auth__form' : 'fail-auth__form';
    notifyElement.innerHTML = `<div class="${className}">${message}</div>`;
    setTimeout(function() {
        notifyElement.innerHTML = '';
    }, 5000);
}
