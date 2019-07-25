package com.martian.service.reader.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.martian.common.exception.BusinessAsserts;
import com.martian.common.exception.Exceptions;
import com.martian.common.page.PageVo;
import com.martian.common.util.CommonUtils;
import com.martian.common.util.EntityUtils;
import com.martian.common.util.JsonUtils;
import com.martian.common.validate.AddGroup;
import com.martian.common.validate.UpdateGroup;
import com.martian.common.validate.ValidateUtil;
import com.martian.dao.reader.ReaderMapper;
import com.martian.dto.reader.ReaderDto;
import com.martian.dto.reader.ReaderSearchDto;
import com.martian.entity.reader.Reader;
import com.martian.entity.reader.ReaderType;
import com.martian.entity.user.User;
import com.martian.enums.YNEnum;
import com.martian.service.reader.IReaderService;
import com.martian.service.reader.IReaderTypeService;
import com.martian.service.user.IUserRoleService;
import com.martian.service.user.IUserService;
import com.martian.vo.reader.ReaderVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 读者信息 服务实现类
 */
@Service
public class ReaderServiceImpl extends ServiceImpl<ReaderMapper, Reader> implements IReaderService {
    private static final Logger logger = LoggerFactory.getLogger(ReaderServiceImpl.class);
    @Autowired
    private IUserService userService;

    @Autowired
    private IUserRoleService userRoleService;

    @Autowired
    private IReaderTypeService readerTypeService;

    /**
     * 添加读者
     *
     * @param readerDto
     */
    @Override
    @Transactional
    public void add(ReaderDto readerDto) {
        //校验
        ValidateUtil.validateEntity(readerDto, AddGroup.class);
        //添加用户
        User user = userService.add(readerDto.getUserName());
        //添加读者角色
        userRoleService.addUserRole(user.getId());
        //读者信息
        Reader reader = new Reader();
        BeanUtils.copyProperties(readerDto, reader);
        reader.setUserId(user.getId());
        //读者类型
        ReaderType readerType = readerTypeService.selectById(readerDto.getTypeId());
        reader.setDays(readerType.getDays());
        reader.setNum(readerType.getNum());
        reader.setHasNum(0);
        EntityUtils.init(reader);
        boolean flag = super.insert(reader);
        if (!flag) {
            logger.error("读者信息添加失败，reader:{}", JsonUtils.toJSONString(reader));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.ADD_FAIL);
    }

    /**
     * 修改读者
     *
     * @param readerDto
     */
    @Override
    public void update(ReaderDto readerDto) {
        //校验
        ValidateUtil.validateEntity(readerDto, UpdateGroup.class);
        //读者信息
        Reader reader = new Reader();
        BeanUtils.copyProperties(readerDto, reader);
        //读者类型
        ReaderType readerType = readerTypeService.selectById(readerDto.getTypeId());
        reader.setDays(readerType.getDays());
        reader.setNum(readerType.getNum());
        EntityUtils.init(reader);
        boolean flag = super.updateById(reader);
        if (!flag) {
            logger.error("读者信息修改失败，reader:{}", JsonUtils.toJSONString(reader));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.UPDATE_FAIL);
    }

    /**
     * 删除读者
     *
     * @param readerId
     */
    @Override
    @Transactional
    public void del(String readerId) {
        if (CommonUtils.isNotEmpty(readerId)) {
            //删除读者信息
            Reader reader = super.selectById(readerId);
            if (CommonUtils.isEmpty(reader)) {
                return;
            }
            Reader param = new Reader();
            param.setId(readerId);
            param.setIsValid(YNEnum.NO);
            EntityUtils.init(param);
            boolean flag = super.updateById(param);
            if (!flag) {
                logger.error("读者删除失败，reader:{}", JsonUtils.toJSONString(param));
            }
            BusinessAsserts.isTrue(flag, Exceptions.System.DEL_FAIL);
            //删除用户信息
            userService.del(reader.getUserId());
        }
    }

    /**
     * 分页搜索读者信息
     *
     * @param readerSearchDto
     * @return
     */
    @Override
    public PageVo searchReaderVoPage(ReaderSearchDto readerSearchDto) {
        Page<ReaderVo> page = new Page<>(readerSearchDto.getPageNo(), readerSearchDto.getPageSize());
        page.setRecords(this.baseMapper.searchReaderVoPage(page, readerSearchDto));
        return new PageVo(page);
    }

    /**
     * 根据读者Id查询读者信息
     *
     * @param readerId
     * @return
     */
    @Override
    public ReaderVo getReaderVoById(String readerId) {
        return this.baseMapper.getReaderVoById(readerId);
    }

    /**
     * 根据借阅证编号查询读者信息
     *
     * @param cardNo
     * @return
     */
    @Override
    public ReaderVo getReaderVoByCardNo(String cardNo) {
        if (CommonUtils.isNotEmpty(cardNo)) {
            return this.baseMapper.getReaderVoByCardNo(cardNo);
        }
        return null;
    }

    /**
     * 更新已借图书数
     *
     * @param readerId
     * @param hasNum
     * @return
     */
    @Override
    public boolean updateHasNum(String readerId, int hasNum) {
        Reader readerParam = new Reader();
        readerParam.setId(readerId);
        readerParam.setHasNum(hasNum);
        EntityUtils.init(readerParam);
        return super.updateById(readerParam);
    }

    /**
     * 查询读者信息
     *
     * @param userId
     * @return
     */
    @Override
    public Reader getReaderByUserId(String userId) {
        Reader readerParam = new Reader();
        readerParam.setUserId(userId);
        readerParam.setIsValid(YNEnum.YES);
        return super.selectOne(new EntityWrapper<Reader>(readerParam));
    }
}
