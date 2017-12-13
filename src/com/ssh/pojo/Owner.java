package com.ssh.pojo;

import java.util.Date;

/**
 * Owner entity. @author MyEclipse Persistence Tools
 */

public class Owner implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer oid;
	private String oname;
	private String ophone;
	private Date ojdata;
	private String ocarder;
	private String oaddress;
	private String oownership;
	private String oremark;

	public Owner() {
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOphone() {
		return ophone;
	}

	public void setOphone(String ophone) {
		this.ophone = ophone;
	}

	public Date getOjdata() {
		return ojdata;
	}

	public void setOjdata(Date ojdata) {
		this.ojdata = ojdata;
	}

	public String getOcarder() {
		return ocarder;
	}

	public void setOcarder(String ocarder) {
		this.ocarder = ocarder;
	}

	public String getOaddress() {
		return oaddress;
	}

	public void setOaddress(String oaddress) {
		this.oaddress = oaddress;
	}

	public String getOownership() {
		return oownership;
	}

	public void setOownership(String oownership) {
		this.oownership = oownership;
	}

	public String getOremark() {
		return oremark;
	}

	public void setOremark(String oremark) {
		this.oremark = oremark;
	}

	
}