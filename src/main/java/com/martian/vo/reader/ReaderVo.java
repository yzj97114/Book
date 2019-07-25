package com.martian.vo.reader;

import com.martian.common.enums.EnumObj;
import com.martian.entity.reader.Reader;

/**
 * 读者Vo
 */
public class ReaderVo extends Reader {

    private static final long serialVersionUID = -6140131145275691418L;
    /**
     * 用户名
     */
    private String userName;

    /**
     * 性别
     */
    private EnumObj sexObj;

    /**
     * 读者类型名称
     */
    private String typeName;


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public EnumObj getSexObj() {
        if (super.getSex() != null) {
            return new EnumObj(super.getSex().getCode(), super.getSex().getLabel());
        }
        return new EnumObj();
    }
}
