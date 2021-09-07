package com.hcm.springbootdemo.service;

import com.hcm.springbootdemo.entity.YwInfoCategory;

import java.util.List;

public interface YwInfoCategoryService {
    List<YwInfoCategory> selAllYwCategory();

    List<YwInfoCategory> selYwCategoryById(int id);
}
