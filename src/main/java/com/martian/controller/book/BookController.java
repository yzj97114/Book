package com.martian.controller.book;

import com.martian.common.page.PageVo;
import com.martian.common.result.JSONResult;
import com.martian.common.util.JsonUtils;
import com.martian.controller.base.BaseController;
import com.martian.dto.book.BookDto;
import com.martian.dto.book.BookSearchDto;
import com.martian.service.book.IBookService;
import com.martian.service.book.IBookShelfService;
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
 * 图书控制器
 */
@Controller
@RequestMapping("/book")
public class BookController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(BookController.class);

    @Autowired
    private IBookService bookService;

    @Autowired
    private IBookTypeService bookTypeService;

    @Autowired
    private IBookShelfService bookShelfService;

    /**
     * 进入图书列表页面
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        logger.debug("into book/list");
        model.addAttribute("bookTypeList", bookTypeService.getBookTypeList());
        model.addAttribute("bookShelfList", bookShelfService.getBookShelfList());
        return "book/list";
    }

    /**
     * 搜索图书
     *
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    public Object search(BookSearchDto bookSearchDto) {
        logger.debug("into book/search bookSearchDto:{}", JsonUtils.toJSONString(bookSearchDto));
        PageVo pageVo = bookService.searchBookVoPage(bookSearchDto);
        return new JSONResult(pageVo);
    }
    /**
     * 新书推荐
     *
     * @return
     */
    @RequestMapping(value = "/newBook", method = RequestMethod.GET)
    @ResponseBody
    public Object newBook(BookSearchDto bookSearchDto) {
        logger.debug("into book/newBook bookSearchDto:{}", JsonUtils.toJSONString(bookSearchDto));
        bookSearchDto.setPageSize(3);
        PageVo pageVo = bookService.searchBookVoPage(bookSearchDto);
        return new JSONResult(pageVo);
    }

    /**
     * 进入添加图书页面
     *
     * @return
     */
    @RequestMapping(value = "/goAdd", method = RequestMethod.GET)
    public String goAdd(Model model) {
        logger.debug("into book/goAdd");
        model.addAttribute("bookTypeList", bookTypeService.getBookTypeList());
        model.addAttribute("bookShelfList", bookShelfService.getBookShelfList());
        return "book/add";
    }

    /**
     * 添加图书
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(BookDto bookDto) {
        logger.debug("into book/add bookDto:{}", JsonUtils.toJSONString(bookDto));
        bookService.add(bookDto);
        return new JSONResult();
    }

    /**
     * 进入修改图书页面
     *
     * @return
     */
    @RequestMapping(value = "/goUpdate", method = RequestMethod.GET)
    public String goUpdate(Model model, String bookId) {
        logger.debug("into book/goUpdate bookId:{}", bookId);
        model.addAttribute("bookTypeList", bookTypeService.getBookTypeList());
        model.addAttribute("bookShelfList", bookShelfService.getBookShelfList());
        model.addAttribute("book", bookService.selectById(bookId));
        return "book/update";
    }

    /**
     * 修改图书
     *
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(BookDto bookDto) {
        logger.debug("into book/update bookDto:{}", JsonUtils.toJSONString(bookDto));
        bookService.update(bookDto);
        return new JSONResult();
    }

    /**
     * 进入图书详情页面
     *
     * @return
     */
    @RequestMapping(value = "/goDetail", method = RequestMethod.GET)
    public String goDetail(Model model, String bookId) {
        logger.debug("into book/goDetail bookId:{}", bookId);
        model.addAttribute("bookTypeList", bookTypeService.getBookTypeList());
        model.addAttribute("bookShelfList", bookShelfService.getBookShelfList());
        model.addAttribute("book", bookService.selectById(bookId));
        return "book/detail";
    }

    /**
     * 删除图书
     *
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Object del(String bookId) {
        logger.debug("into book/del bookId:{}", bookId);
        bookService.del(bookId);
        return new JSONResult();
    }

}
