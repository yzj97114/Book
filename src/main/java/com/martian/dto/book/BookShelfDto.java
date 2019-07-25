package com.martian.dto.book;

import java.io.Serializable;

/**
 * 图书书架DTO
 */
public class BookShelfDto implements Serializable {
    private static final long serialVersionUID = -2824828372014298760L;
    /**
     * 书架Id
     */
    private String id;
    /**
     * 书架名称
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
