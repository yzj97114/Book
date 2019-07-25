package com.martian.service.message;

import com.baomidou.mybatisplus.service.IService;
import com.martian.common.page.PageVo;
import com.martian.dto.message.MessageSearchManageDto;
import com.martian.entity.message.Message;

/**
 * 消息公告表 服务类
 */
public interface IMessageService extends IService<Message> {
    /**
     * 分页查询公告
     *
     * @param searchManageDto
     * @return
     */
    PageVo searchMessageVoPage(MessageSearchManageDto searchManageDto);
}
