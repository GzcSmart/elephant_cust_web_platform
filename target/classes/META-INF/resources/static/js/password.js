//登录页面密码框设置(解决password有缓存问题)
$("#customerPwds").bind('input propertychange',function(){
    var a=$("#customerPwds").val();
    var b=a.length;
    var c="";
    for(var i=0;i<b;i++){
        c=c+"●";
    }
    $("#customerPwdss").val(c);
});

$("#customerPwdss").bind('input propertychange',function(){
    var a=$("#customerPwdss").val();
    var h=a;
    var b=a.length;
    var c="";
    for(var i=0;i<b;i++){
        c=c+"●";
    }
    $("#customerPwdss").val(c);

    h=h.replace(/●/g,"");
    var f=$("#customerPwds").val();
    if(a.length<f.length){
        f=f.substring(0,a.length);
        $("#customerPwds").val(f);
    }
    else{
        f=f+h;
        $("#customerPwds").val(f);
    }
});

var d=0;
$("#login_img").click(function(){
    if(d==0){
        $("#customerPwdss").css("display","none");
        $("#customerPwds").css("display","block");
        $("#login_img").attr("src","/static/images/eyes_blue.png");
        d=1;
    }
    else{
        $("#customerPwdss").css("display","block");
        $("#customerPwds").css("display","none");
        $("#login_img").attr("src","/static/images/eyes_gray.png");
        d=0;
    }
});
