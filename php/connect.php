<?php
    session_start();
    $conn = new mysqli('localhost','root','','ppp_db');
    $conn->set_charset("utf8");

    if($conn->connect_errno){
        die("Connect Failed !!".$conn->connection_error);
    }
    date_default_timezone_set("Asia/Bangkok");


?>