<?php
include "../connect.php";

$emailxxx =   $_POST["emailqz"];
$numberxxx =   $_POST["numberqz"];
$passwordxxx = $_POST["passwordqz"];





$stmt = $connect->prepare("INSERT INTO `users`(`name`,`student_id`, `password` ) VALUES (?,?,?)");
$stmt->execute(array($emailxxx, $numberxxx, $passwordxxx));

$data = $stmt->fetch(PDO::FETCH_ASSOC);

$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
