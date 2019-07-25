package com.martian.entity.message;

import com.baomidou.mybatisplus.annotations.TableName;
import com.martian.entity.BaseEntity;

/**
 * 消息公告表
 */
@TableName("t_message")
public class Message extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 公告名称
     */
	private String title;
    /**
     * 内容
     */
	private String content;


	public String getTitle() {
		return title;
	}

	public Message setTitle(String title) {
		this.title = title;
		return this;
	}

	public String getContent() {
		return content;
	}

	public Message setContent(String content) {
		this.content = content;
		return this;
	}

	@Override
	public String toString() {
		return "Message{" +
			"title=" + title +
			", content=" + content +
			"}";
	}
}
