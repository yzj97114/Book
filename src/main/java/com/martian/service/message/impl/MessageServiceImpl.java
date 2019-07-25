package com.martian.service.message.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.martian.common.page.PageVo;
import com.martian.dao.message.MessageMapper;
import com.martian.dto.message.MessageSearchManageDto;
import com.martian.entity.message.Message;
import com.martian.service.message.IMessageService;
import com.martian.vo.message.MessageVo;
import org.springframework.stereotype.Service;

/**
 * 消息公告表 服务实现类
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements IMessageService {
    /**
     * 分页查询公告
     *
     * @param searchManageDto
     * @return
     */
    @Override
    public PageVo searchMessageVoPage(MessageSearchManageDto searchManageDto) {
        Page<MessageVo> page = new Page<>(searchManageDto.getPageNo(), searchManageDto.getPageSize());
        page.setRecords(this.baseMapper.searchMessageVoPage(page, searchManageDto));
        return new PageVo(page);
    }
}
