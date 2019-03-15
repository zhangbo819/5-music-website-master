<?php
/**
* 返回当前登录用户的信息：
* 如：{"uid":10, "uname":"dingding"}
*/
require_once("../init.php");
header('Content-Type: application/json;charset=UTF-8');

session_start();
@$output['uid'] = $_SESSION['loginUid'];
@$output['uname'] = $_SESSION['loginUname'];

echo json_encode($output);