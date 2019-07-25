/**
 * 登录
 */

function login() {
    var userName = $("input[name='userName']").val();
    var password = $("input[name='password']").val();
    if (sys.util.isEmpty(userName)) {
        layer.msg('请输入用户名',{icon: 5,time:600,anim: 6});
        return;
    }
    if (sys.util.isEmpty(password)) {
        layer.msg('请输入密码', {icon: 5,time:600,anim: 6});
        return;
    }
    sys.ajax.doAjax({
        type: 'post',
        url: ctx + 'login',
        data: $(".login form").serialize2(),
        dataType: 'json',
        success: function (result) {
            if (result.code == 0) {
                window.location.href = ctx + "message/list";
            } else {
                layer.msg(result.msg, {icon: 5,time:600,anim: 6});
            }
        }
    });
}
//绑定回车事件,实现按回车登录
$(document).keyup(function(e) {
    if((e.keyCode || e.which)==13) {
        login();
    }
});