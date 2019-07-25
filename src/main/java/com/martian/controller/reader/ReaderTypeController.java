package com.martian.controller.reader;

import com.martian.common.result.JSONResult;
import com.martian.common.util.JsonUtils;
import com.martian.controller.base.BaseController;
import com.martian.dto.reader.ReaderTypeDto;
import com.martian.service.reader.IReaderTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 读者类型控制器
 */
@Controller
@RequestMapping("/reader/type")
public class ReaderTypeController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(ReaderTypeController.class);

    @Autowired
    private IReaderTypeService readerTypeService;

    /**
     * 进入读者列表页面
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        logger.debug("into reader/type/list");
        model.addAttribute("readerTypeList", readerTypeService.getReaderTypeList());
        return "reader/type/list";
    }


    /**
     * 添加读者类型
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(ReaderTypeDto readerTypeDto) {
        logger.debug("into reader/type/add readerTypeDto:{}", JsonUtils.toJSONString(readerTypeDto));
        readerTypeService.add(readerTypeDto);
        return new JSONResult();
    }


    /**
     * 修改读者类型
     *
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(ReaderTypeDto readerTypeDto) {
        logger.debug("into reader/type/update readerTypeDto:{}", JsonUtils.toJSONString(readerTypeDto));
        readerTypeService.update(readerTypeDto);
        return new JSONResult();
    }

    /**
     * 获取读者类型详情
     *
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    public Object detail(String readerTypeId) {
        logger.debug("into reader/type/detail?readerTypeId={}", readerTypeId);
        return new JSONResult(readerTypeService.selectById(readerTypeId));
    }

    /**
     * 删除读者
     *
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Object del(String readerTypeId) {
        logger.debug("into reader/type/del readerTypeId:{}", readerTypeId);
        readerTypeService.del(readerTypeId);
        return new JSONResult();
    }

}
