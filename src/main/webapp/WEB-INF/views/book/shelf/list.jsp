<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>图书书架</title>
</head>
<body>
<div class="layui-body">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>图书管理</a>
              <a><cite>图书书架</cite></a>
        </span>
        <span class="right action">
             <button class="layui-btn" type="button" onclick="goAdd()"><i
                     class="layui-icon">&#xe608;</i>新增书架</button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <div class="table-list">
            <table class="layui-table" id="bookTable">
                <colgroup>
                    <col width="150">
                    <col width="400">
                    <col width="200">
                </colgroup>
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>名称</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${bookShelfList}" var="shelf" varStatus="i">
                        <tr>
                            <td class="center">${i.index+1}</td>
                            <td class="center">${shelf.name}</td>
                            <td class="center">
                                <a class='layui-btn layui-btn-mini' onclick="goUpdate('${shelf.id}')">编辑</a>
                                <a class='layui-btn layui-btn-danger layui-btn-mini' onclick="del('${shelf.id}')">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- 图书书架弹出框-->
<div class="popBox layui-hide">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><span class="tip">*</span>书架名称：</label>
                <div class="layui-input-inline">
                    <input type="hidden" name="id" autocomplete="off" class="layui-input">
                    <input type="text" name="name" autocomplete="off" class="layui-input width250">
                </div>
            </div>
        </div>
    </form>
</div>
<myJs>
    <script type="text/javascript" src="${ctx}/assets/js/book/shelf.js"></script>
</myJs>
</body>
</html>