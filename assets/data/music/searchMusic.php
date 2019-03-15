<?php
	require_once("../init.php");
	header('Content-Type:application/json;charset=UTF-8');

	@$mid = $_REQUEST['mid'] or die('{"code":401,"msg":"mid required"}');

	$sql = "SELECT * from ms_musicdetails WHERE mid='$mid'";
	
	$result = mysqli_query($conn,$sql);

	if(!$result){
		echo ('{"code":500, "msg":"db execute err"}');
	}else{
		$row = mysqli_fetch_row($result);
		echo json_encode($row);
	}