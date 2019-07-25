package com.martian.dto.book;

import com.martian.common.page.BasePageDto;
import com.martian.enums.YNEnum;

/**
 * 借阅搜索DTO
 */
public class BorrowSearchDto extends BasePageDto {
    private static final long serialVersionUID = -6936738896543413711L;
    /**
     * 借阅证号
     */
    private String cardNo;
    /**
     * 读者Id
     */
    private String readerId;
    /**
     * 读者姓名
     */
    private String readerName;
    /**
     * 是否归还
     */
    private YNEnum isBack;

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    public String getReaderId() {
        return readerId;
    }

    public void setReaderId(String readerId) {
        this.readerId = readerId;
    }

    public YNEnum getIsBack() {
        return isBack;
    }

    public void setIsBack(YNEnum isBack) {
        this.isBack = isBack;
    }
}
