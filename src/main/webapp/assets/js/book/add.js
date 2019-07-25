//左侧菜单
cur_menu = "book/list"
$(function () {
    validateAddForm();
})

/**
 * 【添加】
 */
function add() {
    console.log($('#addForm').serialize())
    if (!validateAddForm().form()) {
        return;
    }
    var imageName =  $("input[name='bookImage']").val();
    if(sys.util.isEmpty(imageName)){
        sysLayer.util.alert('请上传图书图片');
        return
    }
    goSaveOrUpdate("#addForm", ctx + "book/list", true)
}
/**
 * 校验表单【添加】
 * @returns {*|jQuery}
 */
function validateAddForm() {
    return $('#addForm').validate({
        rules: {
            bookName: {
                required: true,
                maxlength: 50
            },
            bookImage: {
                required: true
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
            bookImage: {
                required: "请上传图书图片"
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