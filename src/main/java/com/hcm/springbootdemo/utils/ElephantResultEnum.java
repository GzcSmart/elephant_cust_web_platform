package com.hcm.springbootdemo.utils;


public enum ElephantResultEnum {

    /**
     * code
     */
    CODE("code", "返回码"),
    /**
     * message
     */
    MESSAGE("message", "信息内容"),
    /**
     * 成功
     */
    SUCCESS("0000", "操作成功"),
    /**
     * 其他的操作但也成功
     */
    SUCCESS_FOR_OTHER("0001", "操作成功"),
    /**
     * 失败
     */
    FAIL("9999", "服务器繁忙,请稍后再试"),
    /**
     * TOOMANYRESULTEXCEPTION
     */
    SQL_RESULT_UNUSUAL("9998", "数据异常,请联系客服人员"),
    /**
     * 查询失败
     */
    QUERY_FAIL("9997", "查询失败，没有数据"),
    /**
     * 手机号码为空
     */
    PHONE_EMPTY("1001", "手机号码为空"),
    /**
     * 手机验证码为空
     */
    PHONECODE_EMPTY("1002", "手机验证码为空"),
    /**
     * 验证码错误
     */
    PHONECODE_ERROR("1003", "验证码错误"),
    /**
     * 还未发送验证码
     */
    NO_CAPTCHA_CODE("1013", "请先发送验证码"),
    /**
     * 用户不存在
     */
    PHONE_ERROR("1004", "用户不存在"),
    /**
     * 手机号码不唯一
     */
    NOT_ONLY_PHONE("1005", "手机号不唯一"),
    /**
     * 无模板
     * zhenghuiqing 添加无模板错误码
     */
    NO_TEMPLATE("1234", "暂无短信模板,请先配置短信模板"),
    /**
     * 语音无模板
     * zhenghuiqing 添加无模板错误码
     */
    NO_VOICETEMPLATE("1235", "暂无语音模板,请先配置语音模板"),
    /**
     * zhenghuiqing 模板重复
     */
    TEMPLATE_REPEAT("4569", "模板已添加,请勿重复操作"),
    /**
     * 登录名错误
     */
    WRONG_NAME("1111", "登录名错误"),
    /**
     * 尚未激活
     */
    NO_ACTIVATION("1112", "尚未激活"),
    /**
     * 登录密码错误
     */
    WRONG_PASSWORD("2222", "登录密码错误"),
    /**
     * 过期
     */
    OUTTIME("8888", "登录超时"),
    /**
     * 未请求
     */
    NO_REQUEST("7777", ""),
    /**
     * 请求参数错误
     */
    ERROR_PARAM("6666", "非法参数"),
    /**
     * 非法请求
     */
    ILLEGAL_REQUEST("6669", "非法请求"),
    /**
     * 验证码错误
     */
    WRONG_CODE("6668", "验证码错误"),
    /**
     * 异常
     */
    ABNORMAL("9998", "内部异常"),

    /**
     * 账号异常
     */
    ACCOUNT_WARN("6667", "账号异常"),

    /**
     * 小程序登录超时
     */
    WECHAT_NO_SESSION("5566", "登录超时"),

    /**
     * 余额不足以群发短信
     */
    BALANCE_NO_ENOUGH("6688", " 余额不足,请先充值");


    private String code;
    private String message;

    ElephantResultEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

}
