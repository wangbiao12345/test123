<?php
header('content-type:text/html;charset=utf8');

$sid = $_POST["id"];

$con=mysqli_connect('localhost','root','root','shoup');
mysqli_query($con,"set names utf8");
$res = mysqli_query($con,"select * from shopping where sid='$sid'");
$row=mysqli_fetch_assoc($res);
if($row){
    $arr = [
        "msg"=>"信息存在在",
        "status"=>200,
        "data"=>$row
    ];
    // echo json_encode($row);
}else{
    $arr = [
        "msg"=>"信息不存在",
        "status"=>3
    ];
}
echo json_encode($arr);

