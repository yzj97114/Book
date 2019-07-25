package com.martian.service.reader.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.martian.common.exception.BusinessAsserts;
import com.martian.common.exception.Exceptions;
import com.martian.common.util.EntityUtils;
import com.martian.common.util.JsonUtils;
import com.martian.common.util.CommonUtils;
import com.martian.dao.reader.ReaderTypeMapper;
import com.martian.dto.reader.ReaderTypeDto;
import com.martian.entity.reader.ReaderType;
import com.martian.enums.YNEnum;
import com.martian.service.reader.IReaderTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 读者类型 服务实现类
 */
@Service
public class ReaderTypeServiceImpl extends ServiceImpl<ReaderTypeMapper, ReaderType> implements IReaderTypeService {
    private static final Logger logger = LoggerFactory.getLogger(ReaderTypeServiceImpl.class);

    /**
     * 获取读者类型列表
     *
     * @return
     */
    @Override
    public List<ReaderType> getReaderTypeList() {
        ReaderType param = new ReaderType();
        param.setIsValid(YNEnum.YES);
        return super.selectList(new EntityWrapper<ReaderType>(param));
    }

    /**
     * 添加
     *
     * @param readerTypeDto
     */
    @Override
    public void add(ReaderTypeDto readerTypeDto) {
        ReaderType readerType = new ReaderType();
        BeanUtils.copyProperties(readerTypeDto, readerType);
        EntityUtils.init(readerType);
        boolean flag = super.insert(readerType);
        if (!flag) {
            logger.error("读者类型添加失败，readerType:{}", JsonUtils.toJSONString(readerType));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.ADD_FAIL);
    }

    /**
     * 修改
     *
     * @param readerTypeDto
     */
    @Override
    public void update(ReaderTypeDto readerTypeDto) {
        ReaderType readerType = new ReaderType();
        BeanUtils.copyProperties(readerTypeDto, readerType);
        EntityUtils.init(readerType);
        boolean flag = super.updateById(readerType);
        if (!flag) {
            logger.error("读者类型修改失败，bookType:{}", JsonUtils.toJSONString(readerType));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.UPDATE_FAIL);
    }

    /**
     * 删除
     *
     * @param readerTypeId
     */
    @Override
    public void del(String readerTypeId) {
        if (CommonUtils.isNotEmpty(readerTypeId)) {
            ReaderType param = new ReaderType();
            param.setId(readerTypeId);
            param.setIsValid(YNEnum.NO);
            EntityUtils.init(param);
            boolean flag = super.updateById(param);
            if (!flag) {
                logger.error("读者类型删除失败，bookType:{}", JsonUtils.toJSONString(param));
            }
            BusinessAsserts.isTrue(flag, Exceptions.System.DEL_FAIL);
        }
    }
}
