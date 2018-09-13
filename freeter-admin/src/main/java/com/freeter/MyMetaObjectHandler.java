package com.freeter;

import java.util.Date;

import org.apache.ibatis.reflection.MetaObject;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
import com.freeter.modules.sys.entity.SysUserEntity;
import com.freeter.modules.sys.shiro.ShiroUtils;

//@Component
public class MyMetaObjectHandler extends MetaObjectHandler {

	    protected final static Logger logger = LoggerFactory.getLogger(AdminApplication.class);

	    @Override
	    public void insertFill(MetaObject metaObject) {
   	        logger.info("新增的时候干点不可描述的事情");
	        setFieldValByName("createTime", new Date(), metaObject);
	        setFieldValByName("createBy", ShiroUtils.getUserEntity().getUsername(), metaObject);
	    }

	    @Override
	    public void updateFill(MetaObject metaObject) {
	        logger.info("更新的时候干点不可描述的事情");
	        setFieldValByName("updateTime", new Date(), metaObject);
	        setFieldValByName("updateBy", ShiroUtils.getUserEntity().getUsername(), metaObject);
	    }

}
