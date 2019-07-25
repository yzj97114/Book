package com.martian.service.book.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.martian.common.exception.BusinessAsserts;
import com.martian.common.exception.Exceptions;
import com.martian.common.util.CommonUtils;
import com.martian.common.util.EntityUtils;
import com.martian.common.util.JsonUtils;
import com.martian.dao.book.BookShelfMapper;
import com.martian.dto.book.BookShelfDto;
import com.martian.entity.book.BookShelf;
import com.martian.enums.YNEnum;
import com.martian.service.book.IBookShelfService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *  书架 服务实现类
 */
@Service
public class BookShelfServiceImpl extends ServiceImpl<BookShelfMapper, BookShelf> implements IBookShelfService {
    private static final Logger logger = LoggerFactory.getLogger(BookShelfServiceImpl.class);

    /**
     * 图书书架列表
     *
     * @return
     */
    @Override
    public List<BookShelf> getBookShelfList() {
        BookShelf param = new BookShelf();
        param.setIsValid(YNEnum.YES);
        return this.selectList(new EntityWrapper<BookShelf>(param));
    }

    /**
     * 添加图书书架
     *
     * @param bookShelfDto
     */
    @Override
    public void add(BookShelfDto bookShelfDto) {
        BookShelf bookShelf = new BookShelf();
        BeanUtils.copyProperties(bookShelfDto, bookShelf);
        EntityUtils.init(bookShelf);
        boolean flag = super.insert(bookShelf);
        if (!flag) {
            logger.error("图书书架添加失败，bookShelf:{}", JsonUtils.toJSONString(bookShelf));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.ADD_FAIL);
    }

    /**
     * 修改图书书架
     *
     * @param bookShelfDto
     */
    @Override
    public void update(BookShelfDto bookShelfDto) {
        BookShelf bookShelf = new BookShelf();
        BeanUtils.copyProperties(bookShelfDto, bookShelf);
        EntityUtils.init(bookShelf);
        boolean flag = super.updateById(bookShelf);
        if (!flag) {
            logger.error("图书书架修改失败，bookShelf:{}", JsonUtils.toJSONString(bookShelf));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.UPDATE_FAIL);
    }

    /**
     * 删除图书书架
     *
     * @param bookShelfId
     */
    @Override
    public void del(String bookShelfId) {
        if (CommonUtils.isNotEmpty(bookShelfId)) {
            BookShelf param = new BookShelf();
            param.setId(bookShelfId);
            param.setIsValid(YNEnum.NO);
            EntityUtils.init(param);
            boolean flag = super.updateById(param);
            if (!flag) {
                logger.error("图书书架删除失败，bookShelf:{}", JsonUtils.toJSONString(param));
            }
            BusinessAsserts.isTrue(flag, Exceptions.System.DEL_FAIL);
        }
    }
}
