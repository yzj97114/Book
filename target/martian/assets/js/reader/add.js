//左侧菜单
cur_menu = "reader/list"
$(function () {
    validateAddForm();
})

/**
 * 【添加】
 */
function add() {
    if (!validateAddForm().form()) {
        return;
    }
    goSaveOrUpdate("#addForm", ctx + "reader/list", true)
}
/**
 * 校验表单【添加】
 * @returns {*|jQuery}
 */
function validateAddForm() {
    return $('#addForm').validate({
        rules: {
            userName: {
                required: true,
                maxlength: 10
            },
            name: {
                required: true,
                maxlength: 10
            },
            mobile: {
                required: true,
                isMobile : true
            },
            idNo: {
                required: true,
                maxlength: 50
            }
        },
        messages: {
            userName: {
                required: "请输入用户名",
                maxlength: "用户名最多10个字符"
            },
            name: {
                required: "请输入读者名称",
                maxlength: "读者名称最多10个字符"
            },
            mobile: {
                required: "请输入手机号"
            },
            idNo: {
                required: "请输入身份证号",
                maxlength: "身份证号最多20个字符"
            }
        }
    })
}