<?php
	session_start();
	include('admin/database_connection.php');

	$query = "SELECT teacher_id from tbl_teacherlog WHERE login_status = 1";
    $statement = $connect->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
	foreach($result as $row)
	{
		$_SESSION["teacher_id"] = $row["teacher_id"];
	}
	if (!isset($_SESSION["teacher_id"]))
	{
		header('location:student_error.php');
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Student Attendance System in PHP using Ajax</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="jumbotron-small text-center" style="margin-bottom:0">
  <h1>Student Attendance System</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="index.php">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="logout.php">Logout</a>
      </li>  
    </ul>
  </div>  
</nav>
</br>
</br>

<center> 
	<button type="button" id="set_attendance">Set Attendance</button>
</center>

<script>
$('#set_attendance').click(function(){
   window.location.assign('student_action.php');//there are many ways to do this
});
</script>

<style>
	button {
		background-color: #4CAF50;
		color: white;
		padding: 15px 32px;
		border-radius: 4px;
	}
</style>



