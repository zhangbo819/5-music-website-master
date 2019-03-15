<?php
/**
* 接收客户端提交的phone，验证此电话号码是否已经存在。
* 若不存在，则返回{"code":200, "msg":"non-exists"}
* 若存在，则返回{"code":201, "msg":"exists"}
*/
header('Content-Type: application/json;charset=UTF-8');

@$phone = $_REQUEST['phone'] or die('{"code":401,"msg":"phone required"}');

require_once('../init.php');
$sql = "SELECT uid FROM ms_user WHERE phone='$phone' LIMIT 1";
$result = mysqli_query($conn,$sql);

if(!$result){       //SQL语句执行失败
  echo('{"code":500, "msg":"db execute err"}');
}else {
  $row = mysqli_fetch_assoc($result);
  if(!$row){        //电话号码不存在
    echo('{"code":200, "msg":"non-exists"}');
  }else {           //电话号码已经存在
    echo('{"code":201, "msg":"exists"}');
  }
}