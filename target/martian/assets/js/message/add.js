$(function () {
})


/**
 * 【添加】
 */
function add() {
    var title = $("#title").val();
    if (sys.util.isEmpty(title)) {
        layer.tips("请输入标题",$("#title"), {
            tipsMore: true,
            tips: [2, '#ffa51a']
        });
        return;
    }
    var content = $("#content").val();
    if (sys.util.isEmpty(content)) {
        layer.tips("请输入公告内容",$("#content"), {
            tipsMore: true,
            tips: [2, '#ffa51a']
        });
        return;
    }
    goSaveOrUpdate("#addForm", ctx + "message/list", true)
}