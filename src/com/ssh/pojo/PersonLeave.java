package com.ssh.pojo;

import java.util.Date;

/**
 * PersonLeave entity. @author MyEclipse Persistence Tools
 */

public class PersonLeave implements java.io.Serializable {

	// Fields

	private Integer id;
	private String type;
	private Date sdate;
	private Date edate;
	private String name;
	private String reson;
	private String status;
	private Date shenqingdate;
	private Integer days;

	// Constructors

	/** default constructor */
	public PersonLeave() {
	}

	
	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getSdate() {
		return this.sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return this.edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReson() {
		return this.reson;
	}

	public void setReson(String reson) {
		this.reson = reson;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getShenqingdate() {
		return this.shenqingdate;
	}

	public void setShenqingdate(Date shenqingdate) {
		this.shenqingdate = shenqingdate;
	}

	public Integer getDays() {
		return this.days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

}