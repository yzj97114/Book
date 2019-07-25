package com.martian.vo.book;

import com.martian.common.enums.EnumObj;

/**
 * 图书借阅记录信息
 */
public class BorrowRecordVo extends BorrowVo {
    private static final long serialVersionUID = -6402513325127163184L;

    /**
     * 读者姓名
     */
    private String readerName;
    /**
     * 读者借阅证号
     */
    private String cardNo;

    /**
     * 是否归还
     */
    private EnumObj isBackObj;

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public EnumObj getIsBackObj() {
        if (super.getIsBack() != null) {
            return new EnumObj(super.getIsBack().getCode(), super.getIsBack().getLabel());
        }
        return new EnumObj();
    }
}
