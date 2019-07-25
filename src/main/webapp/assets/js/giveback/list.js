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
                    searchBorrow();
                } else {
                    //清空表格数据
                    $("#borrowTable tbody").html(null);
                    $("#pageId").html(null);
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
 * 查询图书借阅信息
 */
function searchBorrow() {
    //获取读者Id
    var readerId = $("input[name='readerId']").val();
    if (sys.util.isEmpty(readerId)) {
        layer.tips("请先查询读者信息", $("input[name='cardNo']"), {
            tipsMore: true,
            tips: [1, '#ffa51a']
        });
        return;
    }
    //分页参数
    var pagingParams = {
        url: ctx + "borrow/search",
        data: {"readerId": readerId, "isBack": 'N'},
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
                    tr += "<td class='center'>" + dataList[i].bookPrice + "</td>";
                    tr += "<td class='center'>" + dataList[i].outDate + "</td>";
                    tr += "<td class='center'>" + dataList[i].backDate + "</td>";
                    if('Y'!=dataList[i].isReNewObj.code){
                        tr += "<td class='center'>" +
                            "<a class='layui-btn layui-btn-mini' onclick='givebackBook(\"" + dataList[i].id + "\")'>还书</a>" +
                            "<a class='layui-btn layui-btn-mini' onclick='renew(\"" + dataList[i].id + "\")'>续借</a>" +
                            "</td>";
                    }else{
                        tr += "<td class='center'>" +
                            "<a class='layui-btn layui-btn-mini' onclick='givebackBook(\"" + dataList[i].id + "\")'>还书</a>" +
                            "</td>";
                    }

                    tr += "</tr>";
                }

            } else {
                tr = "<td colspan='9' class='center'>暂无数据</td>";
            }
            $("#borrowTable tbody").html(tr);
        }
    }
    //分页初始化
    sysPaging.init(pagingParams)
}
/**
 * 还书
 */
function givebackBook(borrowId) {
    sysLayer.util.confirm('确认还书？', {
        ok: function () {
            sys.ajax.doAjax({
                type: 'post',
                url: ctx + "giveback/book",
                data: {"borrowId": borrowId},
                dataType: 'json',
                success: function (result) {
                    if (result.code == 0) {
                        searchReader();
                    } else {
                        sysLayer.util.alert(result.msg);
                    }
                }
            });
        }
    });
}
/**
 * 续借
 */
function renew(borrowId) {
    sysLayer.util.confirm('确认续借？', {
        ok: function () {
            sys.ajax.doAjax({
                type: 'post',
                url: ctx + "borrow/renew",
                data: {"borrowId": borrowId},
                dataType: 'json',
                success: function (result) {
                    if (result.code == 0) {
                        searchReader();
                    } else {
                        sysLayer.util.alert(result.msg);
                    }
                }
            });
        }
    });
}
