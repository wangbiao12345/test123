var a = getCookie("uname");
if (a) {
    $(".open").css("display", "block")
    $(".login").css("display", "none")
} else {
    $(".login").css("display", "block")
    $(".open").css("display", "none")
}
$(document).ready(function(){
    var a = getCookie("uname");
    if(a){
        $.ajax({
            type: "post",
            url: "../server/car1.php" ,
            data: {
                name:a
            },
        }).done(function(res){
            var res=JSON.parse(res);
            if(res.status==200){
                console.log(res);
                var str = '';
                for(var i in res){
                    console.log(res[i]);
                    if(res[i].id){
                        for(var j in res[i]){
                            
                            str+=`
                            <div class="list">
                <input type="checkbox" name="" id="">
                <img src="${res[i].}" alt="">
                <p class="name1">
                    <a href="#">020-2021,版权所有，盗版必究，联系热线400-820-8820</a>
                </p>
                <p class="jiesao">
                    <span class="xh">123</span><br>
                    <span class="color">456</span>
                </p>
                <p class="money">￥<span>123</span></p>
                <p class="shuliang"> <button class="jian">-</button>
                    <input type="number" name="number" value="1">
                    <button class="add">+</button></p>
                <p class="xiaoji">
                    ￥<span>123456</span>
                </p>
                <p class="caozuo">
                    <button class="remove">删除购物车</button>
                </p>
            </div>
                            `
                        }
                    }
                }
            }
        })
    }else{
        alert("请先登录")
        location.href="../html/login.html"
    }
})