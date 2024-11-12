<?php
$dsn = "mysql:host=localhost;dbname=teamproject";
$user = "root";
$pass = "";
$option = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8" //FOR ARABIC LANGUAGE SUPPORT
);

try {
    $connect = new PDO($dsn, $user, $pass, $option);
    $connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    include "functions.php";
} catch (PDOException $e) {
    echo $e->getMessage();
}
