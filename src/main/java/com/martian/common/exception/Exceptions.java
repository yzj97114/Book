package com.martian.common.exception;

import static com.martian.common.exception.Exceptions.Constant.*;

/**
 * 枚举异常常量
 */
public interface Exceptions {

    /**
     * 异常模块code
     */
    interface Constant {
        int SYSTEM = 900;// 系统异常
        int FILE = 950;// 文件
        int USER = 1000;// 用户
        int BOOK = 2000;// 图书
        int READER = 3000;// 读者
        int BORROW = 4000;// 借阅记录
    }

    enum System implements ExceptionType {
        SYSTEM_ERROR(SYSTEM + 1, "系统异常"),
        REQUEST_PARAM_ERROR(SYSTEM + 2, "请求参数错误"),
        REQUEST_METHOD_ERROR(SYSTEM + 3, "请求方式错误，请检查GET或者POST方式是否错误"),
        ADD_FAIL(SYSTEM + 4, "添加失败"),
        UPDATE_FAIL(SYSTEM + 5, "修改失败"),
        SAVE_FAIL(SYSTEM + 6, "保存失败"),
        DEL_FAIL(SYSTEM + 7, "删除失败"),
        SYSTEM_ADMIN_NOT_LOGIN(SYSTEM + 8, "您还未登录，请先登录"),;

        private int code;
        private String description;

        System(int code, String description) {
            this.code = code;
            this.description = description;
        }

        @Override
        public int getCode() {
            return code;
        }

        @Override
        public String getDescription() {
            return description;
        }
    }

    enum File implements ExceptionType {
        FILE_UPLOAD_NOT_EXIST(FILE + 1, "文件不存在，请重新上传"),
        FILE_UPLOAD_DIR_NOT_WRITE_PERMISSION(FILE + 2, "目录没有写权限，上传失败"),
        FILE_UPLOAD_TOO_BIG(FILE + 3, "文件过大，请重新上传"),
        FILE_UPLOAD_NOT_FIND_PATH(FILE + 4, "系统找不到指定的路径，上传失败"),
        FILE_UPLOAD_ERROR(FILE + 5, "文件上传错误"),;

        private int code;
        private String description;

        File(int code, String description) {
            this.code = code;
            this.description = description;
        }

        @Override
        public int getCode() {
            return code;
        }

        @Override
        public String getDescription() {
            return description;
        }
    }

    enum Book implements ExceptionType {
        BOOK_ID_NULL(BOOK + 1, "图书Id不能为空"),
        BOOK_NOT_EXIST(BOOK + 2, "图书不存在"),;

        private int code;
        private String description;

        Book(int code, String description) {
            this.code = code;
            this.description = description;
        }

        @Override
        public int getCode() {
            return code;
        }

        @Override
        public String getDescription() {
            return description;
        }
    }

    enum Reader implements ExceptionType {
        READER_ID_NULL(READER + 1, "读者Id不能为空"),
        READER_NOT_EXIST(READER + 2, "读者不存在"),
        READER_BORROW_NUM_TOO_BIG(READER + 3, "读者可借阅的图书数量超过了系统限制，请先归还图书"),;

        private int code;
        private String description;

        Reader(int code, String description) {
            this.code = code;
            this.description = description;
        }

        @Override
        public int getCode() {
            return code;
        }

        @Override
        public String getDescription() {
            return description;
        }
    }

    enum Borrow implements ExceptionType {
        BORROW_ID_NULL(BORROW + 1, "借阅Id不能为空"),
        BORROW_NOT_EXIST(BORROW + 2, "借阅信息不存在"),
        BORROW_HAS_RENEW(BORROW + 3, "该图书已经续借过一次，请先还书"),;
        private int code;
        private String description;

        Borrow(int code, String description) {
            this.code = code;
            this.description = description;
        }

        @Override
        public int getCode() {
            return code;
        }

        @Override
        public String getDescription() {
            return description;
        }
    }

    enum User implements ExceptionType {
        USERNAME_NULL(USER + 1, "请输入用户名"),
        PWD_NULL(USER + 2, "请输入密码"),
        USERNAME_PWD_ERROR(USER + 3, "用户名或密码错误"),
        USER_NOT_EXIST(USER + 4, "用户不存在"),
        USER_DISABLED(USER + 5, "用户被禁用，请联系管理员"),
        USER_ID_NULL(USER + 6, "用户Id不能为空"),
        USERNAME_HAS_USED(USER + 7, "用户名已被使用，请重新输入"),
        NEW_PWD_NOT_NULL(USER + 8, "密码不能为空"),
        RE_NEW_PWD_NOT_NULL(USER + 9, "确认密码不能为空"),
        TWO_PWD_NOT_EQUAL(USER + 10, "两次输入的密码不一致，请重新输入"),;

        private int code;
        private String description;

        User(int code, String description) {
            this.code = code;
            this.description = description;
        }

        @Override
        public int getCode() {
            return code;
        }

        @Override
        public String getDescription() {
            return description;
        }
    }
}
