var a = getCookie("uname");
if (a) {
    $(".open").css("display", "block")
    $(".login").css("display", "none")
} else {
    $(".login").css("display", "block")
    $(".open").css("display", "none")
}
$(document).ready(function () {
    var a = getCookie("uname");
    if (a) {
        $.ajax({
            type: "post",
            url: "../server/car1.php",
            data: {
                name: a
            },
        }).done(function (res) {
            var res = JSON.parse(res);
            if (res.status == 200) {
                var str = '';
                for (var i in res) {
                    if (res[i].id) {
                        str += `
                            <div class="list">
                <input type="checkbox" name="" id="" class="one">
                <img src="${res[i].shopimg}" alt="">
                <p class="name1">
                    <a href="#">${res[i].shopName}</a>
                </p>
                <p class="jiesao">
                    <span class="xh">${res[i].shopXh}</span><br>
                    <span class="color">${res[i].shopcolor}</span>
                </p>
                <p class="money">￥<span>${res[i].shopMoney}</span></p>
                <p class="shuliang"> <button class="jian">-</button>
                    <input type="number" name="number" value="${res[i].shuliang}">
                    <button class="add">+</button>
                    剩余<span>${(res[i].kucun-0)+(res[i].shuliang-0)}</span>件
                    </p>
                <p class="xiaoji">
                    ￥<span>${res[i].shuliang*res[i].shopMoney}</span>
                </p>
                <p class="caozuo">
                    <button class="remove">删除购物车</button>
                </p>
            </div> `
                    }
                }
                $(".cart-body").html(str);
                //多选
                $(".jdcheckbox").click(function(){
                    console.log($(".one"));
                    if($(this).prop("checked")){
                        $(".one").prop("checked",true)
                        $(".jdcheckbox").prop("checked",true)
                    }else{
                        $(".one").prop("checked",false)
                        $(".jdcheckbox").prop("checked",false)
                    }
                    total();
                });
                //小选
                $(".one").click(function(){
                    var xuan = Array.prototype.slice.call($(".one")).every(function(v){
                        return $(v).prop("checked");
                    });
                    if(xuan){
                        $(".jdcheckbox").prop("checked",true)
                    }else{
                        $(".jdcheckbox").prop("checked",false)
                    }
                    total();
                });
                //加减
                $(".jian").click(function(){
                    var a=$(this).next().val()-1
                    if(a<=0){
                        a=0;
                        $(this).prop("disabled",true).css({
                            opacity:0.5,
                            cursor: "not-allowed"
                        })
                    }else{
                        $(this).siblings(".add").prop("disabled",false).css({
                            opacity:1,
                            cursor: "pointer"
                        })
                    }
                    $(this).next().val(a);
                    var b=a*$(this).parent().prev().children("span").text()
                    $(this).parent().next().children("span").text(b)
                    total()
                    
                })

                $(".add").click(function(){
                    let a=($(this).prev().val()-0)+1
                    console.log(a);
                    if(a>=$(this).siblings("span").text()){
                        a=$(this).siblings("span").text();
                        $(this).prop("disabled",true).css({
                            opacity:0.5,
                            cursor: "not-allowed"
                        })
                    }else{
                        $(this).siblings(".jian").prop("disabled",false).css({
                            opacity:1,
                            cursor: "pointer"
                        })
                    }
                    $(this).prev().val(a);
                    var b=a*$(this).parent().prev().children("span").text()
                    $(this).parent().next().children("span").text(b)
                    total()
                })
                $(".remove").click(function(){
                    // console.log(a);
                    let b=confirm("确定要删除商品么");
                    var kuchun=$(this).parent().siblings(".shuliang").children("span").text();
                    var name=$(this).parent().siblings(".name1").children("a").text();
                    var color=$(this).parent().siblings(".jiesao").children(".color").text();
                    var xh=$(this).parent().siblings(".jiesao").children(".xh").text();
                    console.log(kuchun,name,color,xh);
                    if(b){
                        $.ajax({
                            type: "post",
                            url: "../server/removeCar.php",
                            data: {
                                kucun:kuchun,
                                shopname:name,
                                color:color,
                                xh:xh,
                                name:a
                            },
                            success: function (response) {
                                var res=JSON.parse(response)
                                if(res.status==200){
                                    console.log(res);
                                    alert("删除成功")
                                }
                                
                            }
                        });
                        $(this).parent().parent().remove()
                    }
                })
                $(".t-action>button").click(function(){
                    $(".list>input:checked")
                    
                })

            }
        })
    } else {
        alert("请先登录")
        location.href = "../html/login.html"
    }
})

function total(){
    var totalNum = 0;
    var totalPrice = 0;
    $("[name='number']").each(function(i,v){
        // console.log($(v).parent().siblings(".checkOne"));
        if($(v).parent().siblings(".one").prop("checked")){
            totalNum += $(v).val()-0;
            totalPrice += $(v).parent().next().children("span").text()-0;
        }
    });
    // console.log(totalNum);
    $(".t-quantity").children("span").text(totalNum);
    $(".t-sum").children("span").text(totalPrice);
}