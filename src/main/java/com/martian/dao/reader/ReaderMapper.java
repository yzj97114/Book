package com.martian.dao.reader;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.martian.dto.reader.ReaderSearchDto;
import com.martian.entity.reader.Reader;
import com.martian.vo.reader.ReaderVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 读者信息 Mapper 接口
 */
public interface ReaderMapper extends BaseMapper<Reader> {

    /**
     * 分页搜索读者信息
     *
     * @param page
     * @param readerSearchDto
     * @return
     */
    List<ReaderVo> searchReaderVoPage(@Param("page") Page<ReaderVo> page, @Param("readerSearchDto") ReaderSearchDto readerSearchDto);

    /**
     * 根据读者Id查询读者信息
     *
     * @param readerId
     * @return
     */
    ReaderVo getReaderVoById(@Param("readerId") String readerId);

    /**
     * 根据借阅证编号查询读者信息
     *
     * @param cardNo
     * @return
     */
    ReaderVo getReaderVoByCardNo(@Param("cardNo") String cardNo);
}