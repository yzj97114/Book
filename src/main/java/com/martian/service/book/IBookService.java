package com.martian.service.book;

import com.baomidou.mybatisplus.service.IService;
import com.martian.common.page.PageVo;
import com.martian.dto.book.BookDto;
import com.martian.dto.book.BookSearchDto;
import com.martian.entity.book.Book;
import com.martian.enums.YNEnum;

/**
 * 图书信息 服务类
 */
public interface IBookService extends IService<Book> {
    /**
     * 分页搜索图书
     *
     * @param bookSearchDto
     * @return
     */
    PageVo searchBookVoPage(BookSearchDto bookSearchDto);

    /**
     * 添加图书
     *
     * @param bookDto
     */
    void add(BookDto bookDto);

    /**
     * 修改图书
     *
     * @param bookDto
     */
    void update(BookDto bookDto);

    /**
     * 删除图书
     *
     * @param bookId
     */
    void del(String bookId);

    /**
     * 图书入库
     *
     * @param bookId
     * @param num
     */
    void enter(String bookId, Integer num);

    /**
     * 更新图书借出信息
     *
     * @param bookId
     * @param isLend
     * @return
     */
    boolean updateLendInfo(String bookId, YNEnum isLend);
}
