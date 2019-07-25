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
              <a><cite>编辑图书</cite></a>
        </span>
        <span class="right action">
             <button class="layui-btn" type="button" onclick="javascript:history.go(-1)"><i
                     class="layui-icon">&#xe65c;</i>返回</button>
        </span>
    </div>

    <!-- 内容主体区域 -->
    <div class="content">
        <form id="updateForm" action="${ctx}/book/update" class="layui-form myForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>图书名称：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="hidden" name="id" value="${book.id}">
                        <input class="layui-input" name="bookName" placeholder="图书名称" value="${book.bookName}">
                        <input type="hidden" name="bookImage" value="${book.bookImage}">
                    </div>
                    <div class="layui-input-inline">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="uploadImageBtn">上传图片</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item" id="imageDiv">
                <div class="layui-inline">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="uploadImage" style="width: 100px;" src="${ctx}/${book.bookImage}">
                            <p id="demoText"></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>类型：</label>
                    <div class="layui-input-inline">
                        <select name="typeId">
                            <%--   <option value="">请选择</option>--%>
                            <c:forEach items="${bookTypeList}" var="type">
                                <option value="${type.id}" <c:if test="${book.typeId==type.id}">selected</c:if>>${type.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>类型：</label>
                    <div class="layui-input-inline">
                        <select name="shelfId">
                            <%--   <option value="">请选择</option>--%>
                            <c:forEach items="${bookShelfList}" var="shelf">
                                <option value="${shelf.id}" <c:if test="${book.shelfId==shelf.id}">selected</c:if>>${shelf.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>作者：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="author" placeholder="作者" value="${book.author}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">译者：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="translator" placeholder="译者" value="${book.translator}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>图书价格：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" type="number" min="0" name="bookPrice" value="${book.bookPrice}"
                               placeholder="图书价格">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">国际标准书号（ISBN）：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" name="isbn" placeholder="国际书标号（ISBN）" value="${book.isbn}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><span class="tip">*</span>出版社：</label>
                    <div class="layui-input-inline">
                        <input class="layui-input width250" name="press" placeholder="出版社" value="${book.press}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <button class="layui-btn" type="button" onclick="update()">保存</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<myJs>
    <script type="text/javascript" src="${ctx}/assets/js/book/update.js"></script>
    <script>
        //普通图片上传
        var uploadInst = layui.upload.render({
            elem: '#uploadImageBtn'
            ,url: '${ctx}/upload?module=book&fileType=image'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#uploadImage').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                console.log(res)
                if(res.code==0){
                    $("input[name='bookImage']").val(res.data.imageName);
                }else {
                    sysLayer.util.alert('图片上传失败');
                    return ;
                }
                //如果上传失败
                /*  if(res.code > 0){
                 return layer.msg('上传失败');
                 }*/
                //上传成功
            }
            ,error: function(){
            }
        });
    </script>
</myJs>
</body>
</html>