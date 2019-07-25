package com.martian.entity.reader;

import com.baomidou.mybatisplus.annotations.TableName;
import com.martian.entity.BaseEntity;

/**
 * 读者类型
 */
@TableName("t_reader_type")
public class ReaderType extends BaseEntity {

    private static final long serialVersionUID = 1L;

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


	public String getName() {
		return name;
	}

	public ReaderType setName(String name) {
		this.name = name;
		return this;
	}

	public Integer getDays() {
		return days;
	}

	public ReaderType setDays(Integer days) {
		this.days = days;
		return this;
	}

	public Integer getNum() {
		return num;
	}

	public ReaderType setNum(Integer num) {
		this.num = num;
		return this;
	}

}
