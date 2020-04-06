<?php
header('content-type:text/html;charset=utf8');

$uname = $_POST["name"];
$con=mysqli_connect('localhost','root','root','shoup');
mysqli_query($con,"set names utf8");
$res = mysqli_query($con,"select * from user where name='$uname'");
$row=mysqli_fetch_assoc($res);
if($row){
    
    $arr = [
        "msg"=>"用户名已存在",
        "status"=>33
    ];
}else{
    $arr = [
        "msg"=>"用户名可用",
        "status"=>200
    ];
}
echo json_encode($arr);