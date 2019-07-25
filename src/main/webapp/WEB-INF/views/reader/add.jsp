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
              <a><cite>新增读者</cite></a>
        </span>
        <span class="right action">
             <button class="layui-btn" type="button" onclick="javascript:history.go(-1)"><i class="layui-icon">&#xe65c;</i>返回</button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <form id="addForm" action="${ctx}/reader/add" class="layui-form myForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>用户名：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="userName" placeholder="用户名">
                    </div>
                </div>
            </div>
           <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>借阅证编号：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="cardNo" placeholder="借阅证编号" value="${cardNo}">
                    </div>
                    <div class="layui-form-mid layui-word-aux">借阅证编号由系统自动生成</div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>类型：</label>
                    <div class="layui-input-inline">
                        <select name="typeId">
                            <c:forEach items="${readerTypeList}" var="type">
                                <option value="${type.id}">${type.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>读者名称：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="name" placeholder="读者名称">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-block">
                    <c:forEach items="${sexEnum}" var="sex" varStatus="i">
                        <input type="radio" name="sex" value="${sex.getCode()}" title="${sex.getLabel()}" <c:if test="${i.index==0}"> checked=""</c:if>>
                    </c:forEach>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>手机号：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="mobile" maxlength="11" placeholder="手机号">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>身份证号：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="idNo" placeholder="身份证号">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">邮箱：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="text" name="email" placeholder="邮箱">
                    </div>
                </div>
            </div>
           <%-- <div class="layui-form-item layui-form-text">
                <div class="layui-inline">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-inline" style="width: 450px;">
                        <textarea placeholder="请输入备注信息" class="layui-textarea"></textarea>
                    </div>
                </div>
            </div>--%>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <button class="layui-btn" type="button" onclick="add()">保存</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<myJs>
    <script type="text/javascript" src="${ctx}/assets/js/reader/add.js"></script>
</myJs>
</body>
</html>