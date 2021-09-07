package com.hcm.springbootdemo.utils;


import java.util.Map;

/**
 * 简化错误码和错误信息封装工具类
 *
 * @author zhuzeyong create on 2018/8/24.
 */
public class ResultUtils {

    /**
     * 成功
     *
     * @param resMap 封装的map
     */
    public static void success(Map resMap) {
        resultWithEnum(resMap, ElephantResultEnum.SUCCESS);
    }

    /**
     * 失败
     *
     * @param resMap 封装的map
     */
    public static void fail(Map resMap) {
        resultWithEnum(resMap, ElephantResultEnum.FAIL);
    }

    /**
     * 自定义错误信息
     *
     * @param resMap   map
     * @param errorMsg 错误信息
     */
    public static void failWithMsg(Map resMap, String errorMsg) {
        resMap.put(ElephantResultEnum.CODE.getCode(), ElephantResultEnum.FAIL.getCode());
        resMap.put(ElephantResultEnum.MESSAGE.getCode(), errorMsg);
    }

    /**
     * 返回指定枚举ElephantResultEnum信息
     *
     * @param resMap     map
     * @param resultEnum 封装信息
     */
    public static void resultWithEnum(Map resMap, ElephantResultEnum resultEnum) {
        resMap.put(ElephantResultEnum.CODE.getCode(), resultEnum.getCode());
        resMap.put(ElephantResultEnum.MESSAGE.getCode(), resultEnum.getMessage());
    }

    /**
     * 封装枚举OrgInfoResultEnum信息
     *
     * @param resMap     map
     * @param resultEnum 信息
     */
//    public static void resultWithEnum(Map resMap, OrgInfoResultEnum resultEnum) {
//        resMap.put(ElephantResultEnum.CODE.getCode(), resultEnum.getCode());
//        resMap.put(ElephantResultEnum.MESSAGE.getCode(), resultEnum.getMessage());
//    }

    /**
     * 封装自定义错误码和信息
     *
     * @param resMap map
     * @param code   错误码
     * @param msg    错误信息
     */
    public static void returnCodeAndMsg(Map resMap, String code, String msg) {
        resMap.put(ElephantResultEnum.CODE.getCode(), code);
        resMap.put(ElephantResultEnum.MESSAGE.getCode(), msg);
    }

    /**
     * 封装枚举的错误码
     *
     * @param resMap     map
     * @param resultEnum 错误码
     */
    public static void returnCode(Map resMap, ElephantResultEnum resultEnum) {
        resMap.put(ElephantResultEnum.CODE.getCode(), resultEnum.getCode());
    }

    /**
     * 封装错误码信息
     *
     * @param resMap
     * @param code
     */
    public static void returnCode(Map resMap, String code) {
        resMap.put(ElephantResultEnum.CODE.getCode(), code);
    }
}
