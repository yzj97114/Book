<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>公告详情</title>
    <link rel="stylesheet" href="${ctx}/assets/css/common.css">
    <link rel="stylesheet" href="${ctx}/assets/layui/css/layui.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .layui-form-item .layui-input-inline{
            width: 255px;
        }
        .layui-form-label{
            width: 120px;
        }
    </style>
</head>
<body>
<div class="layui-body" style="left: 0px">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>公告管理</a>
              <a><cite>公告详情</cite></a>
        </span>
        <span class="right action">
                <button class="layui-btn" type="button" style="visibility: hidden"></button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <form id="addForm" class="layui-form myForm3">
            <div class="layui-form-item">
                <label class="layui-form-label">标题：</label>
                <input type="hidden" name="id" value="${message.id}">
                <input id="title" readonly type="text" placeholder="这里填写标题" maxlength="120" name="title" value="${message.title}" autocomplete="off" class="layui-input" style="width: 50%;display: inline-block">
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">公告内容：</label>
                <div class="layui-input-block">
                    <textarea id="content" readonly rows="10" maxlength="1000" placeholder="这里填写公告内容" name="content" class="layui-textarea" style="width: 80%">${message.content}</textarea>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>