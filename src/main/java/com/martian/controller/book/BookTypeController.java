package com.martian.controller.book;

import com.martian.common.result.JSONResult;
import com.martian.common.util.JsonUtils;
import com.martian.controller.base.BaseController;
import com.martian.dto.book.BookTypeDto;
import com.martian.service.book.IBookTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 图书类型控制器
 */
@Controller
@RequestMapping("/book/type")
public class BookTypeController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(BookTypeController.class);

    @Autowired
    private IBookTypeService bookTypeService;

    /**
     * 进入图书列表页面
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        logger.debug("into book/type/list");
        model.addAttribute("bookTypeList", bookTypeService.getBookTypeList());
        return "book/type/list";
    }


    /**
     * 添加图书类型
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(BookTypeDto bookTypeDto) {
        logger.debug("into book/type/add bookTypeDto:{}", JsonUtils.toJSONString(bookTypeDto));
        bookTypeService.add(bookTypeDto);
        return new JSONResult();
    }


    /**
     * 修改图书类型
     *
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(BookTypeDto bookTypeDto) {
        logger.debug("into book/type/update bookTypeDto:{}", JsonUtils.toJSONString(bookTypeDto));
        bookTypeService.update(bookTypeDto);
        return new JSONResult();
    }

    /**
     * 获取图书类型详情
     *
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    public Object detail(String bookTypeId) {
        logger.debug("into book/type/detail?bookTypeId={}", bookTypeId);
        return new JSONResult(bookTypeService.selectById(bookTypeId));
    }

    /**
     * 删除图书
     *
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Object del(String bookTypeId) {
        logger.debug("into book/type/del bookTypeId:{}", bookTypeId);
        bookTypeService.del(bookTypeId);
        return new JSONResult();
    }

}
