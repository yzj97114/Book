package com.martian.controller.book;

import com.martian.common.result.JSONResult;
import com.martian.controller.base.BaseController;
import com.martian.service.borrow.IBorrowService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 还书控制器
 */
@Controller
@RequestMapping("/giveback")
public class GiveBackController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(GiveBackController.class);

    @Autowired
    private IBorrowService borrowService;

    /**
     * 进入还书页面
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        logger.debug("into giveback/list");
        return "giveback/list";
    }

    /**
     * 归还图书
     *
     * @return
     */
    @RequestMapping(value = "/book", method = RequestMethod.POST)
    @ResponseBody
    public Object giveBackBook(String borrowId) {
        logger.debug("into giveback/book borrowId:{}",borrowId);
        borrowService.giveBackBook(borrowId);
        return new JSONResult();
    }
}
