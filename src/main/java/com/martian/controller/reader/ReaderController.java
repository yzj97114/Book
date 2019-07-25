package com.martian.controller.reader;

import com.martian.common.cache.SessionCache;
import com.martian.common.page.PageVo;
import com.martian.common.result.JSONResult;
import com.martian.common.util.JsonUtils;
import com.martian.common.util.RandomUtils;
import com.martian.controller.base.BaseController;
import com.martian.dto.reader.ReaderDto;
import com.martian.dto.reader.ReaderSearchDto;
import com.martian.entity.reader.Reader;
import com.martian.enums.SexEnum;
import com.martian.enums.YNEnum;
import com.martian.service.reader.IReaderService;
import com.martian.service.reader.IReaderTypeService;
import com.martian.vo.reader.ReaderVo;
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
 * 读者控制器
 */
@Controller
@RequestMapping("/reader")
public class ReaderController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(ReaderController.class);

    @Autowired
    private IReaderService readerService;

    @Autowired
    private IReaderTypeService readerTypeService;

    /**
     * 进入读者列表页面
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        logger.debug("into reader/list");
        model.addAttribute("readerTypeList", readerTypeService.getReaderTypeList());
        return "reader/list";
    }

    /**
     * 搜索读者
     *
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    public Object search(ReaderSearchDto readerSearchDto) {
        logger.debug("into reader/search readerSearchDto:{}", JsonUtils.toJSONString(readerSearchDto));
        PageVo pageVo = readerService.searchReaderVoPage(readerSearchDto);
        return new JSONResult(pageVo);
    }

    /**
     * 进入添加读者页面
     *
     * @return
     */
    @RequestMapping(value = "/goAdd", method = RequestMethod.GET)
    public String goAdd(Model model) {
        logger.debug("into reader/goAdd");
        model.addAttribute("sexEnum", SexEnum.values());
        model.addAttribute("cardNo", RandomUtils.getRandomNumber());
        model.addAttribute("readerTypeList", readerTypeService.getReaderTypeList());
        return "reader/add";
    }

    /**
     * 添加读者
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(ReaderDto readerDto) {
        logger.debug("into reader/add readerDto:{}", JsonUtils.toJSONString(readerDto));
        readerService.add(readerDto);
        return new JSONResult();
    }

    /**
     * 进入修改读者页面
     *
     * @return
     */
    @RequestMapping(value = "/goUpdate", method = RequestMethod.GET)
    public String goUpdate(Model model, String readerId) {
        logger.debug("into reader/goUpdate readerId:{}", readerId);
        model.addAttribute("sexEnum", SexEnum.values());
        model.addAttribute("readerTypeList", readerTypeService.getReaderTypeList());
        model.addAttribute("reader", readerService.getReaderVoById(readerId));
        return "reader/update";
    }

    /**
     * 读者修改个人信息页面
     *
     * @return
     */
    @RequestMapping(value = "/goUpdatePersonInfo", method = RequestMethod.GET)
    public String goUpdatePersonInfo(Model model, HttpServletRequest request) {
        logger.debug("into reader/goUpdatePersonInfo");
        Reader reader = readerService.getReaderByUserId(SessionCache.getUser(request).getUser().getId());
        model.addAttribute("sexEnum", SexEnum.values());
        model.addAttribute("readerTypeList", readerTypeService.getReaderTypeList());
        model.addAttribute("reader", readerService.getReaderVoById(reader.getId()));
        return "reader/personInfo";
    }

    /**
     * 修改读者
     *
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(ReaderDto readerDto) {
        logger.debug("into reader/update readerDto:{}", JsonUtils.toJSONString(readerDto));
        readerService.update(readerDto);
        return new JSONResult();
    }

    /**
     * 删除读者
     *
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Object del(String readerId) {
        logger.debug("into reader/del readerId:{}", readerId);
        readerService.del(readerId);
        return new JSONResult();
    }

    /**
     * 根据借阅证编号查询读者信息
     *
     * @return
     */
    @RequestMapping(value = "/getReaderByCardNo", method = RequestMethod.GET)
    @ResponseBody
    public Object getReaderByCardNo(String cardNo) {
        logger.debug("into reader/getReaderByCardNo cardNo:{}", cardNo);
        ReaderVo readerVo = readerService.getReaderVoByCardNo(cardNo);
        return new JSONResult(readerVo);
    }

    /**
     * 进入读者借阅记录页面
     *
     * @return
     */
    @RequestMapping(value = "/borrow/record", method = RequestMethod.GET)
    public String borrowList(Model model) {
        logger.debug("into reader/borrow/record");
        model.addAttribute("isBack", YNEnum.values());
        return "borrow/reader_record";
    }
}
