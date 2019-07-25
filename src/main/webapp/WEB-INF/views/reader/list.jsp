<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>读者管理</title>
</head>
<body>
<div class="layui-body">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>读者管理</a>
              <a><cite>读者列表</cite></a>
        </span>
        <span class="right action">
             <button class="layui-btn" type="button" onclick="goAdd()"><i
                     class="layui-icon">&#xe608;</i>新增读者</button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <div class="search">
            <blockquote class="layui-elem-quote">
                <form id="searchForm" class="layui-form">
                    <div class="layui-inline">
                        <label class="layui-form-label">读者名称：</label>
                        <div class="layui-input-inline">
                            <input class="layui-input" name="name" placeholder="读者名称">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">读者类型：</label>
                        <div class="layui-input-inline">
                            <select name="typeId">
                                <option value="">请选择</option>
                                <c:forEach items="${readerTypeList}" var="type">
                                    <option value="${type.id}">${type.name}</option>
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
            <table class="layui-table" id="readerTable">
                <colgroup>
                    <col width="80">
                    <col width="150">
                    <col width="80">
                    <col width="100">
                    <col width="150">
                    <col>
                    <col width="150">
                    <col width="200">
                    <col width="150">
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>用户名</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>类型</th>
                    <th>借阅证编号</th>
                    <th>手机号</th>
                    <th>添加时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div id="pageId" style="text-align: right"></div>
        </div>
    </div>
</div>
<myJs>
    <script type="text/javascript" src="${ctx}/assets/js/reader/list.js"></script>
</myJs>
</body>
</html>