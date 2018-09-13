package com.freeter.modules.good.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.freeter.common.utils.PageUtils;
import com.freeter.common.utils.Query;
import com.freeter.modules.good.dao.ChannelDao;
import com.freeter.modules.good.entity.ChannelEntity;
import com.freeter.modules.good.entity.vo.ChannelVO;
import com.freeter.modules.good.service.ChannelService;


@Service("channelService")
public class ChannelServiceImpl extends ServiceImpl<ChannelDao, ChannelEntity> implements ChannelService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ChannelEntity> page = this.selectPage(
                new Query<ChannelEntity>(params).getPage(),
                new EntityWrapper<ChannelEntity>()
        );

        return new PageUtils(page);
    }
    
    @Override
	public List<ChannelVO> selectListVO( Wrapper<ChannelEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ChannelVO selectVO( Wrapper<ChannelEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}

}
