<?php 

    $user_id = $_GET['user_id'];
    $product_id = $_GET['product_id'];
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '';
    $conn = new mysqli(hostname: $dbhost, username: $dbuser, password: $dbpass, database: "database");

    if ($conn->connect_error) {
        die("Lỗi không thể kết nối!");
    }
    mysqli_set_charset(mysql: $conn,charset: "utf8");


    $sql = "DELETE FROM build WHERE user_id=$user_id and product_id='$product_id'";


    if ($conn->multi_query(query: $sql) === TRUE) {
        header(header: "Location: ../custom-pc.php");
    } else {
        echo 'Xóa thất bại!';
    }
    $conn->close();

?>