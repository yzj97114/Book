package com.martian.service.book.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.martian.common.exception.BusinessAsserts;
import com.martian.common.exception.Exceptions;
import com.martian.common.page.PageVo;
import com.martian.common.util.EntityUtils;
import com.martian.common.util.JsonUtils;
import com.martian.common.util.CommonUtils;
import com.martian.common.validate.AddGroup;
import com.martian.common.validate.UpdateGroup;
import com.martian.common.validate.ValidateUtil;
import com.martian.dao.book.BookMapper;
import com.martian.dto.book.BookDto;
import com.martian.dto.book.BookSearchDto;
import com.martian.entity.book.Book;
import com.martian.enums.YNEnum;
import com.martian.service.book.IBookService;
import com.martian.vo.book.BookVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * 图书信息 服务实现类
 */
@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements IBookService {

    private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);

    /**
     * 分页搜索图书
     *
     * @param bookSearchDto
     * @return
     */
    @Override
    public PageVo searchBookVoPage(BookSearchDto bookSearchDto) {
        Page<BookVo> page = new Page<>(bookSearchDto.getPageNo(), bookSearchDto.getPageSize());
        page.setRecords(this.baseMapper.searchBookVoPage(page, bookSearchDto));
        return new PageVo(page);
    }

    /**
     * 添加图书
     *
     * @param bookDto
     */
    @Override
    public void add(BookDto bookDto) {
        //数据校验
        ValidateUtil.validateEntity(bookDto, AddGroup.class);
        //图书信息
        Book book = new Book();
        BeanUtils.copyProperties(bookDto, book);
        book.setIsLend(YNEnum.NO);
        EntityUtils.init(book);
        //添加图书
        boolean flag = super.insert(book);
        if (!flag) {
            logger.error("图书添加失败，book:{}", JsonUtils.toJSONString(book));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.ADD_FAIL);
    }

    /**
     * 修改图书
     *
     * @param bookDto
     */
    @Override
    public void update(BookDto bookDto) {
        ValidateUtil.validateEntity(bookDto, UpdateGroup.class);
        Book book = new Book();
        BeanUtils.copyProperties(bookDto, book);
        EntityUtils.init(book);
        boolean flag = super.updateById(book);
        if (!flag) {
            logger.error("图书修改失败，book:{}", JsonUtils.toJSONString(book));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.UPDATE_FAIL);
    }

    /**
     * 删除图书
     *
     * @param bookId
     */
    @Override
    public void del(String bookId) {
        if (CommonUtils.isNotEmpty(bookId)) {
            Book param = new Book();
            param.setId(bookId);
            param.setIsValid(YNEnum.NO);
            EntityUtils.init(param);
            boolean flag = super.updateById(param);
            if (!flag) {
                logger.error("图书删除失败，book:{}", JsonUtils.toJSONString(param));
            }
            BusinessAsserts.isTrue(flag, Exceptions.System.DEL_FAIL);
        }
    }

    /**
     * 图书入库
     *
     * @param bookId
     * @param num
     */
    @Override
    public void enter(String bookId, Integer num) {
        Book book = super.selectById(bookId);
        Book param = new Book();
        param.setId(bookId);
        //  param.setNum(book.getNum() + num);
        boolean flag = super.updateById(param);
        if (!flag) {
            logger.error("图书入库失败，book:{}", JsonUtils.toJSONString(param));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.SAVE_FAIL);
    }

    /**
     * 更新图书借出信息
     *
     * @param bookId
     * @param isLend
     * @return
     */
    @Override
    public boolean updateLendInfo(String bookId, YNEnum isLend) {
        Book bookParam = new Book();
        bookParam.setId(bookId);
        bookParam.setIsLend(isLend);
        EntityUtils.init(bookParam);
        return super.updateById(bookParam);
    }
}
