function userGuide() {
    $("#step1").click(function () {
        window.location.href = "/addIndividualInfo";
    });
    $("#step2").click(function () {
        window.location.href = "/getConditionYw";
    });
    $("#step3").click(function () {
        window.location.href = "/getConditionYw";
    });
    $("#step4").click(function () {
        window.location.href = "/getConditionYw";
    });
}

function getYwList() {
    $.ajax({
        type: "GET",
        dataType: "JSON",
        url: "customerYwList",
        data: {},
        success: function (data) {
            if (data != null) {
                console.log(data);
                showYwList(data);
            }
            layer.closeAll();
        }
    });
}

function showYwList(data){
    var ywList = $("#ywList");
    ywList.empty();
    var str = "";
    for (var i = 0; i < data.length; i++) {
        var status = data[i].status;
        if (typeof (data[i].status) == "undefined") {
            status = "";
        }
        str += "<div class=\"col-md-3\" style=\"width: 20%\" >" + "<div class=\"metric\"><span class=\"icon\" style=\"color: #75B9E6;\"><i class=\"fa fa-eye\"></i>" + "</span>" +
            "<p>" + "<span class=\"number\">" + data[i].ywName + "</span>" + "<span class=\"title\">";
        if (status === 1) {
            str += "已开启</span></p></div></div>";
        }else {
                str += "已关闭</span></p></div></div>";
            }
        }
    ywList.html(str);
}

$(function () {
    //用户导航
    userGuide();
    //服务列表
    getYwList();
});