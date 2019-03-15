<?php
/**
* 退出登录，销毁用户的所有登录相关数据
* 返回数据形如：{"code":200, "msg":"logout succ"}
*/
require_once("../init.php");
header('Content-Type: application/json;charset=UTF-8');

session_start();
session_destroy();

echo '{"code":200, "msg":"logout succ"}';