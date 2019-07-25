package com.martian.entity.book;

import com.baomidou.mybatisplus.annotations.TableName;
import com.martian.entity.BaseEntity;

/**
 *  书架
 */
@TableName("t_book_shelf")
public class BookShelf extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 书架名称
     */
	private String name;


	public String getName() {
		return name;
	}

	public BookShelf setName(String name) {
		this.name = name;
		return this;
	}

	@Override
	public String toString() {
		return "BookShelf{" +
			"name=" + name +
			"}";
	}
}
