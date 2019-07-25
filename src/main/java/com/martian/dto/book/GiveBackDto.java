package com.martian.dto.book;

import java.io.Serializable;

/**
 * 归还图书DTO
 */
public class GiveBackDto implements Serializable {
    private static final long serialVersionUID = 5203432505187582883L;
    /**
     * 读者Id
     */
    private String readerId;
    /**
     * 图书Id
     */
    private String bookId;

    public String getReaderId() {
        return readerId;
    }

    public void setReaderId(String readerId) {
        this.readerId = readerId;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }
}
