<?php

//database_connection.php

$connect = new PDO("mysql:host=localhost;dbname=attendance","root","");

$base_url = "http://localhost/tutorial/student-attendance-system-in-php-using-ajax/";

function get_total_records($connect, $table_name)
{
	$query = "SELECT * FROM $table_name";
	$statement = $connect->prepare($query);
	$statement->execute();
	return $statement->rowCount();
}

function load_subject_list($connect)
{
	$query = "
	SELECT * FROM tbl_subject ORDER BY subject_name ASC
	";
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();
	$output = '';
	foreach($result as $row)
	{
		$output .= '<option value="'.$row["subject_id"].'">'.$row["subject_name"].'</option>';
	}
	return $output;
}

function get_attendance_percentage($connect, $student_id)
{
	$query = "
	SELECT 
		ROUND((SELECT COUNT(*) FROM tbl_attendance 
		WHERE attendance_status = 'Present' 
		AND student_id = '".$student_id."') 
	* 100 / COUNT(*)) AS percentage FROM tbl_attendance 
	WHERE student_id = '".$student_id."'
	";

	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();
	foreach($result as $row)
	{
		if($row["percentage"] > 0)
		{
			return $row["percentage"] . '%';
		}
		else
		{
			return 'NA';
		}
	}
}

function Get_student_name($connect, $student_id)
{
	$query = "
	SELECT student_name FROM tbl_student 
	WHERE student_id = '".$student_id."'
	";

	$statement = $connect->prepare($query);

	$statement->execute();

	$result = $statement->fetchAll();

	foreach($result as $row)
	{
		return $row["student_name"];
	}
}

function Get_student_subject_name($connect, $student_id)
{
	$query = "
	SELECT tbl_subject.subject_name FROM tbl_student 
	INNER JOIN tbl_subject 
	ON tbl_subject.subject_id = tbl_student.student_subject_id 
	WHERE tbl_student.student_id = '".$student_id."'
	";
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();
	foreach($result as $row)
	{
		return $row['subject_name'];
	}
}

function Get_student_teacher_name($connect, $student_id)
{
	$query = "
	SELECT tbl_teacher.teacher_name 
	FROM tbl_student 
	INNER JOIN tbl_subject 
	ON tbl_subject.subject_id = tbl_student.student_subject_id 
	INNER JOIN tbl_teacher 
	ON tbl_teacher.teacher_subject_id = tbl_subject.subject_id 
	WHERE tbl_student.student_id = '".$student_id."'
	";
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();
	foreach($result as $row)
	{
		return $row["teacher_name"];
	}
}

function Get_subject_name($connect, $subject_id)
{
	$query = "
	SELECT subject_name FROM tbl_subject 
	WHERE subject_id = '".$subject_id."'
	";
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();
	foreach($result as $row)
	{
		return $row["subject_name"];
	}
}

?>