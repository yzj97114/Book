package com.martian.vo.book;

import com.martian.common.enums.EnumObj;
import com.martian.enums.YNEnum;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 图书Vo
 */
public class BookVo implements Serializable {
    private static final long serialVersionUID = -3330567069824783724L;

    /**
     * id
     */
    private String id;
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
     * 图书书架Name
     */
    private String shelfName;
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
     * 是否借出
     */
    private YNEnum isLend;

    /**
     * 是否借出
     */
    private EnumObj isLendObj;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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

    public YNEnum getIsLend() {
        return isLend;
    }

    public void setIsLend(YNEnum isLend) {
        this.isLend = isLend;
    }

    public String getShelfName() {
        return shelfName;
    }

    public void setShelfName(String shelfName) {
        this.shelfName = shelfName;
    }

    public EnumObj getIsLendObj() {
        if (this.getIsLend() != null) {
            return new EnumObj(this.getIsLend().getCode(), this.getIsLend().getLabel());
        }
        return new EnumObj();
    }
}
