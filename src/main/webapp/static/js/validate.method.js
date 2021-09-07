//表单验证方法
//formId:表单ID
//validate:{userName:{required:true},loginName:{required:true},password:{required:true,minlength:6}}
function bwValidate(formId,validate){
    $("#"+formId+"").validate({
        rules: validate,
        messages: {},
        errorElement:"em",
        highlight:function(element,errorClass){
            var obj = document.getElementById(element.id+"-error");
            if(obj!=null){
                obj.className = "";
                obj.className = "error";
            }
        },
        beforeSend:function(){
//			alert(1);
        },
        success:function(label){
            label.addClass("success");
        }
    });
}

function bwValidateRemote(formId,validate,message){
    $("#"+formId+"").validate({
        rules: validate,
        messages: message,
        errorElement:"em",
        highlight:function(element,errorClass){
            var obj = document.getElementById(element.id+"-error");
            if(obj!=null){
                obj.className = "";
                obj.className = "error";
            }
        },
        success:function(label){
            label.addClass("success");
        }
    });
}

//表单验证方法
function bwValidateAjax(formId,validate,submitCallBack){
    $("#"+formId+"").validate({
        rules: validate,
        messages: {},
        errorElement:"em",
        highlight:function(element,errorClass){
            var obj = document.getElementById(element.id+"-error");
            if(obj!=null){
                obj.className = "";
                obj.className = "error";
            }
        },
        success:function(label){
            label.addClass("success");
        },
        submitHandler : function(){
            submitCallBack();
            return false;
        }
    });
}

//键盘监听,禁止右键及刷新
/*
var oLastBtn = 0, bIsMenu = false

function nocontextmenu() {
	event.cancelBubble = true;
	event.returnValue = false;
	return false;
}
function norightclick(e) {
	if (window.Event) {
		if (e.which != 1) {
			return false;
		}
	} else if (event.button != 1) {
		event.cancelBubble = true;
		event.returnValue = false;
		return false;
	}
}

document.oncontextmenu = nocontextmenu;
document.onmousedown = norightclick;

function onKeyDown() {
	if ((event.altKey)
			|| ((event.keyCode == 8) && (event.srcElement.type != "text" && event.srcElement.type != "textarea" && event.srcElement.type != "password"))
			|| ((event.ctrlKey) && ((event.keyCode == 78) || (event.keyCode == 82))) || (event.keyCode == 116)) {
		event.keyCode = 0;
		event.returnValue = false;
	}
}

document.onkeydown = function(event) {
	if (event.ctrlKey) {
		event.returnValue = false;
	}
	if (window.event.keyCode == 116 || window.event.keyCode == 117) {
		window.event.keyCode = 0;
		window.event.returnValue = false; //禁止F5
	}
}
*/