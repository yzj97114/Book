package com.martian.entity.book;

import com.baomidou.mybatisplus.annotations.TableName;
import com.martian.entity.BaseEntity;

/**
 * 图书类型
 */
@TableName("t_book_type")
public class BookType extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 类型名称
     */
	private String name;


	public String getName() {
		return name;
	}

	public BookType setName(String name) {
		this.name = name;
		return this;
	}

}
