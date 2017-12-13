package com.ssh.pojo;

import java.util.Date;

/**
 * FileTransfer entity. @author MyEclipse Persistence Tools
 */

public class FileTransfer implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String classfiy;
	private String remark;
	private String context;
	private Date date;
	private String userName;

	// Constructors

	/** default constructor */
	public FileTransfer() {
	}

	

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getClassfiy() {
		return this.classfiy;
	}

	public void setClassfiy(String classfiy) {
		this.classfiy = classfiy;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getContext() {
		return this.context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}