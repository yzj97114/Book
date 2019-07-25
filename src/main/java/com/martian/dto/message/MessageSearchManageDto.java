package com.martian.dto.message;

import com.martian.common.page.BasePageDto;

/**
 *
 */
public class MessageSearchManageDto extends BasePageDto {
    private static final long serialVersionUID = 8350336639538167192L;
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
