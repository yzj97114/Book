package com.martian.common.cache;

import com.martian.vo.user.LoginVo;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.ConcurrentHashMap;

/**
 * session缓存
 */

public final class SessionCache {

    private static ConcurrentHashMap<String, LoginVo> CACHE_MAP;

    private static ConcurrentHashMap<String, LoginVo> getCacheMap() {
        if (CACHE_MAP == null) CACHE_MAP = new ConcurrentHashMap<>();
        return CACHE_MAP;
    }

    public static void setUser(HttpServletRequest request, LoginVo loginVo) {
        String sessionId = request.getSession().getId();
        getCacheMap().put(sessionId, loginVo);
    }

    public static LoginVo getUser(HttpServletRequest request) {
        String sessionId = request.getSession().getId();
        return getCacheMap().get(sessionId);
    }

    public static void removeUser(HttpServletRequest request) {
        String sessionId = request.getSession().getId();
        getCacheMap().remove(sessionId);
    }

    /**
     * 获取读者借阅证编号，管理员为空
     */
    public static String getReaderCardNo(HttpServletRequest request) {
        LoginVo loginVo = getUser(request);
        if (loginVo != null) {
            return loginVo.getCardNo();
        }
        return null;
    }

    public static String getUserName(HttpServletRequest request) {
        LoginVo loginVo = getUser(request);
        if (loginVo != null) {
            if (loginVo.getUser() != null) {
                return loginVo.getUser().getUserName();
            }
        }
        return null;
    }
}
