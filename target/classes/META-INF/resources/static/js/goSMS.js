/**
 * Created by Administrator on 2017/4/11.
 */
/*跳转至短信开通页面*/
function goSMSIndex(type) {
    var str = "/smsConfig/getSmsConfigDetail.do?signatureType=" + type + "&time=";
    var url = $("#url").val();
    $.ajax({
        type: "GET",
        url: url + "/smsConfig/checkSmsStatus.do?type=" + type + "&time=" + new Date().getTime(),
        dataType: "json",
        async: false,
        success: function (data) {
            var code = data.code;
            if (code == "0000") {
                window.location.href = url + str + new Date().getTime();
            } else {
                layer.msg(data.message, {icon: 2});
            }
        }
    });
}

function checkYwInfoStatus(systemYwId,type) {

    if (type !== ""){
        checkSystemYwStatus(systemYwId,type);
    } else {
        checkAuthYwStatus()
    }
}

function checkSystemYwStatus(systemYwId, type) {
    var targetUrl = "";
    var url = $("#url").val();
    if(type==0){
        targetUrl = "/smsConfig/getSmsConfigDetail.do?signatureType=" + type + "&time=";
    }else if(type==1){
        targetUrl = "/smsConfig/getSmsConfigDetail.do?signatureType=" + type + "&time=";
    }else if(type==2){
        targetUrl = "/voice/getVoiceConfigDetail.do?signatureType=" + 0 + "&time=";
    }else if(type==3){
        targetUrl = "/voice/getVoiceConfigDetail.do?signatureType=" + 1 + "&time=";
    }else if(type==5){
        targetUrl = "/smsConfig/getSmsConfigDetail.do?signatureType=" + 3 + "&time=";
    }else{
        targetUrl = "/smsConfig/getSmsConfigDetail.do?signatureType=" + 2 + "&time=";
    }
    $.ajax({
        type: "GET",
        url: url + "/ywInfo/checkYwInfoStatus.do?systemYwId=" + systemYwId + "&time=" + new Date().getTime(),
        dataType: "json",
        async: false,
        success: function (data) {
            var code = data.code;
            if (code == "0000") {
                window.location.href = url + targetUrl + new Date().getTime();
            } else {
                layer.msg(data.message, {icon: 2});
            }
        }
    });
}

function checkAuthYwStatus() {
    var targetUrl = "";
    var url = $("#url").val();
    targetUrl = "/authConfig/getAuthConfigDetail.do?time=";
    $.ajax({
        type: "GET",
        url: url + "/ywInfo/checkAuthYwInfoStatus.do?time=" + new Date().getTime(),
        dataType: "json",
        async: false,
        success: function (data) {
            var code = data.code;
            if (code == "0000") {
                window.location.href = url + targetUrl + new Date().getTime();
            } else {
                layer.msg(data.message, {icon: 2});
            }
        }
    });
}
