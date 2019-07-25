$(function () {
    //不是管理员时，隐藏添加按钮
    if(!sys.util.isEmpty(readerCardNo)){
        $("#goAddBtn").css("visibility","hidden");
    }
    //搜索
    search();
})

/**
 * 进入添加页面
 */
function goAdd() {
    window.location.href = ctx + "book/goAdd";
}
/**
 * 图书入库
 */
function goEnter(bookId,bookName,totalNum,hasNum) {
    $(".popBox input[name='bookId']").val(bookId);
    $(".popBox input[name='bookName']").val(bookName);
    $(".popBox input[name='totalNum']").val(totalNum);
    $(".popBox input[name='hasNum']").val(hasNum);
    validatePopBoxForm();
    $(".popBox").removeClass("layui-hide");
    var index = layer.open({
        title: '图书入库',
        area: ['550px', '380px'],
        btn: ['保存', '取消'],
        btnAlign: 'c',
        type: 1,
        content: $('.popBox'),
        yes: function () {
            if (!validatePopBoxForm().form()) {
                return;
            }
            var data = $(".popBox form").serialize2();
            sys.ajax.doAjax({
                type: 'post',
                url: ctx + "book/enter",
                data: data,
                dataType: 'json',
                success: function (result) {
                    if (result.code == 0) {
                        sysLayer.util.alert("保存成功", {
                            ok: function () {
                                layer.close(index);
                                search();
                            }
                        });
                    } else {
                        sysLayer.util.alert(result.msg);
                    }
                }
            });
        },
        end: function () {
            $(".popBox form")[0].reset();
            $(".popBox").addClass("layui-hide");
            layer.close(index);
        }
    });
}

/**
 * 校验弹出框表单【添加、修改】
 * @returns {*|jQuery}
 */
function validatePopBoxForm() {
    return $('.popBox form').validate({
        rules: {
            num: {
                required: true,
                min:1,
                digits:true
            }
        },
        messages: {
            num: {
                required: "请输入入库数量",
                min:"入库数量不能小于1",
                digits:"入库数量须为整数"
            }
        }
    })
}
/**
 * 进入详情页面
 */
function goDetail(bookId) {
    window.location.href = ctx + "book/goDetail?bookId=" + bookId;
}
/**
 * 进入编辑页面
 */
function goUpdate(bookId) {
    window.location.href = ctx + "book/goUpdate?bookId=" + bookId;
}
/**
 * 删除
 */
function del(bookId) {
    sysLayer.util.confirm('您确定要删除吗？', {
        ok: function () {
            sys.ajax.doAjax({
                type: 'post',
                url: ctx + "book/del",
                data: {"bookId": bookId},
                dataType: 'json',
                success: function (result) {
                    if (result.code == 0) {
                        search();
                    } else {
                        sysLayer.util.alert(result.msg);
                    }
                }
            });
        }
    });
}
/**
 * 分页搜索
 */
function search() {
    //分页参数
    var pagingParams = {
        url: ctx + "book/search",
        data: $("#searchForm").serializeJson(),
        callback: function (data) {
            console.log(data)
            var tr = "";
            var dataList = data.list;
            if (dataList.length > 0) {
                for (var i = 0; i < dataList.length; i++) {
                    tr += "<tr>";
                    tr += "<td class='center'>" + ((i + 1) + (data.pageNo - 1) * data.pageSize) + "</td>";
                    tr += "<td class='center'>" + dataList[i].bookName + "</td>";
                    tr += "<td class='center'><img src="+ctx+dataList[i].bookImage+"></td>";
                    tr += "<td class='center'>" + dataList[i].typeName + "</td>";
                    tr += "<td class='center'>" + dataList[i].shelfName + "</td>";
                    tr += "<td class='center'>" + dataList[i].author + "</td>";
                    tr += "<td class='center'>" + dataList[i].press + "</td>";
                    tr += "<td class='center'>" + dataList[i].isLendObj.label + "</td>";
                    if(sys.util.isEmpty(readerCardNo)){
                        tr += "<td class='center'>" +
                            /* "<a class='layui-btn layui-btn-warm layui-btn-mini' onclick='goEnter(\"" + dataList[i].id + "\",\"" + dataList[i].bookName + "\","+dataList[i].num+","+dataList[i].hasNum+")'>入库</a>" +*/
                            "<a class='layui-btn layui-btn-normal layui-btn-mini' onclick='goDetail(\"" + dataList[i].id + "\")'>查看</a>" +
                            "<a class='layui-btn layui-btn-mini' onclick='goUpdate(\"" + dataList[i].id + "\")'>编辑</a>" +
                            "<a class='layui-btn layui-btn-danger layui-btn-mini' onclick='del(\"" + dataList[i].id + "\")'>删除</a>" +
                            "</td>";
                    }else {
                        tr += "<td class='center'>" +
                            "<a class='layui-btn layui-btn-normal layui-btn-mini' onclick='goDetail(\"" + dataList[i].id + "\")'>查看</a>" +
                            "</td>";
                    }
                    tr += "</tr>";
                }

            } else {
                tr = "<td colspan='9' class='center'>暂无数据</td>";
            }
            $("#bookTable tbody").html(tr);
        }
    }
    //分页初始化
    sysPaging.init(pagingParams)
}
//绑定回车事件,实现按回车搜索
$(document).keyup(function(e) {
    if((e.keyCode || e.which)==13) {
        search();
    }
});