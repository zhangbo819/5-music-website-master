<?php
/**
* 接收客户端提交的uname，验证此用户名是否已经存在。
* 若不存在，则返回{"code":200, "msg":"non-exists"}
* 若存在，则返回{"code":201, "msg":"exists"}
*/
header('Content-Type: application/json;charset=UTF-8');

@$uname = $_REQUEST['uname'] or die('{"code":401,"msg":"uname required"}');

require_once('../init.php');
$sql = "SELECT uid FROM ms_user WHERE uname='$uname' LIMIT 1";
$result = mysqli_query($conn,$sql);

if(!$result){       //SQL语句执行失败
  echo('{"code":500, "msg":"db execute err"}');
}else {
  $row = mysqli_fetch_assoc($result);
  if(!$row){        //用户名不存在
    echo('{"code":200, "msg":"non-exists"}');
  }else {           //用户名已经存在
    echo('{"code":201, "msg":"exists"}');
  }
}