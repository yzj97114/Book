package com.martian.service.book;

import com.baomidou.mybatisplus.service.IService;
import com.martian.dto.book.BookTypeDto;
import com.martian.entity.book.BookType;

import java.util.List;

/**
 * 图书类型 服务类
 */
public interface IBookTypeService extends IService<BookType> {

    /**
     * 图书类型列表
     *
     * @return
     */
    List<BookType> getBookTypeList();

    /**
     * 添加图书类型
     *
     * @param bookTypeDto
     */
    void add(BookTypeDto bookTypeDto);

    /**
     * 修改图书类型
     *
     * @param bookTypeDto
     */
    void update(BookTypeDto bookTypeDto);

    /**
     * 删除图书类型
     *
     * @param bookTypeId
     */
    void del(String bookTypeId);
}
