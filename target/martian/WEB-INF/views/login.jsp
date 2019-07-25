<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>图书管理系统-登录</title>
    <link rel="stylesheet" href="${ctx}/assets/css/common.css">
    <link rel="stylesheet" href="${ctx}/assets/layui/css/layui.css">
    <script language="JavaScript">
        if (window != top)
            top.location.href = location.href;
    </script>
</head>
<body class="layui-bg-cyan">
<div class="layui-container login">
    <header>
        <h1>图书管理系统</h1>
    </header>
    <div class="login-box">
        <form class="layui-form">
            <div class="avatar">
                <img src="${ctx}/assets/img/admin.png" width="100px" alt="">
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" name="userName" autocomplete="off" class="layui-input width270"
                               placeholder="请输入用户名" id="username">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="password" name="password" autocomplete="off" class="layui-input width270"
                               placeholder="请输入密码" id="password">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="btn" onclick="login()"><i class="layui-icon">&#xe609;</i> 登录
                    </button>
                </div>
            </div>
            <div class="layui-form-item">
                <span id="message">注:初始密码为123456 </span>
            </div>
        </form>
    </div>
</div>
<script src="${ctx}/assets/layui/layui.all.js" type="text/javascript"></script>
<script>
    var $ = layui.$, jQuery = layui.$;
    var ctx = '${ctx}/';
</script>
<script src="${ctx}/assets/js/global.js" type="text/javascript"></script>
<script src="${ctx}/assets/js/user/login.js" type="text/javascript"></script>
</body>
</html>