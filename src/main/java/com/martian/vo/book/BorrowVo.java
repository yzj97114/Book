package com.martian.vo.book;

import com.martian.common.enums.EnumObj;
import com.martian.entity.borrow.Borrow;

import java.math.BigDecimal;

/**
 * 图书借阅信息
 */
public class BorrowVo extends Borrow {
    private static final long serialVersionUID = 5040196346978166730L;
    /**
     * 书名
     */
    private String bookName;
    /**
     * 图书类型Id
     */
    private String typeId;
    /**
     * 图书类型Name
     */
    private String typeName;
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
    private BigDecimal bookPrice;
    /**
     * 出版社
     */
    private String press;
    /**
     * 封面
     */
    private String bookImage;

    /**
     * 是否续借
     */
    private EnumObj isReNewObj;

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTranslator() {
        return translator;
    }

    public void setTranslator(String translator) {
        this.translator = translator;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public BigDecimal getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(BigDecimal bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getBookImage() {
        return bookImage;
    }

    public void setBookImage(String bookImage) {
        this.bookImage = bookImage;
    }

    public EnumObj getIsReNewObj() {
        if (this.getIsRenew() != null) {
            return new EnumObj(this.getIsRenew().getCode(), this.getIsRenew().getLabel());
        }
        return new EnumObj();
    }

}
