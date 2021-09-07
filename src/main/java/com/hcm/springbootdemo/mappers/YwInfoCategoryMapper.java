package com.hcm.springbootdemo.mappers;

import com.hcm.springbootdemo.entity.YwInfoCategory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface YwInfoCategoryMapper {
    List<YwInfoCategory> selAllYwCategory();

    List<YwInfoCategory> selYwCategoryById(@Param("id") int id);
}
