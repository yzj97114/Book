package com.martian.dto.book;

import com.martian.common.validate.AddGroup;
import com.martian.common.validate.UpdateGroup;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 图书DTO
 */
public class BookDto implements Serializable {
    /**
     * 图书Id
     */
    @NotBlank(message = "图书Id不能为空", groups = {UpdateGroup.class})
    private String id;
    /**
     * 书名
     */
    @NotBlank(message = "图书名称不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max = 50, message = "图书名称最多50个字符", groups = {AddGroup.class, UpdateGroup.class})
    private String bookName;
    /**
     * 封面
     */
    private String bookImage;
    /**
     * 图书类型Id
     */
    @NotBlank(message = "图书类型不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String typeId;
    /**
     * 图书书架Id
     */
    @NotBlank(message = "图书书架不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String shelfId;
    /**
     * 作者
     */
    @NotBlank(message = "作者不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max = 20, message = "作者最多20个字符", groups = {AddGroup.class, UpdateGroup.class})
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
    @NotNull(message = "价格不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @DecimalMin(value = "0", message = "价格不能小于0", groups = {AddGroup.class, UpdateGroup.class})
    private BigDecimal bookPrice;
    /**
     * 出版社
     */
    @NotBlank(message = "出版社不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max = 50, message = "出版社最多50个字符", groups = {AddGroup.class, UpdateGroup.class})
    private String press;

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

    public String getBookImage() {
        return bookImage;
    }

    public void setBookImage(String bookImage) {
        this.bookImage = bookImage;
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

    public String getShelfId() {
        return shelfId;
    }

    public void setShelfId(String shelfId) {
        this.shelfId = shelfId;
    }
}
