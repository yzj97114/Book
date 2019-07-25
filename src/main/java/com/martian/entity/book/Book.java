package com.martian.entity.book;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.martian.entity.BaseEntity;
import com.martian.enums.YNEnum;

import java.math.BigDecimal;

/**
 * 图书信息
 */
@TableName("t_book")
public class Book extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 书名
     */
	@TableField("book_name")
	private String bookName;
    /**
     * 图书类型Id
     */
	@TableField("type_id")
	private String typeId;
    /**
     * 图书书架Id
     */
	@TableField("shelf_id")
	private String shelfId ;;
    /**
     * 作者
     */
	private String author;
    /**
     * 译者
     */
	private String translator;
    /**
     * 国际书标号
     */
	private String isbn;
    /**
     * 图书价格
     */
	@TableField("book_price")
	private BigDecimal bookPrice;
    /**
     * 出版社
     */
	private String press;
    /**
     * 封面
     */
	@TableField("book_image")
	private String bookImage;

	/**
	 * 是否借出
	 */
	@TableField("is_lend")
	private YNEnum isLend;
	public String getBookName() {
		return bookName;
	}

	public Book setBookName(String bookName) {
		this.bookName = bookName;
		return this;
	}

	public String getTypeId() {
		return typeId;
	}

	public Book setTypeId(String typeId) {
		this.typeId = typeId;
		return this;
	}

	public String getAuthor() {
		return author;
	}

	public Book setAuthor(String author) {
		this.author = author;
		return this;
	}

	public String getTranslator() {
		return translator;
	}

	public Book setTranslator(String translator) {
		this.translator = translator;
		return this;
	}

	public String getIsbn() {
		return isbn;
	}

	public Book setIsbn(String isbn) {
		this.isbn = isbn;
		return this;
	}

	public BigDecimal getBookPrice() {
		return bookPrice;
	}

	public Book setBookPrice(BigDecimal bookPrice) {
		this.bookPrice = bookPrice;
		return this;
	}

	public String getPress() {
		return press;
	}

	public Book setPress(String press) {
		this.press = press;
		return this;
	}

	public String getBookImage() {
		return bookImage;
	}

	public Book setBookImage(String bookImage) {
		this.bookImage = bookImage;
		return this;
	}

	public YNEnum getIsLend() {
		return isLend;
	}

	public void setIsLend(YNEnum isLend) {
		this.isLend = isLend;
	}

	public String getShelfId() {
		return shelfId;
	}

	public void setShelfId(String shelfId) {
		this.shelfId = shelfId;
	}
}
