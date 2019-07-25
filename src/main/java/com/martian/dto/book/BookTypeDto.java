package com.martian.dto.book;

import java.io.Serializable;

/**
 * 图书类型DTO
 */
public class BookTypeDto implements Serializable {
    private static final long serialVersionUID = 3676429960604661373L;
    /**
     * 类型Id
     */
    private String id;
    /**
     * 类型名称
     */
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
