<?php

//logout.php
include('admin/database_connection.php');

session_start();

$date = date("Y-m-d");
$tid = $_SESSION["teacher_id"];
$query1 = "SELECT b.student_id from (SELECT s.student_id, s.student_subject_id FROM tbl_student s LEFT JOIN (SELECT * FROM tbl_attendance WHERE attendance_date='".$date."') AS a ON a.student_id = s.student_id WHERE a.student_id IS NULL) AS b WHERE b.student_subject_id = '".$tid."'";
$statement = $connect->prepare($query1);
$statement->execute();
$result = $statement->fetchAll();
foreach($result as $row)
{
	$query2 = "INSERT INTO tbl_attendance (student_id, attendance_status, attendance_date, teacher_id) VALUES ('".$row["student_id"]."', 'Absent', '".$date."', '".$tid."')";
	$statement = $connect->prepare($query2);
	$statement->execute();
}

$query = "UPDATE tbl_teacherlog SET login_status = 0 WHERE teacher_id= '".$_SESSION["teacher_id"]."'";
$statement = $connect->prepare($query);
if($statement->execute())
{
  header('location:index.php');
}

session_destroy();

header('location:login.php');

?>