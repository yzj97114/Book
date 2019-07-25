$(function () {
    //读者登录时，查询读者信息
    if(!sys.util.isEmpty(readerCardNo)){
        $("input[name='cardNo']").val(readerCardNo);
        $("input[name='cardNo']").attr("readonly","readonly");
        searchReader();
    }
})
/**
 * 查询读者信息
 */
function searchReader() {
    //清空数据
    $("#readerInfo")[0].reset();
    //获取借阅证编号
    var cardNo = $("input[name='cardNo']").val();
    if (sys.util.isEmpty(cardNo)) {
        layer.tips("请输入借阅证编号", $("input[name='cardNo']"), {
            tipsMore: true,
            tips: [1, '#ffa51a']
        });
        return;
    }
    //根据借阅证编号查询读者信息
    sys.ajax.doAjax({
        type: 'GET',
        url: ctx + "reader/getReaderByCardNo?cardNo=" + cardNo,
        dataType: 'json',
        success: function (result) {
            if (result.code == 0) {
                if (result.data) {
                    $("input[name='readerId']").val(result.data.id);
                    $("input[name='name']").val(result.data.name);
                    $("input[name='sexName']").val(result.data.sexObj.label);
                    $("input[name='typeName']").val(result.data.typeName);
                    $("input[name='idNo']").val(result.data.idNo);
                    $("input[name='hasNum']").val(result.data.hasNum);
                    $("input[name='surplusNum']").val((result.data.num - result.data.hasNum));
                } else {
                    layer.tips("查询不到读者信息，请输入正确的借阅证编号", $("input[name='cardNo']"), {
                        tipsMore: true,
                        tips: [1, '#ffa51a']
                    });
                    //layer.msg("读者不存在，请输入正确的读者编号", {icon: 5, offset: '30%'});
                }
            } else {
                sysLayer.util.alert(result.msg);
            }
        }
    });
}
/**
 * 查询图书信息
 */
function searchBook() {
    //获取读者Id
    var readerId = $("input[name='readerId']").val();
    if (sys.util.isEmpty(readerId)) {
        layer.tips("请先查询读者信息", $("input[name='cardNo']"), {
            tipsMore: true,
            tips: [1, '#ffa51a']
        });
        return;
    }
    //获取图书名称
    var bookName = $("input[name='bookName']").val();
    if (sys.util.isEmpty(bookName)) {
        layer.tips("请输入图书名称", $("input[name='bookName']"), {
            tipsMore: true,
            tips: [1, '#ffa51a']
        });
        return;
    }
    //分页参数
    var pagingParams = {
        url: ctx + "book/search",
        data: {"bookName": bookName, "isLend": 'N'},
        callback: function (data) {
            var tr = "";
            var dataList = data.list;
            if (dataList.length > 0) {
                for (var i = 0; i < dataList.length; i++) {
                    tr += "<tr>";
                    tr += "<td class='center'>" + ((i + 1) + (data.pageNo - 1) * data.pageSize) + "</td>";
                    tr += "<td class='center'>" + dataList[i].bookName + "</td>";
                    tr += "<td class='center'>" + dataList[i].typeName + "</td>";
                    tr += "<td class='center'>" + dataList[i].author + "</td>";
                    tr += "<td class='center'>" + dataList[i].press + "</td>";
                    tr += "<td class='center'>" + dataList[i].isbn + "</td>";
                    tr += "<td class='center'>" + dataList[i].bookPrice + "</td>";
                    tr += "<td class='center'>" +
                        "<a class='layui-btn layui-btn-mini' onclick='borrowBook(\"" + dataList[i].id + "\")'>完成借阅</a>" +
                        "</td>";
                    tr += "</tr>";
                }

            } else {
                tr = "<td colspan='8' class='center'>暂无数据</td>";
            }
            $("#bookTable tbody").html(tr);
        }
    }
    //分页初始化
    sysPaging.init(pagingParams)
}
/**
 * 完成借阅
 */
function borrowBook(bookId) {
    if (sys.util.isEmpty(bookId)) {
        layer.tips("请输入图书名称,查询图书信息", $("input[name='bookName']"), {
            tipsMore: true,
            tips: [1, '#ffa51a']
        });
        return;
    }
    //获取读者Id
    var readerId = $("input[name='readerId']").val();
    if (sys.util.isEmpty(readerId)) {
        layer.tips("请输入借阅证编号,查询读者信息", $("input[name='cardNo']"), {
            tipsMore: true,
            tips: [1, '#ffa51a']
        });
        return;
    }
    sys.ajax.doAjax({
        type: 'post',
        url: ctx + "borrow/book",
        data: {"readerId": readerId, "bookId": bookId},
        dataType: 'json',
        success: function (result) {
            if (result.code == 0) {
                sysLayer.util.alert("借阅成功", {
                    ok: function () {
                        searchReader();
                        searchBook();
                    }
                });
            } else {
                sysLayer.util.alert(result.msg);
            }
        }
    });
}
