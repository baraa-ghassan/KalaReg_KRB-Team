<?php
include "../connect.php";

$numberxxx =   $_POST["numberqz"];


$sql = "
    SELECT subjects.* , student_subjects.grade
    FROM student_subjects 
    JOIN subjects ON student_subjects.subject_id = subjects.id
    WHERE student_subjects.student_id = ?";

$stmt = $connect->prepare($sql);
$stmt->execute(array($numberxxx));

$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (count($data) > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "fail", "message" => "No subjects with null grades found OR Wrong User"));
}
