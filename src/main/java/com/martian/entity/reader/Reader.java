package com.martian.entity.reader;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.martian.entity.BaseEntity;
import com.martian.enums.SexEnum;

/**
 * 读者信息
 */
@TableName("t_reader")
public class Reader extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户Id
     */
	@TableField("user_id")
	private String userId;
    /**
     * 姓名
     */
	private String name;
    /**
     * 性别：0女 1男
     */
	private SexEnum sex;
    /**
     * 借阅证编号
     */
	@TableField("card_no")
	private String cardNo;
    /**
     * 读者类型Id
     */
	@TableField("type_id")
	private String typeId;
    /**
     * 手机号
     */
	private String mobile;
    /**
     * 邮箱
     */
	private String email;
    /**
     * 身份证号
     */
	@TableField("id_no")
	private String idNo;
	/**
	 * 可借阅天数
	 */
	private Integer days;
	/**
	 * 可借图书本数
	 */
	private Integer num;
	/**
	 * 已借图书本数
	 */
	@TableField("has_num")
	private Integer hasNum;

	public String getUserId() {
		return userId;
	}

	public Reader setUserId(String userId) {
		this.userId = userId;
		return this;
	}

	public String getName() {
		return name;
	}

	public Reader setName(String name) {
		this.name = name;
		return this;
	}

	public SexEnum getSex() {
		return sex;
	}

	public Reader setSex(SexEnum sex) {
		this.sex = sex;
		return this;
	}

	public String getCardNo() {
		return cardNo;
	}

	public Reader setCardNo(String cardNo) {
		this.cardNo = cardNo;
		return this;
	}

	public String getTypeId() {
		return typeId;
	}

	public Reader setTypeId(String typeId) {
		this.typeId = typeId;
		return this;
	}

	public String getMobile() {
		return mobile;
	}

	public Reader setMobile(String mobile) {
		this.mobile = mobile;
		return this;
	}

	public String getEmail() {
		return email;
	}

	public Reader setEmail(String email) {
		this.email = email;
		return this;
	}
	public String getIdNo() {
		return idNo;
	}

	public Reader setIdNo(String idNo) {
		this.idNo = idNo;
		return this;
	}

	public Integer getDays() {
		return days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getHasNum() {
		return hasNum;
	}

	public void setHasNum(Integer hasNum) {
		this.hasNum = hasNum;
	}
}
