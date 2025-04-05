function success() {
    const phone = document.getElementById("phone").value;
    const password = document.getElementById("password").value;
    const submitButton = document.getElementById("submit");

    if (checkUserPhone(phone) && checkUserPassword(password)) {
        submitButton.disabled = false;
        submitButton.classList.remove("btns--disabled");
    } else {
        submitButton.disabled = true;
        submitButton.classList.add("btns--disabled");
    }
}

function checkUserPhone(getPhone) {
    const phonePattern = /^\d{10,11}$/; // Kiểm tra số điện thoại
    return phonePattern.test(getPhone.trim());
}

function checkUserPassword(getPassword) {
    return getPassword.trim().length >= 5; // Yêu cầu mật khẩu tối thiểu 5 ký tự
}

function login() {
    const formElements = document.getElementsByClassName("form_data");
    const formData = new FormData();

    for (let element of formElements) {
        formData.append(element.name, element.value);
    }

    const submitButton = document.getElementById("submit");
    submitButton.disabled = true;
    submitButton.classList.add("btns--disabled");

    const ajaxRequest = new XMLHttpRequest();
    ajaxRequest.open("POST", "../database/adminLogin.php"); // Đường dẫn chính xác
    ajaxRequest.send(formData);

    ajaxRequest.onreadystatechange = function () {
        if (ajaxRequest.readyState === 4) {
            submitButton.disabled = false;
            submitButton.classList.remove("btns--disabled");

            if (ajaxRequest.status === 200) {
                const response = ajaxRequest.responseText.trim();
                console.log(response); // Debug thông tin phản hồi

                if (response === "1") {
                    window.location.href = "admin.php";
                } else if (response === "2") {
                    window.location.href = "transaction-management.php";
                } else {
                    displayNotification(response);
                }
            } else {
                displayNotification("Có lỗi xảy ra. Vui lòng thử lại.");
            }
        }
    };
}

function displayNotification(message) {
    const notifyText = document.getElementById("auth-form__notify-text");
    notifyText.innerHTML = message;
    notifyText.style.color = "red"; // Tô đỏ thông báo lỗi
    setTimeout(() => {
        notifyText.innerHTML = "";
    }, 10000);
}
