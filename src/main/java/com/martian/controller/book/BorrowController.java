package com.martian.controller.book;

import com.martian.common.cache.SessionCache;
import com.martian.common.page.PageVo;
import com.martian.common.result.JSONResult;
import com.martian.common.util.JsonUtils;
import com.martian.controller.base.BaseController;
import com.martian.dto.book.BorrowDto;
import com.martian.dto.book.BorrowSearchDto;
import com.martian.enums.YNEnum;
import com.martian.service.borrow.IBorrowService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 借阅控制器
 */
@Controller
@RequestMapping("/borrow")
public class BorrowController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(BorrowController.class);

    @Autowired
    private IBorrowService borrowService;

    /**
     * 进入借书页面
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        logger.debug("into borrow/list");
        return "borrow/list";
    }

    /**
     * 借阅图书
     *
     * @return
     */
    @RequestMapping(value = "/book", method = RequestMethod.POST)
    @ResponseBody
    public Object borrowBook(BorrowDto borrowDto) {
        logger.debug("into borrow/book borrowDto:{}", JsonUtils.toJSONString(borrowDto));
        borrowService.borrowBook(borrowDto);
        return new JSONResult();
    }
    /**
     * 续借图书
     *
     * @return
     */
    @RequestMapping(value = "/renew", method = RequestMethod.POST)
    @ResponseBody
    public Object renew(String borrowId) {
        logger.debug("into borrow/renew borrowId:{}",borrowId);
        borrowService.renew(borrowId);
        return new JSONResult();
    }

    /**
     * 进入借阅记录页面
     *
     * @return
     */
    @RequestMapping(value = "/record", method = RequestMethod.GET)
    public String record(Model model) {
        logger.debug("into borrow/record");
        model.addAttribute("isBack", YNEnum.values());
        return "borrow/record";
    }

    /**
     * 搜索借阅信息
     *
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    public Object search(BorrowSearchDto borrowSearchDto) {
        logger.debug("into borrow/search borrowSearchDto:{}", JsonUtils.toJSONString(borrowSearchDto));
        PageVo pageVo = borrowService.searchBorrowVoPage(borrowSearchDto);
        return new JSONResult(pageVo);
    }
    /**
     * 搜索借阅记录信息
     *
     * @return
     */
    @RequestMapping(value = "/searchRecord", method = RequestMethod.GET)
    @ResponseBody
    public Object searchRecord(BorrowSearchDto borrowSearchDto) {
        logger.debug("into borrow/searchRecord borrowSearchDto:{}", JsonUtils.toJSONString(borrowSearchDto));
        PageVo pageVo = borrowService.searchBorrowRecordVoPage(borrowSearchDto);
        return new JSONResult(pageVo);
    }
    /**
     * 搜索借阅记录信息
     *
     * @return
     */
    @RequestMapping(value = "/searchReaderRecord", method = RequestMethod.GET)
    @ResponseBody
    public Object searchReaderRecord(BorrowSearchDto borrowSearchDto, HttpServletRequest request) {
        logger.debug("into borrow/searchReaderRecord borrowSearchDto:{}", JsonUtils.toJSONString(borrowSearchDto));
        String readerId = SessionCache.getUser(request).getReaderId();
        borrowSearchDto.setReaderId(readerId);
        PageVo pageVo = borrowService.searchBorrowRecordVoPage(borrowSearchDto);
        return new JSONResult(pageVo);
    }
}
