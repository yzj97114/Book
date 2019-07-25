<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>借阅管理</title>
    <link rel="stylesheet" href="${ctx}/assets/css/borrow.css">
</head>
<body>
<div class="layui-body">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>借阅管理</a>
              <a><cite>图书归还</cite></a>
        </span>
        <span class="right action">
             <button class="layui-btn" type="button" style="visibility: hidden"></button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <div class="search">
            <blockquote class="layui-elem-quote">
                <div class="reader-box">
                    <span class="title">读者信息</span>
                    <div class="layui-inline">
                        <label class="layui-form-label">借阅证编号：</label>
                        <div class="layui-input-inline">
                            <input class="layui-input width250" name="cardNo" placeholder="借阅证编号">
                        </div>
                    </div>
                    <button class="layui-btn" type="button" onclick="searchReader()" style="margin-left: 10px;"><i class="layui-icon">&#xe615;</i>查询
                    </button>
                </div>
                <form id="readerInfo">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label width120">姓名：</label>
                            <div class="layui-input-inline">
                                <input type="hidden" name="readerId" class="layui-input">
                                <input type="text" name="name" class="layui-input" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label width120">性别：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sexName" class="layui-input" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label width120">读者类型：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="typeName" class="layui-input" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label width120">身份证号：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="idNo" class="layui-input" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label width120">已借数量：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="hasNum" class="layui-input" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label width120">剩余可借数量：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="surplusNum" class="layui-input" readonly>
                            </div>
                        </div>
                    </div>
                </form>
            </blockquote>
        </div>
        <div class="search">
            <blockquote class="layui-elem-quote">
                <span class="title">图书信息</span>
            </blockquote>
        </div>
        <div class="table-list">
            <table class="layui-table" id="borrowTable">
                <colgroup>
                    <col width="80">
                    <col>
                    <col width="80">
                    <col width="150">
                    <col width="200">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>名称</th>
                    <th>类型</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>图书价格</th>
                    <th>借阅时间</th>
                    <th>应还时间</th>
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
    <script type="text/javascript" src="${ctx}/assets/js/giveback/list.js"></script>
</myJs>
</body>
</html>