package com.martian.dto.book;

import com.martian.common.page.BasePageDto;
import com.martian.enums.YNEnum;

/**
 * 图书搜索DTO
 */
public class BookSearchDto extends BasePageDto {
    private static final long serialVersionUID = -5286549984777918000L;
    /**
     * 书名
     */
    private String bookName;
    /**
     * 图书类型Id
     */
    private String typeId;
    /**
     * 书架Id
     */
    private String shelfId;
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
     * 出版社
     */
    private String press;
    /**
     * 是否借出
     */
    private YNEnum isLend;
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

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
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
