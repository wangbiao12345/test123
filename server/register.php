<?php
header('content-type:text/html;charset=utf8');

$uname = $_POST["username"];
$password = $_POST["password"];
$con=mysqli_connect('localhost','root','root','shoup');
mysqli_query($con,"set names utf8");
$res = mysqli_query($con,"insert user(name,password) values('$uname','$password')");
if($res){
    $arr = [
        "msg"=>"注册成功",
        "status"=>200
    ];
}else{
    $arr = [
        "msg"=>"注册失败",
        "status"=>4
    ];
}
echo json_encode($arr);