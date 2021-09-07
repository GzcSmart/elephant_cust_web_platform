$(document).ready(function(){
    var widget = $('.tabs-basic');
    var tabs = widget.find('ul a'), content = widget
        .find('.tabs-content-placeholder > div');
    tabs.on('click', function(e) {
        var index = $(this).data('index');
        if (index == 0) {
            $("#unitType").val("0");
            $("#actualControl").css("display","block");
            $("#spanOrgName").html("企业信息");
            $("#cerTypeContainer").css("display","block");
            $("#lblOrgName").html("企业名称");
            if ($("#ordinary").prop("checked")) {
                $("#orgCodeDiv").css("display", "block");
                $("#regCode").html("注册号");
                $("#registerCode").rules("add",{messages:{required:"请输入注册号",
                        maxlength:"注册号长度必须小于64位",
                        remote:"注册号已被使用"}});
            } else if ($("#more").prop("checked")) {
                $("#orgCodeDiv").css("display", "none");
                $("#regCode").html("社会信用代码（或注册号）");
                $("#registerCode").rules("add",{messages:{required:"请输入社会信用代码（或注册号）",
                        maxlength:"社会信用代码（或注册号）长度必须小于64位",
                        remote:"社会信用代码（或注册号）已存在"}});
            }
            $("#registerCode").attr("placeholder","如：00000000001234");
            $("#lblScope").html("经营范围");
            $("#lblExpirationTime").html("营业期限");
            $(".orgInfo .col-md-5").html("");
            $(".orgInfo input,.orgInfo textarea").removeClass("error");
        } else if(index == 1) {
            $("#unitType").val("1");
            $("#actualControl").css("display","none");
            $("#spanOrgName").html("事业单位信息");
            $("#cerTypeContainer").css("display","none");
            $("#lblOrgName").html("事业单位名称");
            $("#regCode").html("事证号");
            $("#registerCode").attr("placeholder","如：事证第0000000001234号");
            $("#lblScope").html("宗旨和业务范围");
            $("#lblExpirationTime").html("有效期");
            $("#orgCodeDiv").css("display","block");
            $("#registerCode").rules("add",{messages:{required:"请输入事证号",
                    maxlength:"事证号长度必须小于64位",
                    remote:"事证号已存在"}});
            $(".orgInfo .col-md-5").html("");
            $(".orgInfo input,.orgInfo textarea").removeClass("error");
        } else if(index == 2) {
            $("#unitType").val("2");
            $("#actualControl").css("display","none");
            $("#spanOrgName").html("民办非企业单位信息");
            $("#cerTypeContainer").css("display","none");
            $("#lblOrgName").html("民办非企业单位名称");
            $("#regCode").html("民证字号");
            $("#registerCode").attr("placeholder","如：（闽）民证字第001234号");
            $("#lblScope").html("业务范围");
            $("#lblExpirationTime").html("有效期限");
            $("#orgCodeDiv").css("display","block");
            $("#registerCode").rules("add",{messages:{required:"请输入民证字号",
                    maxlength:"民证字号长度必须小于64位",
                    remote:"民证字号已存在"}});
            $(".orgInfo .col-md-5").html("");
            $(".orgInfo input,.orgInfo textarea").removeClass("error");
        } else if(index == 3) {
            $("#unitType").val("3");
            $("#actualControl").css("display","none");
            $("#spanOrgName").html("个体工商户信息");
            $("#cerTypeContainer").css("display","none");
            $("#lblOrgName").html("名称");
            $("#regCode").html("注册号");
            $("#registerCode").attr("placeholder","");
            $("#lblScope").html("经营范围");
            $("#lblExpirationTime").html("营业期限");
            $("#orgCodeDiv").css("display","none");
            $("#registerCode").rules("add",{messages:{required:"请输入注册号",
                    maxlength:"注册号长度必须小于64位",
                    remote:"注册号已被使用"}});
            $(".orgInfo .col-md-5").html("");
            $(".orgInfo input,.orgInfo textarea").removeClass("error");
        } else if(index == 4) {
            $("#unitType").val("4");
            $("#actualControl").css("display","none");
            $("#spanOrgName").html("社会团体信息");
            $("#cerTypeContainer").css("display","none");
            $("#lblOrgName").html("社会团体名称");
            $("#regCode").html("社证号");
            $("#registerCode").attr("placeholder","如：（闽）社证字第1234号");
            $("#lblScope").html("业务范围");
            $("#lblExpirationTime").html("有效期限");
            $("#orgCodeDiv").css("display","block");
            $("#registerCode").rules("add",{messages:{required:"请输入社证号",
                    maxlength:"社证号长度必须小于64位",
                    remote:"社证号已存在"}});
            $(".orgInfo .col-md-5").html("");
            $(".orgInfo input,.orgInfo textarea").removeClass("error");
        } else if(index == 5) {
            $("#unitType").val("5");
            $("#actualControl").css("display","none");
            $("#spanOrgName").html("党政及国家机关信息");
            $("#cerTypeContainer").css("display","none");
            $("#lblOrgName").html("单位名称");
            $("#regCode").html("执法证号");
            $("#registerCode").attr("placeholder","");
            $("#lblScope").html("业务范围");
            $("#lblExpirationTime").html("有效期限");
            $("#orgCodeDiv").css("display","block");
            $("#registerCode").rules("add",{messages:{required:"请输入执法证号",
                    maxlength:"执法证号长度必须小于64位",
                    remote:"执法证号已存在"}});
            $(".orgInfo .col-md-5").html("");
            $(".orgInfo input,.orgInfo textarea").removeClass("error");
        }
        tabs.removeClass('tab-active');
        content.removeClass('tab-content-active');
        $(this).addClass('tab-active');
        content.eq(index).addClass('tab-content-active');
    });
});

$(function() {
    //日历控件
    var nowTime = new Date();
    var $date = $('#expirationTime,#legalExpirationTime,#agentExpirationTime,#holderCertExpiryTime');
    var options ={};
    options["format"] ="yyyy-mm-dd";
    options["language"] ="zh-CN";
    options["startDate"] =nowTime;
    options["endDate"] ="2999-12-31";
    options["autohide"] ="true";
    $date.datepicker('reset').datepicker('destroy').datepicker(options);



    if ($("#ordinary").prop("checked")) {
        $("#orgCodeDiv").css("display", "block");
        $("#regCode").html("注册号");
    } else if ($("#more").prop("checked")) {
        $("#orgCodeDiv").css("display", "none");
        $("#regCode").html("社会信用代码（或注册号）");
    }

    $("#ordinary").click(function() {
        $("#orgCodeDiv").css("display", "block");
        $("#regCode").html("注册号");
    });
    $("#more").click(function() {
        $("#orgCodeDiv").css("display", "none");
        $("#regCode").html("社会信用代码（或注册号）");
    });

    $('#detail').click(function() {
        showUploadImg($("#pic-org").attr("src"));
    });
    $('#detail-2').click(function() {
        showUploadImg($("#pic-org-2").attr("src"));
    });
    $('#detail2').click(function() {
        showUploadImg($("#pic-institute").attr("src"));
    });
    $('#detail3').click(function() {
        showUploadImg($("#pic-private").attr("src"));
    });
    $('#detail4').click(function() {
        showUploadImg($("#pic-individual").attr("src"));
    });
    $('#detail5').click(function() {
        showUploadImg($("#pic-social").attr("src"));
    });
    $('#detail6').click(function() {
        showUploadImg($("#pic-organs").attr("src"));
    });


    //企业信息中经营期限的复选框设置
    $("#orgMainCertIsIdAlwassValid").click(function(){
        if($("#orgMainCertIsIdAlwassValid").prop("checked")){
            $("#expirationTime").val("").attr("disabled",true).removeClass("error");
            $("#expirationTime").parent().next().html("");
        } else{
            $("#expirationTime").val("").attr("disabled",false);
        }
    });

});

//validate 规则 begin
$(document).ready(function(){
    var validator=$("#orgAuditForm").validate({
        rules:{
            orgName:{
                required:true,
                maxlength:50
            },
            registerCode:{
                required:true,
                maxlength:64,
                remote:{
                    url:"orgInfoAudit/validateRegCode.do",
                    type:"post",
                    dataType:"json",
                    data:{
                        regCode:function(){
                            return $("#registerCode").val();
                        }
                    }
                }
                //远程地址只能输出"true"或"false"
            },
            province:{
                checkProvince:[]
            },
            city:{
                checkCity:[]
            },
            orgAddress:{
                required:true,
                maxlength:255
            },
            orgScope:{
                required:true,
                maxlength:255
            },
            dueDate:{
                required:true,
                dateISO:true
            },
            orgCode:{
                required:true,
                maxlength:10,
                minlength:9,
                checkRegisterCode:[],
                remote:{
                    url:"orgInfoAudit/validateOrgCode.do",
                    type:"post",
                    dataType:"json",
                    data:{
                        orgCode:function(){
                            return $("#orgCode").val();
                        }
                    }
                }
            },
            telPhone:{
                required:true,
                mobile:[],
                remote:{
                    url:"orgInfoAudit/validateTelPhone.do",
                    type:"post",
                    dataType:"json",
                    data:{
                        regCode:function(){
                            return $("#telPhone").val();
                        }
                    }
                }
            },
            mobilePhone:{
                checkPhone:[]
            },
            //推荐人/公司校验
            recommendName:{
                checkRecommendName:[]
            },

            //手机号校验
            tempPhone:{
                required:true,
                checkPhone:[]
            }
        },
        messages:{
            orgName:{
                required:"请输入企业名称",
                maxlength:"企业名称长度必须小于50位"
            },
            registerCode:{
                required:"请输入注册号",
                maxlength:"注册号长度必须小于64位",
                remote:"注册号已被使用"
            },
            orgAddress:{
                required:"请输入住所",
                maxlength:"住所长度必须小于255"
            },
            orgScope:{
                required:"请输入经营范围",
                maxlength:"经营范围长度必须小于255"
            },
            dueDate:{
                required:"请输入营业期限"
            },
            orgCode:{
                required:"请输入组织机构代码",
                maxlength:"组织机构代码长度需为9位或10位",
                minlength:"组织机构代码长度需为9位或10位",
                remote:"组织机构代码已被使用"
            },
            telPhone:{
                required:"请输入企业固话",
                remote:"企业固话已被使用"
            },
            //手机号校验
            tempPhone:{
                required:"请输入联系人手机号码"
            }
        },
        errorPlacement:function(error,element){
            element.parent().next().html(error.text());
        },
        success:function(element){
            element.parent().next().html("");
        },
        onfocusout:function(element){
            $(element).valid();
        },
        onkeyup:false,
        focusCleanup:true,

        submitHandler:function(form){
            var screenHeight=document.documentElement.clientHeight;
            screenHeight=screenHeight*0.8;
            var screenWidth=document.documentElement.clientWidth;
            if(screenWidth>700){
                screenWidth=700;
            }else{
                screenWidth=screenWidth*0.9;
            }
            $.ajax({
                url:'customerInfo/getCustomerStatus.do',
                dataType:"json",
                success:function(data){
                    if(data.status==2){
                        layer.msg('您的账户异常，无法完成操作，请联系客服',{icon:2});
                    }else{
                        layer.open({
                            scrollbar:false,
                            fixed:false,
                            resize:true,
                            title : [ '信息确认' ,'font-size:14px;font-weight:bold;color:RGB(118,131,153)'],
                            area : [ screenWidth+'px', screenHeight+'px' ],
                            content : orgInfoHtml,
                            btn : [ '确认', '修改' ],
                            yes : function(index) {
                                form.submit();
                                $(".layui-layer-btn0").off();
                            }
                        });
                    }
                }
            });
        }
    });

    $.validator.addMethod("checkPhone", function(value,element) {
        return /^0{0,1}1[0-9]{10}$/.test(value);
    },'请输入正确的手机号');

    $.validator.addMethod("checkProvince", function(value,element) {
        return value != "请选择";
    },'请选择单位所在地');
    $.validator.addMethod("checkCity", function(value,element) {
        return value != "请选择";
    },'请选择单位所在地');

    $.validator.addMethod("checkRegisterCode", function(value,element) {
        return /^[0-9a-zA-Z-]{9,10}$/.test(value);
    },'组织机构代码不符合规则');
    $.validator.addMethod("checkRecommendName", function(value,element) {
        return value != $('#orgName').val();
    },'推荐人/公司不能填写自己');


//validate规则 end

});
var orgInfoHtml ="";
$(document).ready(function(){
    $("#next").click(function(){
        orgInfoHtml ="";
        orgInfoHtml += '<div class="test"><div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">'+$("#lblOrgName").html()+'</div><div class="col-sm-8" style="padding-bottom:8px;">'+$("#orgName").val()+'</div></div>';
        orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">'+$("#regCode").html()+'</div><div class="col-sm-8" style="padding-bottom:8px;">'+$("#registerCode").val()+'</div></div>';
        orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">单位所在地</div><div class="col-sm-8" style="padding-bottom:8px;">'+$("#province").val()+$("#city").val()+'</div></div>';
        orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">'+$("#lblAddress").html()+'</div><div class="col-sm-8" style="padding-bottom:8px;">'+$("#orgAddress").val()+'</div></div>';
        orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">企业固定号码</div><div class="col-sm-8" style="padding-bottom:8px;">'+$("#telPhone").val()+'</div></div>';
        if($("#mobilePhone").val()!="" && $("#mobilePhone").val()!=null){
            orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">企业绑定手机</div><div class="col-sm-8" style="padding-bottom:8px;">'+$("#mobilePhone").val()+'</div></div>';
        }
        orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">'+$("#lblScope").html()+'</div><div class="col-sm-8" style="padding-bottom:8px;">'+$("#orgScope").val()+'</div></div>';
        if($("#orgMainCertIsIdAlwassValid").prop("checked")){
            orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">'+$("#lblExpirationTime").html()+'</div><div class="col-sm-8" style="padding-bottom:8px;">长期</div></div>';
        }else{
            orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">'+$("#lblExpirationTime").html()+'</div><div class="col-sm-8" style="padding-bottom:8px;">'+$("#expirationTime").val()+'</div></div>';
        }

        if($("#ordinary").prop("checked") && $("#unitType").val()!=3){
            orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">组织机构代码</div><div class="col-sm-8" style="padding-bottom:8px;">'+$("#orgCode").val()+'</div></div>';
        }
        orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">推荐人/公司名称</div><div class="col-sm-8" style="padding-bottom:8px;" >'+$("#recommendName").val()+'</div></div>';
        orgInfoHtml += '<div class="clearfix"><div class="col-sm-4" style="text-align:right;font-weight:bold;padding-bottom:8px;">联系人手机号码</div><div class="col-sm-8" style="padding-bottom:8px;" >'+$("#tempPhone").val()+'</div></div></div>';
    });
});

$(document).ready(function(){
    setTimeout(function(){
        var expirationTime = $("#expirationTime").val();
        if("2999-12-31"==expirationTime){
            $("#orgMainCertIsIdAlwassValid").attr("checked",true);
            $("#expirationTime").val("").attr("disabled",true);
            resetDatepicker($("#expirationTime"));
        }

        if($("#orgMainCertIsIdAlwassValid").prop("checked")){
            $("#expirationTime").val("").attr("disabled",true);
        }

        var unitType = $("#unitType").val();
        $('.tabs-basic').find('ul a').eq(unitType).click();

        var orgCode = $("#orgCode").val();
        if(0==unitType && ""==orgCode && ""!=expirationTime){
            $("#more").attr("checked",true);
            $("#more").triggerHandler("click");
        }

    },10);
    if($("#paramError").html()!=""){
        layer.msg($("#paramError").html(),{icon:0});
    }

    function resetDatepicker(element){
        var nowTime = new Date();
        var $date = element;
        var options ={};
        options["format"] ="yyyy-mm-dd";
        options["language"] ="zh-CN";
        options["startDate"] =nowTime;
        options["endDate"] ="2999-12-31";
        options["autohide"] ="true";
        options["date"] =nowTime;
        $date.datepicker('reset').datepicker('destroy').datepicker(options);
    }

});
function showUploadImg(ImageSrc){
    var screenHeight=document.documentElement.clientHeight;
    var screenWidth=document.documentElement.clientWidth;
    var showHeight=screenHeight*0.8;
    var showWidth=screenWidth*0.8;
    var img=new Image;
    img.src=ImageSrc;
    img.onload=function(){
        var height=img.height;
        var width=img.width;
        if(height>showHeight || width>showWidth){
            if(height>showHeight && width>showWidth){
                if((height/showHeight)>=(width/showWidth))
                {
                    bili=showHeight/height;
                }else{
                    bili=showWidth/width;
                }
                height=(height*bili);
                width=(width*bili);
            }else if(height>showHeight){
                bili=showHeight/height;
                height=height*bili;
                width=width*bili;
            }else if(width>showWidth){
                bili=showWidth/width;
                height=height*bili;
                width=width*bili;
            }
        }
        layer.open({
            title:'<b><i class="im-image2"/> 浏览</b>',
            type:1,
            area:[width+'px',height+92+'px'],
            fixed:false,
            resize:true,
            scrollbar:false,
            shadeClose:true,
            content:'<div><img src="'+ImageSrc+'" height='+height+'px width='+width+'px"></div>',
            moveOut:true,
            btn:['原图'],
            yes:function(index,layero){
                window.open(ImageSrc);
            }
        });
    };
}

function directToAgreement(url,type) {
    var screenHeight = document.documentElement.clientHeight;
    var screenWidth = document.documentElement.clientWidth;
    layer.open({
        title: '<span style="font-size: 16px"><i class="st-book2"/>&nbsp;服务条款</span>',
        type: 2,
        area: [screenWidth * 0.7 + 'px', screenHeight * 0.8 + 'px'],
        fixed: false,
        resize: true,
        scrollbar: false,
        shadeClose: true,
        content: url + "/customerInfo/goAgreement.do?type=" + type + "&isCheckNeed=" + 1,
        moveOut: true,
        anim: -1,
        btn: ['返回'],
        yes: function (index, layero) {
            layer.closeAll();
        }
    });
}
