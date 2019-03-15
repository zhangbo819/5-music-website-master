<?php
  require_once("../init.php");
  header("Content-Type:application/json;charset=UTF-8");

  $sql = "SELECT * from ms_musicdetails";

  $result = mysqli_query($conn,$sql);

  if(!$result){
	echo ('{"code":500, "msg":"db execute err"}');
  }else{
	$row = mysqli_fetch_all($result);
	echo json_encode($row);
  }