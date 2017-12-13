package com.ssh.pojo;

import java.io.Serializable;

/**
 * Home entity. @author MyEclipse Persistence Tools
 */

public class Home implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer hid;
	private Integer oid;
	private Integer hnumber;
	private String hbulid;
	private String hstate;
	private String hunit;
	private String hfloor;
	private String htype;
	private Double harea;
	private String hremarks;
	private String hno;

	public Home() {
	}

	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getHnumber() {
		return hnumber;
	}

	public void setHnumber(Integer hnumber) {
		this.hnumber = hnumber;
	}

	public String getHbulid() {
		return hbulid;
	}

	public void setHbulid(String hbulid) {
		this.hbulid = hbulid;
	}

	public String getHstate() {
		return hstate;
	}

	public void setHstate(String hstate) {
		this.hstate = hstate;
	}

	public String getHunit() {
		return hunit;
	}

	public void setHunit(String hunit) {
		this.hunit = hunit;
	}

	public String getHfloor() {
		return hfloor;
	}

	public void setHfloor(String hfloor) {
		this.hfloor = hfloor;
	}

	public String getHtype() {
		return htype;
	}

	public void setHtype(String htype) {
		this.htype = htype;
	}

	public Double getHarea() {
		return harea;
	}

	public void setHarea(Double harea) {
		this.harea = harea;
	}

	public String getHremarks() {
		return hremarks;
	}

	public void setHremarks(String hremarks) {
		this.hremarks = hremarks;
	}

	public String getHno() {
		return hno;
	}

	public void setHno(String hno) {
		this.hno = hno;
	}

}