<%@ page contentType="text/html;charset=UTF-8" session="false" language="java" %>
<%@ include file="/include/base_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>图书管理</title>
</head>
<body>
<div class="layui-body">
    <div class="breadcrumb">
        <span class="layui-breadcrumb">
              <a>图书管理</a>
              <a><cite>图书列表</cite></a>
        </span>

        <span class="right action">
            <button id="goAddBtn" class="layui-btn" type="button" onclick="goAdd()"><i class="layui-icon">&#xe608;</i>新增图书</button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <div class="search">
            <blockquote class="layui-elem-quote">
                <form id="searchForm" class="layui-form">
                    <div class="layui-inline">
                        <label class="layui-form-label">图书名称：</label>
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
                        <label class="layui-form-label">图书类型：</label>
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
<!-- 读者类型弹出框-->
<div class="popBox layui-hide">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label width120"><span class="tip">*</span>图书名称：</label>
                <div class="layui-input-inline">
                    <input type="hidden" name="bookId" autocomplete="off" class="layui-input">
                    <input type="text" name="bookName" autocomplete="off" class="layui-input width250" readonly>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label width120"><span class="tip">*</span>图书总量：</label>
                <div class="layui-input-inline">
                    <input type="number" name="totalNum"  class="layui-input width250" readonly>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label width120"><span class="tip">*</span>借出：</label>
                <div class="layui-input-inline">
                    <input type="number" name="hasNum" class="layui-input width250" readonly>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label width120"><span class="tip">*</span>入库：</label>
                <div class="layui-input-inline">
                    <input type="number" name="num" min="1" value="1" autocomplete="off" class="layui-input width250">
                </div>
            </div>
        </div>
    </form>
</div>
<myJs>
    <script type="text/javascript" src="${ctx}/assets/js/book/list.js"></script>
</myJs>
</body>
</html>