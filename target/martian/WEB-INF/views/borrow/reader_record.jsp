<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>借阅管理</title>
</head>
<body>
<div class="layui-body">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>借阅管理</a>
              <a><cite>借阅记录</cite></a>
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
                        <label class="layui-form-label">是否归还：</label>
                        <div class="layui-input-inline">
                            <select name="isBack">
                                <option value="">请选择</option>
                                <c:forEach items="${isBack}" var="b">
                                    <option value="${b.getCode()}">${b.getLabel()}</option>
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
                    <col>
                    <col width="100">
                    <col width="150">
                    <col width="90">
                    <col width="100">
                    <col width="100">
                    <col width="90">
                    <col width="180">
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>名称</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>图书价格</th>
                    <th>借阅时间</th>
                    <th>应还时间</th>
                    <th>是否归还</th>
                    <th>归还时间</th>
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
    <script type="text/javascript" src="${ctx}/assets/js/borrow/reader_record.js"></script>
</myJs>
</body>
</html>