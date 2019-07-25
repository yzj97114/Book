<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${ctx}/assets/css/common.css">
    <link rel="stylesheet" href="${ctx}/assets/layui/css/layui.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="utf-8"/>
    <title>首页</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
<div class="layui-header ">
    <div class="layui-logo" style="font-size: 22px;font-weight:bold;">图书管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right" style="margin-right: 10px">
        <li class="layui-nav-item">
            <c:if test="${empty userName}">
                <a href="${ctx}/login">
                       登录
                </a>
            </c:if>
            <c:if test="${! empty userName}">
                <a href="javascript:;">
                        ${userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/user/goUpdatePwd">修改密码</a></dd>
                    <dd><a href="${ctx}/logout">退出系统</a></dd>
                </dl>
            </c:if>
        </li>
    </ul>
</div>
<div class="layui-side" style="width: 290px;left: 2px">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a><cite>系统公告</cite></a>
        </span>
    </div>
    <div class="content">
        <div class="table-list">
            <table class="layui-table" id="messageTable" lay-skin="nob">
                <colgroup>
                    <col>
                </colgroup>
                <tbody>
                </tbody>
            </table>
           <%-- <div id="messagePageId" style="text-align: right"></div>--%>
        </div>
    </div>
</div>
<div class="layui-body" style="left: 300px;">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a><cite>新书推荐</cite></a>
        </span>

        <span class="right action">
           <button class="layui-btn" type="button" style="visibility: hidden"></button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <div class="table-list">
            <table class="layui-table" id="newBookTable">
                <colgroup>
                    <col width="60">
                    <col width="150">
                    <col width="150">
                    <col width="100">
                    <col width="100">
                    <col width="150">
                    <col width="150">
                    <col width="100">
                    <col width="180">
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>名称</th>
                    <th>图片</th>
                    <th>类型</th>
                    <th>书架</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>是否借出</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a><cite>图书查询</cite></a>
        </span>

        <span class="right action">
           <button class="layui-btn" type="button" style="visibility: hidden"></button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <div class="search">
            <blockquote class="layui-elem-quote">
                <form id="searchForm" class="layui-form">
                    <div class="layui-inline">
                        <label class="layui-form-label">名称：</label>
                        <div class="layui-input-inline">
                            <input class="layui-input" name="bookName" placeholder="图书名称">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">作者：</label>
                        <div class="layui-input-inline">
                            <input class="layui-input" name="author" placeholder="作者">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">类型：</label>
                        <div class="layui-input-inline">
                            <select name="typeId">
                                <option value="">请选择</option>
                                <c:forEach items="${bookTypeList}" var="type">
                                    <option value="${type.id}">${type.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">书架：</label>
                        <div class="layui-input-inline">
                            <select name="shelfId">
                                <option value="">请选择</option>
                                <c:forEach items="${bookShelfList}" var="shelf">
                                    <option value="${shelf.id}">${shelf.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <button class="layui-btn" type="button" onclick="search()"><i class="layui-icon">&#xe615;</i>搜索
                    </button>
                </form>
            </blockquote>
        </div>
        <div class="table-list">
            <table class="layui-table" id="bookTable">
                <colgroup>
                    <col width="60">
                    <col width="150">
                    <col width="150">
                    <col width="100">
                    <col width="100">
                    <col width="150">
                    <col width="150">
                    <col width="100">
                    <col width="180">
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>名称</th>
                    <th>图片</th>
                    <th>类型</th>
                    <th>书架</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>是否借出</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div id="pageId" style="text-align: right"></div>
        </div>
    </div>
</div>
</div>
<script src="${ctx}/assets/layui/layui.all.js" type="text/javascript"></script>
<script>
    var $ = layui.$, jQuery = layui.$;
    var ctx = '${ctx}/';
</script>
<script src="${ctx}/assets/js/global.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/assets/js/index/index.js"></script>
</body>
</html>