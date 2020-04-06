//input内容发生改变的时候判断格式并且发送请求看数据库有无相同的。
$("[name='username']").blur(function(){
    var name = $.trim($("[name='username']").val());
    var res = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/
    if (!res.test(name)) {
        return $(".tishi").html("<b style='color: red;'>请输入正确手机号<b>");
    }
    $.ajax({
        url:"../server/zhuce.php",
        data:{
            name:name
        },
        type:"post",
        success:function (res) {
            var res=JSON.parse(res);
            console.log(res);
            if(res.status==200){
                $(".tishi").html(`<b style='color: green;'>${res.msg}<b>`);
                $("[type='button']").removeAttr("disabled","disabled").css({
                    opacity:1,
                    cursor: "pointer"
                })
            }else{
                $(".tishi").html(`<b style='color: red;'>${res.msg}<b>`);
                $("[type='button']").attr("disabled","disabled").css({
                    opacity:0.5,
                    cursor: "not-allowed"
                })
            }
        }
    })
})

$("[type='password']").blur(function(){
    var password = $.trim($("[name='password']").val());
    var i=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
    if (!i.test(password)) {
        return $(".tishi").html("<b style='color: red;'>密码必须在6~16位，由数字字母组成<b>");
    }else{
        return $(".tishi").html("");
    }
})



var flage = false;
$("[type='checkbox']").click(function () {
    flage = $(this).is(":checked");
})

$("[type='button']").click(function () {
    if (!flage) {
        alert("请同意协议");
        return;
    }
    //获取表单信息
    var name = $.trim($("[name='username']").val());
    var password = $.trim($("[name='password']").val());
    var repassword = $.trim($("[name='repassword']").val());
    console.log(name);
    if(!name){
        return $(".tishi").html(`<b style='color: red;'>请输入手机号<b>`);
    }
    if(!password){
        return $(".tishi").html(`<b style='color: red;'>请输入密码<b>`);
    }
    if(!(password==repassword)){
        console.log(password);
        return $(".tishi").html(`<b style='color: red;'>两次密码不一致<b>`);
    }
    console.log(123);
    $.ajax({
        url:"../server/register.php",
        type:"post",
        data:{
            username: name,
            password: password,
        },
        success:function(res){
            var res=JSON.parse(res);
            console.log(res);
            if(res.status==200){
                alert(res.msg)
                location.href="login.html"
            }else{
                alert(res.msg)
                location.href="register.html"
            }
        }
    })

})