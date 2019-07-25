$(function () {
    //搜索
    search();
})

/**
 * 分页搜索
 */
function search() {
    //分页参数
    var pagingParams = {
        url: ctx + "borrow/searchReaderRecord",
        data: $("#searchForm").serializeJson(),
        callback: function (data) {
            var tr = "";
            var dataList = data.list;
            if (dataList.length > 0) {
                for (var i = 0; i < dataList.length; i++) {
                    if(sys.util.isEmpty(dataList[i].backTime)){
                        dataList[i].backTime = "";
                    }
                    tr += "<tr>";
                    tr += "<td class='center'>" + ((i + 1) + (data.pageNo - 1) * data.pageSize) + "</td>";
                    tr += "<td class='center'>" + dataList[i].bookName + "</td>";
                    tr += "<td class='center'>" + dataList[i].author + "</td>";
                    tr += "<td class='center'>" + dataList[i].press + "</td>";
                    tr += "<td class='center'>" + dataList[i].bookPrice + "</td>";
                    tr += "<td class='center'>" + dataList[i].outDate + "</td>";
                    tr += "<td class='center'>" + dataList[i].backDate + "</td>";
                    tr += "<td class='center'>" + dataList[i].isBackObj.label + "</td>";
                    tr += "<td class='center'>" + dataList[i].backTime + "</td>";
                    tr += "</tr>";
                }

            } else {
                tr = "<td colspan='11' class='center'>暂无数据</td>";
            }
            $("#bookTable tbody").html(tr);
        }
    }
    //分页初始化
    sysPaging.init(pagingParams)
}