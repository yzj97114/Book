$(function () {
})

/**
 * 进入添加页面
 */
function goAdd() {
    popBox();
}

/**
 * 进入修改页面
 */
function goUpdate(id) {
    sys.ajax.doAjax({
        type: 'get',
        url: ctx + "book/shelf/detail?bookShelfId=" + id,
        async: false,//同步
        dataType: 'json',
        success: function (result) {
            if (result.code == 0) {
                $(".popBox input[name='name']").val(result.data.name);
                popBox(id);
            } else {
                sysLayer.util.alert(result.msg);
            }
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
            name: {
                required: true,
                maxlength: 10
            }
        },
        messages: {
            name: {
                required: "请输入类型名称",
                maxlength: "书架名称最多10个字符"
            }
        }
    })
}

/**
 * 弹出图书书架框
 */
function popBox(id) {
    var title = '新增图书书架';
    var requestUrl = ctx + "book/shelf/add";
    if (sys.util.isEmpty(id)) {//添加
        $(".popBox input[name='id']").val("");
    } else {//修改
        title = '修改图书书架';
        requestUrl = ctx + "book/shelf/update";
        $(".popBox input[name='id']").val(id);
    }
    validatePopBoxForm();
    $(".popBox").removeClass("layui-hide");
    var index = layer.open({
        title: title,
        area: ['500px', '300px'],
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
                url: requestUrl,
                data: data,
                dataType: 'json',
                success: function (result) {
                    if (result.code == 0) {
                        sysLayer.util.alert("保存成功", {
                            ok: function () {
                                layer.close(index);
                                window.location.href = ctx + "book/shelf/list";
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
 * 删除
 */
function del(id) {
    sysLayer.util.confirm('您确定要删除吗？', {
        ok: function () {
            sys.ajax.doAjax({
                type: 'post',
                url: ctx + "book/shelf/del",
                data: {"bookShelfId": id},
                dataType: 'json',
                success: function (result) {
                    if (result.code == 0) {
                        window.location.href = ctx + "book/shelf/list";
                    } else {
                        sysLayer.util.alert(result.msg);
                    }
                }
            });
        }
    });
}