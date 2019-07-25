package com.martian.dao.book;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.martian.dto.book.BookSearchDto;
import com.martian.entity.book.Book;
import com.martian.vo.book.BookVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 图书信息 Mapper 接口
 */
public interface BookMapper extends BaseMapper<Book> {

    /**
     * 分页搜索图书
     *
     * @param page
     * @param bookSearchDto
     * @return
     */
    List<BookVo> searchBookVoPage(@Param("page") Page<BookVo> page, @Param("bookSearchDto") BookSearchDto bookSearchDto);
}