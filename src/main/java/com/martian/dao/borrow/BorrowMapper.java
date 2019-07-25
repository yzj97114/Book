package com.martian.dao.borrow;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.martian.dto.book.BorrowSearchDto;
import com.martian.entity.borrow.Borrow;
import com.martian.vo.book.BorrowRecordVo;
import com.martian.vo.book.BorrowVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 借阅信息 Mapper 接口
 */
public interface BorrowMapper extends BaseMapper<Borrow> {
    /**
     * 搜索借阅信息
     */
    List<BorrowVo> searchBorrowVoPage(@Param("page") Page<BorrowVo> page, @Param("borrowSearchDto") BorrowSearchDto borrowSearchDto);

    /**
     * 搜索借阅记录信息
     *
     * @param page
     * @param borrowSearchDto
     * @return
     */
    List<BorrowRecordVo> searchBorrowRecordVoPage(@Param("page") Page<BorrowRecordVo> page, @Param("borrowSearchDto") BorrowSearchDto borrowSearchDto);
}