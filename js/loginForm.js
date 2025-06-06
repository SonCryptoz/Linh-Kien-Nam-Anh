function success() {
    if (
        checkUserPhone(document.getElementById("phone").value) &&
        checkUserPassword(document.getElementById("password").value)
    ) {
        document.getElementById("submit").disabled = false;
    } else {
        document.getElementById("submit").disabled = true;
    }
}

function checkUserPhone(getPhone) {
    return getPhone.trim().length > 0;
}

function checkUserPassword(getPassword) {
    return getPassword.trim().length > 0;
}

function login() {
    var form_element = document.getElementsByClassName("form_data");
    var form_data = new FormData();

    for (var count = 0; count < form_element.length; count++) {
        form_data.append(form_element[count].name, form_element[count].value);
    }

    document.getElementById("submit").disabled = true;

    var ajax_request = new XMLHttpRequest();
    ajax_request.open("POST", "database/userLogin.php");
    ajax_request.send(form_data);

    ajax_request.onreadystatechange = function () {
        if (ajax_request.readyState == 4 && ajax_request.status == 200) {
            document.getElementById("submit").disabled = false;
            document
                .getElementById("submit")
                .classList.remove("btns--disabled");
            document.getElementById("login-form").reset();

            if (ajax_request.responseText.trim() === "") {
                window.location.href = "home.php";
            } else {
                document.getElementById("auth-form__notify-text").innerHTML =
                    ajax_request.responseText;
            }

            setTimeout(function () {
                document.getElementById("auth-form__notify-text").innerHTML =
                    "";
            }, 10000);
        }
    };

    document.getElementById("submit").classList.add("btns--disabled");
}
