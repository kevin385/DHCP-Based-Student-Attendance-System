<?php

include('admin/database_connection.php');

session_start();

$sid = 0;
$srno = $_SESSION["student_id"];
$tid = $_SESSION["teacher_id"];
$error = 0;
$query1 = "SELECT s.student_id from tbl_student s, tbl_teacher t where t.teacher_subject_id = s.student_subject_id and s.student_roll_number = '".$srno."' and t.teacher_subject_id = '".$tid."'";
$statement = $connect->prepare($query1);
$statement->execute();
$result = $statement->fetchAll();
foreach($result as $row)
{
	$sid = $row["student_id"];
}


$date = date("Y-m-d");
$query2 = "SELECT student_id from tbl_attendance where student_id='".$sid."' and attendance_date='".$date."'";
$statement = $connect->prepare($query2);
if ($statement->execute())
{
	$total_row = $statement->rowCount();
  	if($total_row > 0)
  	{
    	header('location:student_error2.php');
    	$error++;
  	}
}

if($error == 0)
{
	$query = "INSERT INTO tbl_attendance (student_id, attendance_status, attendance_date, teacher_id) VALUES ('".$sid."', 'Present', '".$date."', '".$tid."')";
	$statement = $connect->prepare($query);
	if ($statement->execute())
	{
		header('location:student_logout.php');
	}
}



?>