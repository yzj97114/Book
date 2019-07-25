package com.martian.controller.message;

import com.martian.common.page.PageVo;
import com.martian.common.result.JSONResult;
import com.martian.common.util.EntityUtils;
import com.martian.common.util.JsonUtils;
import com.martian.controller.base.BaseController;
import com.martian.dto.message.MessageSearchManageDto;
import com.martian.entity.message.Message;
import com.martian.service.message.IMessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 公告控制器
 */
@Controller
@RequestMapping("/message")
public class MessageController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(MessageController.class);

    @Autowired
    private IMessageService messageService;

    /**
     * 进入列表页面
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list() {
        LOGGER.debug("into message/list");
        return "message/list";
    }

    /**
     * 进入添加页面
     *
     * @return
     */
    @RequestMapping(value = "/goAdd", method = RequestMethod.GET)
    public String goAdd() {
        LOGGER.debug("into message/goAdd");
        return "message/add";
    }

    /**
     * 添加
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult add(Message message) {
        LOGGER.debug("into message/add message:{}", JsonUtils.toJSONString(message));
        EntityUtils.init(message);
        messageService.insert(message);
        return new JSONResult();
    }

    /**
     * 进入修改页面
     *
     * @return
     */
    @RequestMapping(value = "/goUpdate", method = RequestMethod.GET)
    public String goUpdate(Model model, String messageId) {
        LOGGER.debug("into message/goUpdate");
        model.addAttribute("message", messageService.selectById(messageId));
        return "message/update";
    }
    /**
     * 进入详情页面
     *
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(Model model, String messageId) {
        LOGGER.debug("into message/detail");
        model.addAttribute("message", messageService.selectById(messageId));
        return "message/detail";
    }

    /**
     * 修改
     *
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult update(Message message) {
        LOGGER.debug("into message/update");
        EntityUtils.init(message);
        messageService.updateById(message);
        return new JSONResult();
    }


    /**
     * 搜索
     *
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    public JSONResult search(MessageSearchManageDto searchManageDto) {
        LOGGER.debug("into message/search searchManageDto:{}", JsonUtils.toJSONString(searchManageDto));
        PageVo pageVo = messageService.searchMessageVoPage(searchManageDto);
        return new JSONResult(pageVo);
    }

    /**
     * 删除
     *
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Object del(String messageId) {
        LOGGER.debug("into message/del?messageId={}", messageId);
        messageService.deleteById(messageId);
        return new JSONResult();
    }
}
