package com.martian.service.reader;

import com.baomidou.mybatisplus.service.IService;
import com.martian.dto.reader.ReaderTypeDto;
import com.martian.entity.reader.ReaderType;

import java.util.List;

/**
 * 读者类型 服务类
 */
public interface IReaderTypeService extends IService<ReaderType> {

    /**
     * 获取读者类型列表
     *
     * @return
     */
    List<ReaderType> getReaderTypeList();

    /**
     * 添加
     *
     * @param readerTypeDto
     */
    void add(ReaderTypeDto readerTypeDto);

    /**
     * 修改
     *
     * @param readerTypeDto
     */
    void update(ReaderTypeDto readerTypeDto);

    /**
     * 删除
     *
     * @param readerTypeId
     */
    void del(String readerTypeId);
}
