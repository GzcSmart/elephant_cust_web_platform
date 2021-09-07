package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class Result {
    private Integer code;
    private String massage;
    private Object data;
}
