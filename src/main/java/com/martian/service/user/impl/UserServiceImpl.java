package com.martian.service.user.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.martian.common.exception.BusinessAsserts;
import com.martian.common.exception.Exceptions;
import com.martian.common.util.*;
import com.martian.dao.user.UserMapper;
import com.martian.dto.user.LoginDto;
import com.martian.dto.user.UpdatePwdDto;
import com.martian.entity.reader.Reader;
import com.martian.entity.resource.Resource;
import com.martian.entity.user.User;
import com.martian.enums.YNEnum;
import com.martian.enums.resource.ResourceTypeEnum;
import com.martian.service.reader.IReaderService;
import com.martian.service.resource.IResourceService;
import com.martian.service.user.IUserService;
import com.martian.vo.user.LoginVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户表 服务实现类
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private IResourceService resourceService;

    @Autowired
    private IReaderService readerService;

    /**
     * 用户登录
     *
     * @param loginDto
     * @return
     */
    @Override
    public LoginVo login(LoginDto loginDto) {
        //基础检验
        BusinessAsserts.notNull(loginDto, Exceptions.User.USERNAME_NULL);
        BusinessAsserts.notBlank(loginDto.getUserName(), Exceptions.User.USERNAME_NULL);
        BusinessAsserts.notBlank(loginDto.getPassword(), Exceptions.User.PWD_NULL);

        //通过用户名查询用户信息
        User user = getUserByUserName(loginDto.getUserName());
        BusinessAsserts.notNull(user, Exceptions.User.USER_NOT_EXIST);
        BusinessAsserts.isTrue(YNEnum.YES.equals(user.getIsEnable()), Exceptions.User.USER_DISABLED);
        BusinessAsserts.isTrue(Md5Utils.MD5Encode(loginDto.getPassword().concat(user.getSalt())).equals(user.getPassword()), Exceptions.User.USERNAME_PWD_ERROR);

        //清除用户密码
        user.setPassword(null);

        //通过userId查询用户菜单列表
        List<Resource> menuList = resourceService.getPermissionList(user.getId(), ResourceTypeEnum.MENU);
        List<Resource> permissionList = resourceService.getPermissionList(user.getId(), null);

        //查询读者信息
        Reader reader = readerService.getReaderByUserId(user.getId());
        LoginVo loginVo = new LoginVo();
        loginVo.setUser(user);
        loginVo.setMenuList(menuList);
        loginVo.setPermissionList(permissionList);
        if (reader != null) {
            loginVo.setCardNo(reader.getCardNo());
            loginVo.setReaderId(reader.getId());
        }
        return loginVo;
    }

    /**
     * 根据用户名添加用户
     *
     * @param userName
     * @return
     */
    @Override
    public User add(String userName) {
        //用户信息
        User user = getUserByUserName(userName);
        BusinessAsserts.isNull(user, Exceptions.User.USERNAME_HAS_USED);
        String salt = RandomUtils.randomAlphanumeric(6);
        user = new User(userName, Md5Utils.MD5Encode("123456".concat(salt)), salt, YNEnum.YES);
        EntityUtils.init(user);
        boolean flag = super.insert(user);
        if (!flag) {
            logger.error("用户添加失败，user:{}", JsonUtils.toJSONString(user));
        }
        return user;
    }

    /**
     * 根据用户名查询用户信息
     *
     * @param userName
     * @return
     */
    @Override
    public User getUserByUserName(String userName) {
        if (CommonUtils.isEmpty(userName)) {
            return null;
        }
        User param = new User();
        param.setUserName(userName);
        param.setIsValid(YNEnum.YES);
        return super.selectOne(new EntityWrapper<User>(param));
    }

    /**
     * 删除用户信息
     *
     * @param userId
     */
    @Override
    public void del(String userId) {
        if (CommonUtils.isNotEmpty(userId)) {
            User param = new User();
            param.setId(userId);
            param.setIsValid(YNEnum.NO);
            EntityUtils.init(param);
            boolean flag = super.updateById(param);
            if (!flag) {
                logger.error("用户删除失败，user:{}", JsonUtils.toJSONString(param));
            }
            BusinessAsserts.isTrue(flag, Exceptions.System.DEL_FAIL);
        }
    }

    /**
     * 修改密码
     *
     * @param userId
     * @param updatePwdDto
     */
    @Override
    public void updatePwd(String userId, UpdatePwdDto updatePwdDto) {
        //校验
        BusinessAsserts.notBlank(userId, Exceptions.User.USER_ID_NULL);
        BusinessAsserts.notBlank(updatePwdDto.getNewPwd(), Exceptions.User.NEW_PWD_NOT_NULL);
        BusinessAsserts.notBlank(updatePwdDto.getReNewPwd(), Exceptions.User.RE_NEW_PWD_NOT_NULL);
        BusinessAsserts.isTrue(updatePwdDto.getNewPwd().equals(updatePwdDto.getReNewPwd()), Exceptions.User.TWO_PWD_NOT_EQUAL);
        String salt = RandomUtils.randomAlphanumeric(6);
        User userParam = new User();
        userParam.setId(userId);
        userParam.setSalt(salt);
        userParam.setPassword(Md5Utils.MD5Encode(updatePwdDto.getNewPwd().concat(salt)));
        EntityUtils.init(userId, userParam);
        boolean flag = super.updateById(userParam);
        if (!flag) {
            logger.error("修改密码失败，用户信息:{}", JsonUtils.toJSONString(userParam));
        }
        BusinessAsserts.isTrue(flag, Exceptions.System.UPDATE_FAIL);
    }
}
