package com.martian.service.borrow.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.martian.common.exception.BusinessAsserts;
import com.martian.common.exception.Exceptions;
import com.martian.common.page.PageVo;
import com.martian.common.util.DateUtils;
import com.martian.common.util.EntityUtils;
import com.martian.common.util.JsonUtils;
import com.martian.dao.borrow.BorrowMapper;
import com.martian.dto.book.BorrowDto;
import com.martian.dto.book.BorrowSearchDto;
import com.martian.entity.book.Book;
import com.martian.entity.borrow.Borrow;
import com.martian.entity.reader.Reader;
import com.martian.enums.YNEnum;
import com.martian.service.book.IBookService;
import com.martian.service.borrow.IBorrowService;
import com.martian.service.reader.IReaderService;
import com.martian.vo.book.BorrowRecordVo;
import com.martian.vo.book.BorrowVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 借阅信息 服务实现类
 */
@Service
public class BorrowServiceImpl extends ServiceImpl<BorrowMapper, Borrow> implements IBorrowService {

    private static final Logger logger = LoggerFactory.getLogger(BorrowServiceImpl.class);

    @Autowired
    private IBookService bookService;

    @Autowired
    private IReaderService readerService;

    /**
     * 借阅图书
     *
     * @param borrowDto
     */
    @Override
    @Transactional
    public void borrowBook(BorrowDto borrowDto) {
        //校验
        BusinessAsserts.notBlank(borrowDto.getReaderId(), Exceptions.Reader.READER_ID_NULL);
        BusinessAsserts.notBlank(borrowDto.getBookId(), Exceptions.Book.BOOK_ID_NULL);
        Reader reader = readerService.selectById(borrowDto.getReaderId());
        BusinessAsserts.notNull(reader, Exceptions.Reader.READER_NOT_EXIST);
        Book book = bookService.selectById(borrowDto.getBookId());
        BusinessAsserts.notNull(book, Exceptions.Book.BOOK_NOT_EXIST);
        //已借图书数量
        int hasNum = reader.getHasNum() + 1;
        BusinessAsserts.isTrue((reader.getNum() >= hasNum), Exceptions.Reader.READER_BORROW_NUM_TOO_BIG);
        //新增借阅信息
        boolean flag = this.add(reader.getId(), book.getId(), reader.getDays());
        BusinessAsserts.isTrue(flag, Exceptions.System.SAVE_FAIL);
        //更新图书借出信息
        flag = bookService.updateLendInfo(book.getId(), YNEnum.YES);
        BusinessAsserts.isTrue(flag, Exceptions.System.SAVE_FAIL);
        //更新读者已借图书信息
        flag = readerService.updateHasNum(reader.getId(), hasNum);
        BusinessAsserts.isTrue(flag, Exceptions.System.SAVE_FAIL);
    }

    /**
     * 归还图书
     *
     * @param borrowId
     */
    @Override
    @Transactional
    public void giveBackBook(String borrowId) {
        //校验
        BusinessAsserts.notBlank(borrowId, Exceptions.Borrow.BORROW_ID_NULL);
        Borrow borrow = super.selectById(borrowId);
        BusinessAsserts.notNull(borrow, Exceptions.Borrow.BORROW_NOT_EXIST);
        Reader reader = readerService.selectById(borrow.getReaderId());
        BusinessAsserts.notNull(reader, Exceptions.Reader.READER_NOT_EXIST);
        //更新借阅记录
        Borrow borrowParam = new Borrow();
        borrowParam.setId(borrowId);
        borrowParam.setIsBack(YNEnum.YES);
        borrowParam.setBackTime(DateUtils.getDate());
        EntityUtils.init(borrowParam);
        boolean flag = super.updateById(borrowParam);
        if (!flag) {
            logger.error("归还图书失败，退还信息：{}", JsonUtils.toJSONString(borrowParam));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.SAVE_FAIL);
        //更新图书借出信息
        flag = bookService.updateLendInfo(borrow.getBookId(), YNEnum.NO);
        BusinessAsserts.isTrue(flag, Exceptions.System.SAVE_FAIL);
        //已借图书数量
        int hasNum = reader.getHasNum() - 1;
        //更新读者已借图书信息
        flag = readerService.updateHasNum(reader.getId(), hasNum);
        BusinessAsserts.isTrue(flag, Exceptions.System.SAVE_FAIL);
    }

    /**
     * 搜索借阅信息
     *
     * @param borrowSearchDto
     * @return
     */
    @Override
    public PageVo searchBorrowVoPage(BorrowSearchDto borrowSearchDto) {
        Page<BorrowVo> page = new Page<>(borrowSearchDto.getPageNo(), borrowSearchDto.getPageSize());
        page.setRecords(this.baseMapper.searchBorrowVoPage(page, borrowSearchDto));
        return new PageVo(page);
    }

    /**
     * 搜索借阅记录信息
     *
     * @param borrowSearchDto
     * @return
     */
    @Override
    public PageVo searchBorrowRecordVoPage(BorrowSearchDto borrowSearchDto) {
        Page<BorrowRecordVo> page = new Page<>(borrowSearchDto.getPageNo(), borrowSearchDto.getPageSize());
        page.setRecords(this.baseMapper.searchBorrowRecordVoPage(page, borrowSearchDto));
        return new PageVo(page);
    }

    @Override
    public void renew(String borrowId) {
        //校验
        BusinessAsserts.notBlank(borrowId, Exceptions.Borrow.BORROW_ID_NULL);
        Borrow borrow = super.selectById(borrowId);
        BusinessAsserts.notNull(borrow, Exceptions.Borrow.BORROW_NOT_EXIST);
        BusinessAsserts.isTrue(!YNEnum.YES.equals(borrow.getIsRenew()), Exceptions.Borrow.BORROW_HAS_RENEW);
        Reader reader = readerService.selectById(borrow.getReaderId());
        BusinessAsserts.notNull(reader, Exceptions.Reader.READER_NOT_EXIST);

        borrow.setBackDate(DateUtils.addDay(borrow.getBackDate(), reader.getDays()));
        borrow.setIsRenew(YNEnum.YES);
        EntityUtils.init(borrow);
        boolean flag = super.updateById(borrow);

        BusinessAsserts.isTrue(flag, Exceptions.System.SAVE_FAIL);
    }

    /**
     * 添加借阅信息
     *
     * @param readerId
     * @param bookId
     * @param days
     * @return
     */
    @Override
    public boolean add(String readerId, String bookId, int days) {
        Borrow borrow = new Borrow();
        borrow.setReaderId(readerId);
        borrow.setBookId(bookId);
        borrow.setOutDate(DateUtils.getDate());
        borrow.setBackDate(DateUtils.addDay(DateUtils.getDate(), days));
        borrow.setIsBack(YNEnum.NO);
        EntityUtils.init(borrow);
        return super.insert(borrow);
    }
}
