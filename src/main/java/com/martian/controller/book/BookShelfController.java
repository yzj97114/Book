package com.martian.controller.book;

import com.martian.common.result.JSONResult;
import com.martian.common.util.JsonUtils;
import com.martian.controller.base.BaseController;
import com.martian.dto.book.BookShelfDto;
import com.martian.service.book.IBookShelfService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 图书书架控制器
 */
@Controller
@RequestMapping("/book/shelf")
public class BookShelfController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(BookShelfController.class);

    @Autowired
    private IBookShelfService bookShelfService;

    /**
     * 进入图书列表页面
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        logger.debug("into book/shelf/list");
        model.addAttribute("bookShelfList", bookShelfService.getBookShelfList());
        return "book/shelf/list";
    }


    /**
     * 添加图书书架
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(BookShelfDto bookShelfDto) {
        logger.debug("into book/shelf/add bookShelfDto:{}", JsonUtils.toJSONString(bookShelfDto));
        bookShelfService.add(bookShelfDto);
        return new JSONResult();
    }


    /**
     * 修改图书书架
     *
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(BookShelfDto bookShelfDto) {
        logger.debug("into book/shelf/update bookShelfDto:{}", JsonUtils.toJSONString(bookShelfDto));
        bookShelfService.update(bookShelfDto);
        return new JSONResult();
    }

    /**
     * 获取图书书架详情
     *
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    public Object detail(String bookShelfId) {
        logger.debug("into book/shelf/detail?bookShelfId={}", bookShelfId);
        return new JSONResult(bookShelfService.selectById(bookShelfId));
    }

    /**
     * 删除图书
     *
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Object del(String bookShelfId) {
        logger.debug("into book/shelf/del bookShelfId:{}", bookShelfId);
        bookShelfService.del(bookShelfId);
        return new JSONResult();
    }

}
