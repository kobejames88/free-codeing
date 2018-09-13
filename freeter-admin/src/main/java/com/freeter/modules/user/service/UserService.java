package com.freeter.modules.user.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.freeter.common.utils.PageUtils;
import com.freeter.modules.user.entity.UserEntity;
import com.freeter.modules.user.entity.model.UserModel;

import java.util.List;
import java.util.Map;
import com.freeter.modules.user.entity.vo.UserVO;
import org.apache.ibatis.annotations.Param;
import com.freeter.modules.user.entity.view.UserView;


/**
 * 用户表
 *
 * @author xuchen
 * @email 171998110@qq.com
 * @date 2018-06-30 13:40:24
 */
public interface UserService extends IService<UserEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<UserVO> selectListVO(Wrapper<UserEntity> wrapper);
   	
   	UserVO selectVO(@Param("ew") Wrapper<UserEntity> wrapper);
   	
   	List<UserView> selectListView(Wrapper<UserEntity> wrapper);
   	
   	UserView selectView(@Param("ew") Wrapper<UserEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<UserEntity> wrapper);

	PageUtils queryPage(Map<String, Object> params, UserModel userModel);
}

