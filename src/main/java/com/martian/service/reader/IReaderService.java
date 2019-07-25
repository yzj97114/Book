package com.martian.service.reader;

import com.baomidou.mybatisplus.service.IService;
import com.martian.common.page.PageVo;
import com.martian.dto.reader.ReaderDto;
import com.martian.dto.reader.ReaderSearchDto;
import com.martian.entity.reader.Reader;
import com.martian.vo.reader.ReaderVo;

/**
 * 读者信息 服务类
 */
public interface IReaderService extends IService<Reader> {

    /**
     * 添加读者
     *
     * @param readerDto
     */
    void add(ReaderDto readerDto);

    /**
     * 修改读者
     *
     * @param readerDto
     */
    void update(ReaderDto readerDto);

    /**
     * 删除读者
     *
     * @param readerId
     */
    void del(String readerId);

    /**
     * 分页搜索读者信息
     *
     * @param readerSearchDto
     * @return
     */
    PageVo searchReaderVoPage(ReaderSearchDto readerSearchDto);

    /**
     * 根据读者Id查询读者信息
     *
     * @param readerId
     * @return
     */
    ReaderVo getReaderVoById(String readerId);

    /**
     * 根据借阅证编号查询读者信息
     *
     * @param cardNo
     * @return
     */
    ReaderVo getReaderVoByCardNo(String cardNo);

    /**
     * 更新已借图书数
     *
     * @param readerId
     * @param hasNum
     * @return
     */
    boolean updateHasNum(String readerId, int hasNum);

    /**
     * 查询读者信息
     * @param userId
     * @return
     */
    Reader getReaderByUserId(String userId);
}
