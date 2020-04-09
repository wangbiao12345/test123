<?php
header('content-type:text/html;charset=utf8');

$nc = $_POST["neiCh1"];
$color = $_POST["color1"];
$kuc=$_POST["kuc1"]-1;
$name=$_POST["name"];
$shopName=$_POST["shopName"];
$money=$_POST["money"];
$imgs=$_POST["imgs"];

$con=mysqli_connect('localhost','root','root','shoup');
mysqli_query($con,"set names utf8");

$res = mysqli_query($con,"select * from shopping where shopColor='$color' and shopXh='$nc'");
$row=mysqli_fetch_assoc($res);
if($row){
        $res = mysqli_query($con,"UPDATE shopping SET kuchun='$kuc'  WHERE shopColor='$color' and shopXh='$nc'");
        // $row=mysqli_fetch_assoc($res);
        if($res){
            $res =mysqli_query($con,"select * from cart where shopColor='$color' and shopXh='$nc' and shopName='$shopName'");
            $row=mysqli_fetch_assoc($res);
            if($row){
                $shuliang=$row["shuliang"]+1;
                $res = mysqli_query($con,"UPDATE cart SET shuliang='$shuliang',kucun='$kuc'  WHERE shopColor='$color' and shopXh='$nc' and shopName='$shopName'");
                
            }else{
                $res = mysqli_query($con,"insert into cart(shopName,name,shuliang,shopXh,shopMoney,shopcolor,shopimg,kucun) values('$shopName','$name',1,'$nc','$money','$color','$imgs','$kuc')");
            }
            $arr = [
                "msg"=>"成功",
                "status"=>200,
                "kucun"=>$kuc,
            ];
        }else{
            $arr = [
                "msg"=>"失败",
                "status"=>4
            ];
        }
}else{
    $arr = [
        "msg"=>"信息不存在",
        "status"=>3
    ];
}
echo json_encode($arr);