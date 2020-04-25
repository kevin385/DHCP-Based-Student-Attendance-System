<?php

//subject_action.php

include('database_connection.php');

session_start();

$output = '';

if(isset($_POST["action"]))
{
	if($_POST["action"] == "fetch")
	{
		$query = "SELECT * FROM tbl_subject ";
		if(isset($_POST["search"]["value"]))
		{
			$query .= 'WHERE subject_name LIKE "%'.$_POST["search"]["value"].'%" ';
		}
		if(isset($_POST["order"]))
		{
			$query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
			$query .= 'ORDER BY subject_id DESC ';
		}
		if($_POST["length"] != -1)
		{
			$query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}

		$statement = $connect->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$data = array();
		$filtered_rows = $statement->rowCount();
		foreach($result as $row)
		{
			$sub_array = array();
			$sub_array[] = $row["subject_name"];
			$sub_array[] = '<button type="button" name="edit_subject" class="btn btn-primary btn-sm edit_subject" id="'.$row["subject_id"].'">Edit</button>';
			$sub_array[] = '<button type="button" name="delete_subject" class="btn btn-danger btn-sm delete_subject" id="'.$row["subject_id"].'">Delete</button>';
			$data[] = $sub_array;
		}

		$output = array(
			"draw"			=>	intval($_POST["draw"]),
			"recordsTotal"		=> 	$filtered_rows,
			"recordsFiltered"	=>	get_total_records($connect, 'tbl_subject'),
			"data"				=>	$data
		);

		
	}
	if($_POST["action"] == 'Add' || $_POST["action"] == "Edit")
	{
		$subject_name = '';
		$error_subject_name = '';
		$error = 0;
		if(empty($_POST["subject_name"]))
		{
			$error_subject_name = 'Subject Name is required';
			$error++;
		}
		else
		{
			$subject_name = $_POST["subject_name"];
		}
		if($error > 0)
		{
			$output = array(
				'error'							=>	true,
				'error_subject_name'				=>	$error_subject_name
			);
		}
		else
		{
			if($_POST["action"] == "Add")
			{
				$data = array(
					':subject_name'				=>	$subject_name
				);
				$query = "
				INSERT INTO tbl_subject 
				(subject_name) 
				SELECT * FROM (SELECT :subject_name) as temp 
				WHERE NOT EXISTS (
					SELECT subject_name FROM tbl_subject WHERE subject_name = :subject_name
				) LIMIT 1
				";
				$statement = $connect->prepare($query);
				if($statement->execute($data))
				{
					if($statement->rowCount() > 0)
					{
						$output = array(
							'success'		=>	'Data Added Successfully',
						);
					}
					else
					{
						$output = array(
							'error'					=>	true,
							'error_subject_name'		=>	'Subject Name Already Exists'
						);
					}
				}
			}
			if($_POST["action"] == "Edit")
			{
				$data = array(
					':subject_name'			=>	$subject_name,
					':subject_id'				=>	$_POST["subject_id"]
				);

				$query = "
				UPDATE tbl_subject 
				SET subject_name = :subject_name 
				WHERE subject_id = :subject_id
				";
				$statement = $connect->prepare($query);
				if($statement->execute($data))
				{
					$output = array(
						'success'		=>	'Data Updated Successfully',
					);
				}
			}
		}
	}

	if($_POST["action"] == "edit_fetch")
	{
		$query = "
		SELECT * FROM tbl_subject WHERE subject_id = '".$_POST["subject_id"]."'
		";
		$statement = $connect->prepare($query);
		if($statement->execute())
		{
			$result = $statement->fetchAll();
			foreach($result as $row)
			{
				$output["subject_name"] = $row["subject_name"];
				$output["subject_id"] = $row["subject_id"];
			}
		}
	}

	if($_POST["action"] == "delete")
	{
		$query = "
		DELETE FROM tbl_subject 
		WHERE subject_id = '".$_POST["subject_id"]."'
		";
		$statement = $connect->prepare($query);
		if($statement->execute())
		{
			echo 'Data Deleted Successfully';
		}
	}

	echo json_encode($output);
}

?>