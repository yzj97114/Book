<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>公告列表</title>
</head>
<body>
<div class="layui-body">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>系统管理</a>
              <a><cite>公告列表</cite></a>
        </span>
        <span class="right action">
             <button class="layui-btn " type="button" onclick="goAdd()">发布公告</button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <div class="search">
            <blockquote class="layui-elem-quote">
                <form id="searchForm" class="layui-form">
                    <div class="layui-inline">
                        <label class="layui-form-label">标题：</label>
                        <div class="layui-input-inline">
                            <input class="layui-input" name="title" placeholder="请输入标题">
                        </div>
                    </div>
                    <button class="layui-btn" type="button" onclick="search()"><i class="layui-icon">
                        &#xe615;</i>搜索
                    </button>
                </form>
            </blockquote>
        </div>
        <div class="table-list">
            <table class="layui-table" id="messageTable">
                <colgroup>
                    <col width="80">
                    <col>
                    <col width="180">
                    <col width="150">
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>标题</th>
                    <th>发布时间</th>
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
    <script type="text/javascript" src="${ctx}/assets/js/message/list.js"></script>
</myJs>
</body>
</html>