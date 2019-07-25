package com.martian.service.book.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.martian.common.exception.BusinessAsserts;
import com.martian.common.exception.Exceptions;
import com.martian.common.util.EntityUtils;
import com.martian.common.util.JsonUtils;
import com.martian.common.util.CommonUtils;
import com.martian.dao.book.BookTypeMapper;
import com.martian.dto.book.BookTypeDto;
import com.martian.entity.book.BookType;
import com.martian.enums.YNEnum;
import com.martian.service.book.IBookTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 图书类型 服务实现类
 */
@Service
public class BookTypeServiceImpl extends ServiceImpl<BookTypeMapper, BookType> implements IBookTypeService {
    private static final Logger logger = LoggerFactory.getLogger(BookTypeServiceImpl.class);

    /**
     * 图书类型列表
     *
     * @return
     */
    @Override
    public List<BookType> getBookTypeList() {
        BookType param = new BookType();
        param.setIsValid(YNEnum.YES);
        return this.selectList(new EntityWrapper<BookType>(param));
    }

    /**
     * 添加图书类型
     *
     * @param bookTypeDto
     */
    @Override
    public void add(BookTypeDto bookTypeDto) {
        BookType bookType = new BookType();
        BeanUtils.copyProperties(bookTypeDto, bookType);
        EntityUtils.init(bookType);
        boolean flag = super.insert(bookType);
        if (!flag) {
            logger.error("图书类型添加失败，bookType:{}", JsonUtils.toJSONString(bookType));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.ADD_FAIL);
    }

    /**
     * 修改图书类型
     *
     * @param bookTypeDto
     */
    @Override
    public void update(BookTypeDto bookTypeDto) {
        BookType bookType = new BookType();
        BeanUtils.copyProperties(bookTypeDto, bookType);
        EntityUtils.init(bookType);
        boolean flag = super.updateById(bookType);
        if (!flag) {
            logger.error("图书类型修改失败，bookType:{}", JsonUtils.toJSONString(bookType));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.UPDATE_FAIL);
    }

    /**
     * 删除图书类型
     *
     * @param bookTypeId
     */
    @Override
    public void del(String bookTypeId) {
        if (CommonUtils.isNotEmpty(bookTypeId)) {
            BookType param = new BookType();
            param.setId(bookTypeId);
            param.setIsValid(YNEnum.NO);
            EntityUtils.init(param);
            boolean flag = super.updateById(param);
            if (!flag) {
                logger.error("图书类型删除失败，bookType:{}", JsonUtils.toJSONString(param));
            }
            BusinessAsserts.isTrue(flag, Exceptions.System.DEL_FAIL);
        }
    }
}
