$(function(){
    jQuery.validator.addMethod(
        "isInt",
        function(value,element){
            var bool=/^[0-9]*[1-9][0-9]*$/;
            return this.optional(element)||(bool.test(value));
        },
        "请输入一个整数"
    );
    jQuery.validator.addMethod(
        "notStart90",
        function(value,element){
            var bool=/^[1-8][0-9]{1,4}$/;
            return this.optional(element)||(bool.test(value));
        },
        "请输入以1-8开头的2-5位数"
    );
    jQuery.validator.addMethod(
        "domain",
        function(value,element){
            var bool=/((https|http|ftp|rtsp|mms):\/\/)?(([0-9a-z_!~*'().&=+$%-]+:)?[0-9a-z_!~*'().&=+$%-]+@)?(([0-9]{1,3}\.){3}[0-9]{1,3}|([0-9a-z_!~*'()-]+\.)*([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\.[a-z]{2,6})(:[0-9]{1,4})?((\/?)|(\/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+\/?)/g;
            return this.optional(element)||(bool.test(value));
        },
        "请输入正确的域名,如:www.jiweitech.com"
    );
    jQuery.validator.addMethod(
        "phone",
        function(value,element){
            var bool= /^0{0,1}1[0-9]{10}$/;
            return this.optional(element)||(bool.test(value));
        },
        "请输入正确的手机号码"
    );
    jQuery.validator.addMethod(
        "mobile",
        function(value,element){
            var bool= /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^$)/;
            return this.optional(element)||(bool.test(value));
        },
        "电话格式不规范,请按照010-85215325 格式填写"
    );
    jQuery.validator.addMethod(
        "postcode",
        function(value,element){
            var bool= /(^[0-9]{5,6}$)|(^$)/;
            return this.optional(element)||(bool.test(value));
        },
        "请输入正确的邮政编码"
    );
    //传真
    jQuery.validator.addMethod("fax",function(value,element){
        var fax = /^(\d{3,4})?[-]?\d{7,8}$/;
        return this.optional(element) || (fax.test(value));
    },"传真格式如：0371-68787027");

    //汉字
    jQuery.validator.addMethod("chinese", function (value, element) {
        var chinese = /^[\u4E00-\u9FFF]+$/;
        return this.optional(element) || (chinese.test(value));
    }, "格式不对");

    //身份证
    jQuery.validator.addMethod("idCard", function (value, element) {
        var isIDCard1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;//(15位)
        var isIDCard2=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;//(18位)
        return this.optional(element) || (isIDCard1.test(value)) || (isIDCard2.test(value));
    }, "请输入正确的身份证号码");

    //只能输入数字
    jQuery.validator.addMethod("intNumber",function(value,element){
        var intNumber = /^[1-9]\d*$/;
        return this.optional(element) || (intNumber.test(value));
    },"只能输入数字");
});