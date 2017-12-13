package com.ssh.pojo;

/**
 * Park entity. @author MyEclipse Persistence Tools
 */

public class Park implements java.io.Serializable {

	// Fields

	private Integer PId;
	private String PState;
	private Integer HId;

	// Constructors

	/** default constructor */
	public Park() {
	}

	

	// Property accessors

	public Integer getPId() {
		return this.PId;
	}

	public void setPId(Integer PId) {
		this.PId = PId;
	}

	public String getPState() {
		return this.PState;
	}

	public void setPState(String PState) {
		this.PState = PState;
	}

	public Integer getHId() {
		return this.HId;
	}

	public void setHId(Integer HId) {
		this.HId = HId;
	}

}