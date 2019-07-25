<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>发布公告</title>
    <link rel="stylesheet" href="${ctx}/assets/js/ztree/css/metroStyle/metroStyle.css">
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
<div class="layui-body">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>公告管理</a>
              <a><cite>发布公告</cite></a>
        </span>
        <span class="right action">
                <button class="layui-btn" type="button" style="visibility: hidden"></button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <form id="addForm" action="${ctx}/message/add" class="layui-form myForm3">
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="tip">*</span>标题：</label>
                    <input id="title" type="text" placeholder="这里填写标题" maxlength="120" name="title" autocomplete="off" class="layui-input" style="width: 50%">
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="tip">*</span>公告内容：</label>
                    <div class="layui-input-block">
                        <textarea id="content"  rows="10" maxlength="1000" placeholder="这里填写公告内容" name="content" class="layui-textarea" style="width: 80%"></textarea>
                    </div>
                </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <button class="layui-btn" type="button" onclick="add()">发布</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<myJs>
    <script type="text/javascript" src="${ctx}/assets/js/message/add.js"></script>
</myJs>
</body>
</html>