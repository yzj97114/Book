package com.martian.entity.borrow;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.martian.entity.BaseEntity;
import com.martian.enums.YNEnum;

import java.util.Date;

/**
 * 借阅信息
 */
@TableName("t_borrow")
public class Borrow extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 借阅者Id
     */
	@TableField("reader_id")
	private String readerId;
    /**
     * 图书Id
     */
	@TableField("book_id")
	private String bookId;
    /**
     * 借出日期
     */
	@TableField("out_date")
	@JSONField(format = "yyyy-MM-dd")
	private Date outDate;
    /**
     * 应归还日期
     */
	@TableField("back_date")
	@JSONField(format = "yyyy-MM-dd")
	private Date backDate;
    /**
     * 是否归还 Y是N否
     */
	@TableField("is_back")
	private YNEnum isBack;
    /**
     * 是否续借 Y是N否
     */
	@TableField("is_renew")
	private YNEnum isRenew;
    /**
     * 实际归还时间
     */
	@TableField("back_time")
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date backTime;


	public String getReaderId() {
		return readerId;
	}

	public Borrow setReaderId(String readerId) {
		this.readerId = readerId;
		return this;
	}

	public String getBookId() {
		return bookId;
	}

	public Borrow setBookId(String bookId) {
		this.bookId = bookId;
		return this;
	}

	public Date getOutDate() {
		return outDate;
	}

	public Borrow setOutDate(Date outDate) {
		this.outDate = outDate;
		return this;
	}

	public Date getBackDate() {
		return backDate;
	}

	public Borrow setBackDate(Date backDate) {
		this.backDate = backDate;
		return this;
	}

	public YNEnum getIsBack() {
		return isBack;
	}

	public Borrow setIsBack(YNEnum isBack) {
		this.isBack = isBack;
		return this;
	}

	public Date getBackTime() {
		return backTime;
	}

	public void setBackTime(Date backTime) {
		this.backTime = backTime;
	}

	public YNEnum getIsRenew() {
		return isRenew;
	}

	public void setIsRenew(YNEnum isRenew) {
		this.isRenew = isRenew;
	}
}
