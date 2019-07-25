<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>图书类型</title>
</head>
<body>
<div class="layui-body">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>图书管理</a>
              <a><cite>图书类型</cite></a>
        </span>
        <span class="right action">
             <button class="layui-btn" type="button" onclick="goAdd()"><i
                     class="layui-icon">&#xe608;</i>新增类型</button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <div class="table-list">
            <table class="layui-table" id="bookTable">
                <colgroup>
                    <col width="80">
                    <col>
                    <col width="150">
                </colgroup>
                <thead>
                    <tr>
                        <th width="150">序号</th>
                        <th width="400">名称</th>
                        <th width="200">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${bookTypeList}" var="type" varStatus="i">
                        <tr>
                            <td class="center">${i.index+1}</td>
                            <td class="center">${type.name}</td>
                            <td class="center">
                                <a class='layui-btn layui-btn-mini' onclick="goUpdate('${type.id}')">编辑</a>
                                <a class='layui-btn layui-btn-danger layui-btn-mini' onclick="del('${type.id}')">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- 图书类型弹出框-->
<div class="popBox layui-hide">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><span class="tip">*</span>类型名称：</label>
                <div class="layui-input-inline">
                    <input type="hidden" name="id" autocomplete="off" class="layui-input">
                    <input type="text" name="name" autocomplete="off" class="layui-input width250">
                </div>
            </div>
        </div>
    </form>
</div>
<myJs>
    <script type="text/javascript" src="${ctx}/assets/js/book/type.js"></script>
</myJs>
</body>
</html>