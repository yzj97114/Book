//左侧菜单
cur_menu = "reader/list"
$(function () {
    validateUpdateForm();
})

/**
 * 【修改】
 */
function update(type) {
    console.log($('#updateForm').serialize())
    if (!validateUpdateForm().form()) {
        return;
    }
    if(type==1){
        goSaveOrUpdate("#updateForm", ctx + "reader/goUpdatePersonInfo", true)
    }else {
        goSaveOrUpdate("#updateForm", ctx + "reader/list", true)
    }
}
/**
 * 校验表单【修改
 * @returns {*|jQuery}
 */
function validateUpdateForm() {
    return $('#updateForm').validate({
        rules: {
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