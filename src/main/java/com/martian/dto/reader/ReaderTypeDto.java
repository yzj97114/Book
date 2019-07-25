package com.martian.dto.reader;

import java.io.Serializable;

/**
 * 读者类型DTO
 */
public class ReaderTypeDto implements Serializable {
    private static final long serialVersionUID = 5046620020957687340L;
    /**
     * Id
     */
    private String id;
    /**
     * 类型名称
     */
    private String name;
    /**
     * 可借阅天数
     */
    private Integer days;
    /**
     * 可借图书本数
     */
    private Integer num;


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

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}
