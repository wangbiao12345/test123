function Fd(classname) {
    this.box = document.querySelector('.' + classname);
    this.top = this.box.querySelector('.top');
    this.img = this.box.querySelector(".img")
    this.xianshi = this.box.querySelector(".xianshi");
    this.footer = this.box.querySelector('.footer1');
    this.bigBox = this.box.querySelector(".right-box");
    var _this = this
    this.top.onmouseover = () => {
        this.over()
    }
    this.top.onmouseout = () => {
        this.out()
    }
    for (var i = 0; i < this.footer.children.length; i++) {
        this.footer.children[i].onclick = function () {
            _this.click(this)
        }
    }
}
//点击事件
var a = getCookie("uname");
if (a) {
    $(".open").css("display", "block")
    $(".login").css("display", "none")
} else {
    $(".login").css("display", "block")
    $(".open").css("display", "none")
}

Fd.prototype.click = function (ele) {
    for (var i = 0; i < this.footer.children.length; i++) {
        this.footer.children[i].style.border = "#0f0";
    }
    var img = ele.children[0];
    ele.style.border = "1px solid #f00";
    var attr = img.getAttribute("src");

    // var jieQu=attr.slice(lastIndex-1);
    var pinJie = attr
    console.log(pinJie);
    this.img.children[0].setAttribute("src", pinJie);
    this.bigBox.style.backgroundImage = "url(" + pinJie + ")"
}
//鼠标移出事件
Fd.prototype.out = function () {
    this.xianshi.style.display = "none"
    this.bigBox.style.display = "none"
}
//鼠标移入大盒子事件
Fd.prototype.over = function () {
    this.xianshi.style.display = "block"
    this.bigBox.style.display = "block"
    //移入的时候还要触发移动事件
    this.top.onmousemove = (e) => {
        var e = e || window.event;
        var x = e.pageX - this.box.offsetLeft - (this.xianshi.offsetWidth / 2);
        var y = e.pageY - this.box.offsetTop - (this.xianshi.offsetHeight / 2);
        // console.log(x, y);
        if (x < 0) {
            x = 0
        } else if (x > this.top.offsetWidth - this.xianshi.offsetWidth) {
            x = this.top.offsetWidth - this.xianshi.offsetWidth
        }
        if (y < 0) {
            y = 0
        } else if (y > this.top.offsetHeight - this.xianshi.offsetHeight) {
            y = this.top.offsetHeight - this.xianshi.offsetHeight
        }
        this.xianshi.style.left = x + "px"
        this.xianshi.style.top = y + "px"

        this.BigMove(x, y)
    }
}
//鼠标移入之后的事件
Fd.prototype.BigMove = function (x, y) {
    var l = this.top.offsetWidth / this.xianshi.offsetWidth;
    var t = this.top.offsetHeight / this.xianshi.offsetHeight;
    // console.log(l, t);
    this.bigBox.style.backgroundPosition = `-${l*x}px -${t*y}px`;
}

//js获取url
function getUrl(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return (false);
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
                var str =0;
                for (var i in res) {
                    if (res[i].id) {
                        str++;
                    }
                }
                $(".open>a>span").text(str)
            }
        })
    }
    var id = getUrl("id")
    // console.log(id);
    $.ajax({
        type: "post",
        url: "../server/details.php",
        data: {
            id: id
        },
        async: false,
        // success: 
    }).done(function (response) {
        var res = JSON.parse(response)
        if (res.status == 200) {
            var data = res.data;
            var span = $("<br><span>" + data.shopExplain + "</span>")
            $("h3").text(data.shopName);
            $("h3").append(span)
            $(".img>img").attr("src", data.shopImg);
            $(".money").text(data.shopMoney);
            $(".kuc").text(data.kuchun)
            var arr = data.shopxt.split("===");
            // console.log(arr);
            $(".footer1").html("")
            for (var i = 0; i < arr.length; i++) {
                var img = $("<div class='img1'><img src='" + arr[i] + "'></div>");
                $(".footer1").append(img);
            }
            var brr = data.shopColor.split("===");
            $(".color").html("颜色：")
            for (var i = 0; i < brr.length; i++) {
                if (i == 0) {
                    var color = $("<input type='radio' name='color' checked='checked' value='" + brr[i] + "'> <b>" + brr[i] + "</b>");
                } else {
                    var color = $("<input type='radio' name='color' value='" + brr[i] + "'> <b>" + brr[i] + "</b>");
                }

                $(".color").append(color);

            }
            var crr = data.shopXh.split("===");
            $(".neiCun").html("内存：")
            for (var i = 0; i < crr.length; i++) {
                if (i == 0) {
                    var neiCun = $("<input type='radio' name='neiCun' checked='checked' value='" + crr[i] + "'> <b>" + crr[i] + "</b>");
                } else {
                    var neiCun = $("<input type='radio' name='neiCun' value='" + crr[i] + "'> <b>" + crr[i] + "</b>");
                }
                $(".neiCun").append(neiCun);
            }
            var fd = new Fd("box")
            $(":radio").click(function () {
                var neiCh = $("input[name='neiCun']:checked").val();
                var color = $("input[name='color']:checked").val();
                $.ajax({
                    type: "post",
                    url: "../server/radio1.php",
                    data: {
                        neiCh: neiCh,
                        color: color
                    },

                }).done(function (res1) {
                    var res = JSON.parse(res1)
                    if (res.status == 200) {
                        var data = res.data;
                        $(".money").text(data.shopMoney);
                        $(".kuc").text(data.kuchun);

                    }
                })
            });
            $(".btn2").click(function () {
                var neiCh = $("input[name='neiCun']:checked").val();
                var color = $("input[name='color']:checked").val();
                var kuc=$(".kuc").text();
                var shopName=$("h3").text();
                var money=$(".money").text()
                var img=$(".img img").attr("src");
                console.log( neiCh,color,kuc);
                var name=getCookie("username")
                if(name){
                    $.ajax({
                        type: "post",
                        url: "../server/addcar.php",
                        data: {
                            neiCh1: neiCh,
                            color1: color,
                            kuc1:kuc,
                            name:name,
                            shopName:shopName,
                            money:money,
                            imgs:img
                        },
                        async: false,
                    }).done(function (res) {
                        var res = JSON.parse(res)
                        if (res.status == 200) {
                            console.log(res);
                            $(".kuc").text(res.kucun)
                        if (res.kucun <= 0) {
                            $(":button").attr("disabled", "disabled").css({
                                opacity: 0.5,
                                cursor: "not-allowed"
                            });
                        }
                        
    
                    }
                    })
                }else{
                    alert("请先登录");
                    location.href = '../html/login.html';
                }
                
            })
            $(".btn1").click(function () {
                var neiCh = $("input[name='neiCun']:checked").val();
                var color = $("input[name='color']:checked").val();
                var kuc=$(".kuc").text();
                var shopName=$("h3").text();
                var money=$(".money").text()
                var img=$(".img img").attr("src");
                console.log( neiCh,color,kuc);
                var name=getCookie("username")
                if(name){
                    $.ajax({
                        type: "post",
                        url: "../server/addcar.php",
                        data: {
                            neiCh1: neiCh,
                            color1: color,
                            kuc1:kuc,
                            name:name,
                            shopName:shopName,
                            money:money,
                            imgs:img
                        },
                        async: false,
                    }).done(function (res) {
                        var res = JSON.parse(res)
                        if (res.status == 200) {
                            console.log(res);
                            location.href='../html/car.html'
                            
                    }
                    })
                }else{
                    alert("请先登录");
                    location.href = '../html/login.html';
                }
                
            })
        }
    });
});