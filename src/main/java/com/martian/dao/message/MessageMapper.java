package com.martian.dao.message;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.martian.dto.message.MessageSearchManageDto;
import com.martian.entity.message.Message;
import com.martian.vo.message.MessageVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 消息公告表 Mapper 接口
 */
public interface MessageMapper extends BaseMapper<Message> {

    List<MessageVo> searchMessageVoPage(@Param("page") Page<MessageVo> page, @Param("searchManageDto") MessageSearchManageDto searchManageDto);
}