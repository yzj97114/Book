$(function () {
    //搜索
    search();
})

/**
 * 进入添加页面
 */
function goAdd() {
    window.location.href = ctx + "reader/goAdd";
}
/**
 * 进入详情页面
 */
function goDetail(readerId) {
    window.location.href = ctx + "reader/goDetail?readerId=" + readerId;
}
/**
 * 进入编辑页面
 */
function goUpdate(readerId) {
    window.location.href = ctx + "reader/goUpdate?readerId=" + readerId;
}
/**
 * 删除
 */
function del(readerId) {
    sysLayer.util.confirm('您确定要删除吗？', {
        ok: function () {
            sys.ajax.doAjax({
                type: 'post',
                url: ctx + "reader/del",
                data: {"readerId": readerId},
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
        url: ctx + "reader/search",
        data: $("#searchForm").serializeJson(),
        callback: function (data) {
            var tr = "";
            var dataList = data.list;
            if (dataList.length > 0) {
                for (var i = 0; i < dataList.length; i++) {
                    tr += "<tr>";
                    tr += "<td class='center'>" + ((i + 1) + (data.pageNo - 1) * data.pageSize) + "</td>";
                    tr += "<td class='center'>" + dataList[i].userName + "</td>";
                    tr += "<td class='center'>" + dataList[i].name + "</td>";
                    tr += "<td class='center'>" + dataList[i].sexObj.label + "</td>";
                    tr += "<td class='center'>" + dataList[i].typeName + "</td>";
                    tr += "<td class='center'>" + dataList[i].cardNo + "</td>";
                    tr += "<td class='center'>" + dataList[i].mobile + "</td>";
                    tr += "<td class='center'>" + dataList[i].createTime + "</td>";
                    tr += "<td class='center'>" +
                        "<a class='layui-btn layui-btn-mini' onclick='goUpdate(\"" + dataList[i].id + "\")'>编辑</a>" +
                        "<a class='layui-btn layui-btn-danger layui-btn-mini' onclick='del(\"" + dataList[i].id + "\")'>删除</a>" +
                        "</td>";
                    tr += "</tr>";
                }

            } else {
                tr = "<td colspan='9' class='center'>暂无数据</td>";
            }
            $("#readerTable tbody").html(tr);
        }
    }
    //分页初始化
    sysPaging.init(pagingParams)
}