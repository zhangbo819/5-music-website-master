<?php
  header("Content-Type:application/json;charset=utf-8");
  require_once("../init.php");

  //$sql="select * from xz_laptop";
  //$result=sql_execute($sql);
  //var_dump($result);

  @$kw=$_REQUEST['kw'];
  if(!$kw){
     $kw="";
  }

  @$pno=$_REQUEST["pno"];
    if(!$pno){$pno=1;}
    else{$pno=intval($pno);}
  @$pageSize=$_REQUEST["pageSize"];
    if(!$pageSize){$pageSize=20;}
    else{$pageSize=intval($pageSize);}

  //计算起始位置offset
  $offset=($pno-1)*$pageSize;
  //获取产品表中总记录数
  $sql="SELECT count(*) FROM ms_musicdetails WHERE mname LIKE '%$kw%' OR author LIKE '%$kw%' OR author2 LIKE '%$kw%'";
  $result=mysqli_query($conn,$sql);
  $row=mysqli_fetch_row($result);
  $count=intval($row[0]);
  //获取总页数
  $pageCount=ceil($count/$pageSize);


  $sql="SELECT mid,cImgUrl,mname,author,author2,time,type,playCount
       FROM ms_musicdetails
	   WHERE mname LIKE '%$kw%' OR author LIKE '%$kw%' OR author2 LIKE '%$kw%'
       GROUP BY mid
       LIMIT $offset,$pageSize";
  $rows=sql_execute($sql);

  $output=[
    "recordCount"=>$count,
    "pageSize"=>$pageSize,
    "pageCount"=>$pageCount,
    "pno"=>$pno,
    "data"=>$rows
  ];

  echo json_encode($output);







?>