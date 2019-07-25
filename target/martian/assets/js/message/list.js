$(function () {
    //搜索
    search();
})
/**
 * 进入添加页面
 */
function goAdd() {
    window.location.href = ctx + "message/goAdd";
}
/**
 * 进入修改页面
 */
function goUpdate(messageId) {
    window.location.href = ctx + "message/goUpdate?messageId=" + messageId;
}
/**
 * 分页搜索
 */
function search() {
    //分页参数
    var pagingParams = {
        url: ctx + "message/search",
        data: $("#searchForm").serializeJson(),
        callback: function (data) {
            var tr = "";
            var dataList = data.list;
            if (dataList.length > 0) {
                for (var i = 0; i < dataList.length; i++) {
                    tr += "<tr>";
                    tr += "<td class='center'>" + ((i + 1) + (data.pageNo - 1) * data.pageSize) + "</td>";
                    tr += "<td class='center'>" + dataList[i].title + "</td>";
                    tr += "<td class='center'>" + dataList[i].createTime + "</td>";
                    tr += "<td class='center'>" +
                        "<a class='layui-btn layui-btn-warm layui-btn-mini' onclick='goUpdate(\"" + dataList[i].id + "\")'>编辑</a>" +
                        "<a class='layui-btn layui-btn-danger layui-btn-mini' onclick='del(\"" + dataList[i].id + "\")'>删除</a>" +
                        "</td>";
                    tr += "</tr>";
                }

            } else {
                tr = "<td colspan='4' class='center'>暂无数据</td>";
            }
            $("#messageTable tbody").html(tr);
        }
    }
    //分页初始化
    sysPaging.init(pagingParams)
}
/**
 * 删除
 */
function del(messageId) {
    sysLayer.util.confirm('您确定要删除吗？', {
        ok: function () {
            sys.ajax.doAjax({
                type: 'post',
                url: ctx + "message/del",
                data: {"messageId": messageId},
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
