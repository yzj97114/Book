package com.martian.dto.reader;

import com.martian.common.validate.AddGroup;
import com.martian.common.validate.UpdateGroup;
import com.martian.enums.SexEnum;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;

/**
 * 读者DTO
 */
public class ReaderDto implements Serializable {

    private static final long serialVersionUID = -4898281548695997958L;
    /**
     * 读者Id
     */
    @NotBlank(message = "读者Id不能为空", groups = {UpdateGroup.class})
    private String id;

    /**
     * 用户名
     */
    @NotBlank(message = "用户名不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max = 10, message = "用户名最多10个字符", groups = {AddGroup.class, UpdateGroup.class})
    private String userName;

    /**
     * 姓名
     */
    @NotBlank(message = "读者名称不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max = 10, message = "读者名称最多10个字符", groups = {AddGroup.class, UpdateGroup.class})
    private String name;
    /**
     * 性别：0女 1男
     */
    private SexEnum sex;
    /**
     * 借阅证编号
     */
    private String cardNo;
    /**
     * 读者类型Id
     */
    private String typeId;
    /**
     * 手机号
     */
    @NotBlank(message = "手机号不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String mobile;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 身份证号
     */
    @NotBlank(message = "身份证号不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String idNo;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public SexEnum getSex() {
        return sex;
    }

    public void setSex(SexEnum sex) {
        this.sex = sex;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIdNo() {
        return idNo;
    }

    public void setIdNo(String idNo) {
        this.idNo = idNo;
    }
}
