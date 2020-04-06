<?php
header('content-type:text/html;charset=utf8');

$nc = $_POST["neiCh"];
$color = $_POST["color"];

$con=mysqli_connect('localhost','root','root','shoup');
mysqli_query($con,"set names utf8");
$res = mysqli_query($con,"select * from shopping where shopColor='$color' and shopXh='$nc'");
$row=mysqli_fetch_assoc($res);
if($row){
    $arr = [
        "msg"=>"信息存在在",
        "status"=>200,
        "data"=>$row
    ];
}else{
    $arr = [
        "msg"=>"信息不存在",
        "status"=>3
    ];
}
echo json_encode($arr);