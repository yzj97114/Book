$(function () {
    newBookSearch();
    search();
    messageSearch();
})


/**
 * 新书推荐
 */
function newBookSearch() {
    sys.ajax.doAjax({
        type: 'get',
        url: ctx + "book/newBook",
        dataType: 'json',
        success: function (result) {
            if (result.code == 0) {
                var tr = "";
                var dataList = result.data.list;
                if (dataList.length > 0) {
                    for (var i = 0; i < dataList.length; i++) {
                        tr += "<tr>";
                        tr += "<td class='center'>" + (i + 1) + "</td>";
                        tr += "<td class='center'>" + dataList[i].bookName + "</td>";
                        tr += "<td class='center'><img src="+ctx+dataList[i].bookImage+"></td>";
                        tr += "<td class='center'>" + dataList[i].typeName + "</td>";
                        tr += "<td class='center'>" + dataList[i].shelfName + "</td>";
                        tr += "<td class='center'>" + dataList[i].author + "</td>";
                        tr += "<td class='center'>" + dataList[i].press + "</td>";
                        tr += "<td class='center'>" + dataList[i].isLendObj.label + "</td>";
                        tr += "</tr>";
                    }

                } else {
                    tr = "<td colspan='8' class='center'>暂无数据</td>";
                }
                $("#newBookTable tbody").html(tr);
            } else {
                sysLayer.util.alert(result.msg);
            }
        }
    });
}
/**
 * 图书分页搜索
 */
function search() {
    //分页参数
    var pagingParams = {
        url: ctx + "book/search",
        data: $("#searchForm").serializeJson(),
        callback: function (data) {
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
 * 系统公告分页搜索
 */
function messageSearch() {
    //分页参数
    var pagingParams = {
        layout:[ 'prev','next'],
        pageId:"messagePageId",
        url: ctx + "message/search",
        callback: function (data) {
            var tr = "";
            var dataList = data.list;
            if (dataList.length > 0) {
                for (var i = 0; i < dataList.length; i++) {
                    tr += "<tr>";
                    tr += "<td>" + ((i + 1) + (data.pageNo - 1) * data.pageSize)+"、<a href="+ctx+"message/detail?messageId="+dataList[i].id+" target='_blank'>"+dataList[i].title+"</a></td>";
                    /*tr += "<td class='center'>" + dataList[i].createTime + "</td>";*/
                    tr += "</tr>";
                }

            } else {
                tr = "<td colspan='1' class='center'>暂无公告</td>";
            }
            $("#messageTable tbody").html(tr);
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