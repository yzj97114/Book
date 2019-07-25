//左侧菜单
cur_menu = "book/list"
$(function () {
    validateUpdateForm();
})

/**
 * 【修改】
 */
function update() {
    if (!validateUpdateForm().form()) {
        return;
    }
    goSaveOrUpdate("#updateForm", ctx + "book/list", true)
}
/**
 * 校验表单【修改】
 * @returns {*|jQuery}
 */
function validateUpdateForm() {
    return $('#updateForm').validate({
        rules: {
            bookName: {
                required: true,
                maxlength: 50
            },
          /*  typeId: {
                required: true
            },*/
            author: {
                required: true,
                maxlength: 20
            },
            bookPrice: {
                required: true
            },
            press: {
                required: true,
                maxlength: 50
            }
        },
        messages: {
            bookName: {
                required: "请输入图书名称",
                maxlength: "图书名称最多50个字符"
            },
          /*  typeId: {
                required: "请输入图书类型"
            },*/
            author: {
                required: "请输入作者",
                maxlength: "作者最多20个字符"
            },
            bookPrice: {
                required: "请输入图书价格"
            },
            press: {
                required: "请输入出版社",
                maxlength: "出版社最多50个字符"
            }
        }
    })
}