package com.martian.dto.reader;

import com.martian.common.page.BasePageDto;

/**
 * 读者搜索DTO
 */
public class ReaderSearchDto extends BasePageDto {
    private static final long serialVersionUID = -7406178024782691090L;

    /**
     * 用户名
     */
    private String userName;
    /**
     * 姓名
     */
    private String name;
    /**
     * 读者类型Id
     */
    private String typeId;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }
}
