var a = getCookie("uname");
if (a) {
    $(".open").css("display", "block")
    $(".login").css("display", "none")
} else {
    $(".login").css("display", "block")
    $(".open").css("display", "none")
}

console.log($("#list"));
$.ajax({
    url: "../server/list.php",
    type: "post",
    dataType: "json",
    success: function (res) {
        console.log(res);
        var total = res.length;
        var pageSize = 6;
        new Page({
            pageData: {
                total: total,
                pageSize: pageSize
            },
            language: {
                first: "首页",
                previous: "上一页",
                next: "下一页",
                last: "尾页"
            }
        }, function (currentPage) {
            var str = '';
            var arr = res.slice((currentPage - 1) * pageSize, currentPage * pageSize);
            for (var i = 0; i < arr.length; i++) {
                str += `
            <li
            ><a href="#">
                    <img src="${arr[i].shopImg}" alt="">
                </a>
                <p><a href="#">${arr[i].shopName}
                    </a></p>
                <p>${arr[i].shopExplain}</p>
                <p><a href="details.html?id=${arr[i].sid}">查看详情</a><a href="">前去购买</a></p>
            </li>
            `
            }
            $("#list").html(str);
        });

    }

})