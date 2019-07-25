package com.martian.service.borrow;

import com.baomidou.mybatisplus.service.IService;
import com.martian.common.page.PageVo;
import com.martian.dto.book.BorrowDto;
import com.martian.dto.book.BorrowSearchDto;
import com.martian.entity.borrow.Borrow;

/**
 * 借阅信息 服务类
 */
public interface IBorrowService extends IService<Borrow> {
    /**
     * 添加借阅信息
     *
     * @param readerId 读者Id
     * @param bookId   图书Id
     * @param days     借阅天数
     * @return
     */
    boolean add(String readerId, String bookId, int days);

    /**
     * 借阅图书
     *
     * @param borrowDto
     */
    void borrowBook(BorrowDto borrowDto);

    /**
     * 归还图书
     *
     * @param borrowId
     */
    void giveBackBook(String borrowId);

    /**
     * 搜索借阅信息
     *
     * @param borrowSearchDto
     * @return
     */
    PageVo searchBorrowVoPage(BorrowSearchDto borrowSearchDto);

    /**
     * 搜索借阅记录信息
     *
     * @param borrowSearchDto
     * @return
     */
    PageVo searchBorrowRecordVoPage(BorrowSearchDto borrowSearchDto);

    /**
     * 续借图书
     *
     * @param borrowId
     */
    void renew(String borrowId);
}
