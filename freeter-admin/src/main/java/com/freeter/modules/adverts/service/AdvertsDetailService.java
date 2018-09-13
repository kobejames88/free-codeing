package com.freeter.modules.adverts.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.freeter.common.utils.PageUtils;
import com.freeter.modules.adverts.entity.AdvertsDetailEntity;
import java.util.List;
import java.util.Map;
import com.freeter.modules.adverts.entity.vo.AdvertsDetailVO;
import org.apache.ibatis.annotations.Param;
import com.freeter.modules.adverts.entity.view.AdvertsDetailView;


/**
 * 广告位详情
 *
 * @author xuchen
 * @email 171998110@qq.com
 * @date 2018-07-11 16:44:19
 */
public interface AdvertsDetailService extends IService<AdvertsDetailEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<AdvertsDetailVO> selectListVO(Wrapper<AdvertsDetailEntity> wrapper);
   	
   	AdvertsDetailVO selectVO(@Param("ew") Wrapper<AdvertsDetailEntity> wrapper);
   	
   	List<AdvertsDetailView> selectListView(Wrapper<AdvertsDetailEntity> wrapper);
   	
   	AdvertsDetailView selectView(@Param("ew") Wrapper<AdvertsDetailEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<AdvertsDetailEntity> wrapper);
}

