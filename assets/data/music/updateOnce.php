<?php
  require_once("../init.php");
  header("Content-Type:application/json;charset=UTF-8");

  @$mid = $_REQUEST["mid"] or die('{"code":401,"msg":"mid required"}');

  $sql = "SELECT playCount from ms_musicdetails WHERE mid='$mid'";
  $result = mysqli_query($conn,$sql);   
  $playCount = mysqli_fetch_row($result);
  $playCount = $playCount[0] + 1 ;

  $sql = "UPDATE ms_musicdetails SET playCount=$playCount WHERE mid='$mid'";
  $result = mysqli_query($conn,$sql); 
  $rowsCount = mysqli_affected_rows($conn);

  if($result&&$rowsCount>0)
    echo '{"code":1,"msg":"更新成功"}';
  else
    echo '{"code":-1,"msg":"更新失败"}';