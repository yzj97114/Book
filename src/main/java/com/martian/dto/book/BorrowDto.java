package com.martian.dto.book;

import java.io.Serializable;

/**
 * 借阅图书DTO
 */
public class BorrowDto implements Serializable {
    private static final long serialVersionUID = 4051141585948095712L;
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
