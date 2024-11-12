<?php
include "../connect.php";

$numberxxx =   $_POST["numberqz"];
$passwordxxx = $_POST["passwordqz"];

$sql = "SELECT * FROM `users` WHERE (`student_id` = ?) AND (`password` = ?)";



$stmt = $connect->prepare($sql);
$stmt->execute(array($numberxxx, $passwordxxx));

$data = $stmt->fetch(PDO::FETCH_ASSOC);

$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "fail"));
}

// $numberxxx = filterRequests("numberqz");
// $passwordxxx = filterRequests("passwordqz");
// $stmt = $connect->prepare("INSERT INTO `users`(`student_number`, `student_password`) VALUES (?,?)");
