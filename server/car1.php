<?php
header('content-type:text/html;charset=utf8');
$name = $_POST["name"];

$con = mysqli_connect('localhost', 'root', 'root', 'shoup');
mysqli_query($con, "set names utf8");
$res = mysqli_query($con, "select * from cart where name='$name'");

$row = mysqli_fetch_assoc($res);
if ($row) {
    $arr=["msg" => "信息存在",
        "status" => 200];
        $arr[]=$row;
        while($row = mysqli_fetch_assoc($res)) {
            $arr[] = $row;
        }
} else {
    $arr = [
        "msg" => "信息不存在",
        "status" => 3
    ];
}
echo json_encode($arr);
