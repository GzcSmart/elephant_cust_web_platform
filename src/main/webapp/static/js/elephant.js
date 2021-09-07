/**
 * Created by gaohan on 2016/4/19.
 */
$(document).ready(function() {
    $(".header-pic").click(function() {
        $(".nav").slideToggle("slow");
    });
});
// $(document).ready(function(){
// $(".Mant-hsp3").click(function(){
// $(".Mant-hsp3>ul").slideToggle("slow");
// });
// });
$(document).ready(function() {
    $(".Mant-hsp3").mouseover(function() {
        $(".Mant-hsp3>ul").show();
    });
    $(".Mant-hsp3>ul").mouseleave(function() {
        $(".Mant-hsp3>ul").hide();
    });
});

$(document).ready(function() {
    $(".hide-Mant1>span").click(function() {
        $(".hide-Mant1>ul").slideToggle("slow");
    });
});
$(document).ready(function() {
    $(".hide-Mant2>span").click(function() {
        $(".hide-Mant2>ul").slideToggle("slow");
    });
});
$(document).ready(function() {
    $(".hide-Mant3>span").click(function() {
        $(".hide-Mant3>ul").slideToggle("slow");
    });
});
// management-center ��������
$(document).ready(function() {
    $(".ppt1").hover(function() {
        $(".bkg1").toggle();
    });
});
$(document).ready(function() {
    $(".ppt2").hover(function() {
        $(".bkg2").toggle();
    });
});
$(document).ready(function() {
    $(".ppt3").hover(function() {
        $(".bkg3").toggle();
    });
});

// open-service �����Է���
$(document).ready(function() {
    $(".Open-title-li1").hover(function() {
        $(".Open-title-li1>ul").toggle();
    });
});
$(document).ready(function() {
    $(".Open-title-li2").hover(function() {
        $(".Open-title-li2>ul").toggle();
    });
});
$(document).ready(function() {
    $(".Open-title-li3").hover(function() {
        $(".Open-title-li3>ul").toggle();
    });
});
$(document).ready(function() {
    $(".Open-title-li4").hover(function() {
        $(".Open-title-li4>ul").toggle();
    });
});
$(document).ready(function() {
    $(".Open-title-li5").hover(function() {
        $(".Open-title-li5>ul").toggle();
    });
});
$(document).ready(function() {
    $(".Open-title-li6").hover(function() {
        $(".Open-title-li6>ul").toggle();
    });
});

$(document).ready(function() {
    $(".ment-1").click(function() {
        $(".table-div-1").toggle();
    });
});
$(document).ready(function() {
    $(".ment-2").click(function() {
        $(".table-div-2").toggle();
    });
});
$(document).ready(function() {
    $(".ment-3").click(function() {
        $(".table-div-3").toggle();
    });
});
$(document).ready(function() {
    $(".ment-4").click(function() {
        $(".table-div-4").toggle();
    });
});
$(document).ready(function() {
    $(".ment-5").click(function() {
        $(".table-div-5").toggle();
    });
});
$(document).ready(function() {
    $(".ment-6").click(function() {
        $(".table-div-6").toggle();
    });
});
$(document).ready(function() {
    $(".ment-7").click(function() {
        $(".table-div-7").toggle();
    });
});
$(document).ready(function() {
    $(".ment-8").click(function() {
        $(".table-div-8").toggle();
    });
});

function huan(obj) {
    var obj = $(obj);
    var li = $('.table-div-4>ul li');
    li.removeClass('kk-li2');
    li.addClass('kk-li1');
    obj.removeClass('kk-li1');
    obj.addClass('kk-li2');
    var num1 = obj.index();
    var con1 = $(".kk-div");
    var objcon1 = con1.eq(num1);
    con1.hide();
    objcon1.show();
}

/**
 * guoyuxuan 异常示例js
 *
 * @param targ
 */
function exception(targ) {
    var obj = $(targ);
    var li = $('.table-div-5>ul li');
    li.removeClass('kk-li2');
    li.addClass('kk-li1');
    obj.removeClass('kk-li1');
    obj.addClass('kk-li2');
    var num2 = obj.index();
    var con2 = $(".kk-div1");
    var objcon2 = con2.eq(num2);
    con2.hide();
    objcon2.show();
}

// xiaoweiqi 20160506 begin



function textareaCount() {
    $("#count").text($("#remark").val().length);
}



// xiaoweiqi end
