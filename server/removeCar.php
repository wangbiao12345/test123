<?php
header('content-type:text/html;charset=utf8');

$nc = $_POST["xh"];
$color = $_POST["color"];
$kuc=$_POST["kucun"];
$name=$_POST["name"];
$shopName=$_POST["shopname"];
$con=mysqli_connect('localhost','root','root','shoup');
mysqli_query($con,"set names utf8");
$sql="DELETE FROM cart WHERE name='$name' and shopcolor='$color'and shopName='$shopName' and shopXh='$nc'";
$res = mysqli_query($con,$sql);
if($res){
    $sql="UPDATE shopping SET kuchun='$kuc'  WHERE shopColor='$color' and shopXh='$nc'";
    $res = mysqli_query($con,$sql);
    $arr = [
        "msg" => "删除成功",
        "status" => 200
    ];
}else{
    $arr = [
        "msg" => "失败",
        "status" => 3
    ];
}
echo json_encode($arr);