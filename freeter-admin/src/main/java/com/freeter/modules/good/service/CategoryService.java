package com.freeter.modules.good.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.freeter.common.utils.PageUtils;
import com.freeter.modules.good.entity.CategoryEntity;
import com.freeter.modules.good.entity.view.CategoryView;
import com.freeter.modules.good.entity.vo.CategoryVO;


/**
 * 分类表
 *
 * @author xuchen
 * @email 171998110@qq.com
 * @date 2018-05-28 17:34:00
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<CategoryVO> selectListVO(Wrapper<CategoryEntity> wrapper);
   	
   	CategoryVO selectVO(@Param("ew") Wrapper<CategoryEntity> wrapper);
   	
	List<CategoryView> selectListView(Wrapper<CategoryEntity> wrapper);
   	
   	CategoryView selectView(@Param("ew") Wrapper<CategoryEntity> wrapper);
}

