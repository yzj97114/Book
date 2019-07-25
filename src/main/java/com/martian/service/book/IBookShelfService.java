package com.martian.service.book;

import com.baomidou.mybatisplus.service.IService;
import com.martian.dto.book.BookShelfDto;
import com.martian.entity.book.BookShelf;

import java.util.List;

/**
 *  书架 服务类
 */
public interface IBookShelfService extends IService<BookShelf> {
    /**
     * 图书书架列表
     *
     * @return
     */
    List<BookShelf> getBookShelfList();

    /**
     * 添加图书书架
     *
     * @param bookShelfDto
     */
    void add(BookShelfDto bookShelfDto);

    /**
     * 修改图书书架
     *
     * @param bookShelfDto
     */
    void update(BookShelfDto bookShelfDto);

    /**
     * 删除图书书架
     *
     * @param bookShelfId
     */
    void del(String bookShelfId);
}
