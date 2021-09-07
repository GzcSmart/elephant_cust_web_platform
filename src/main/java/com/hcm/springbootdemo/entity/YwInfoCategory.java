package com.hcm.springbootdemo.entity;

import lombok.Data;

@Data
public class YwInfoCategory {
    private Integer id;
    private String categoryName;
    private String parentId;
    private String isParent;
}
