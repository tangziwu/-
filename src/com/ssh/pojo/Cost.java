package com.ssh.pojo;

import java.util.Date;

/**
 * Cost entity. @author MyEclipse Persistence Tools
 */

public class Cost implements java.io.Serializable {

	// Fields

	private Integer CId;
	private Double CProperty;
	
	private Integer PId;
	private Double CPark;
	private Date CPurchase;
	private Date CPayment;
	private Double CAmount;
	private Double CAmountpaid;
	private Double CAccount;
	private Integer HId;
	private String CRemarks;

	// Constructors

	/** default constructor */
	public Cost() {
	}

	

	// Property accessors

	public Integer getCId() {
		return this.CId;
	}

	public void setCId(Integer CId) {
		this.CId = CId;
	}

	public Double getCProperty() {
		return this.CProperty;
	}

	public void setCProperty(Double CProperty) {
		this.CProperty = CProperty;
	}

	
	public Integer getPId() {
		return this.PId;
	}

	public void setPId(Integer PId) {
		this.PId = PId;
	}

	public Double getCPark() {
		return this.CPark;
	}

	public void setCPark(Double CPark) {
		this.CPark = CPark;
	}

	public Date getCPurchase() {
		return this.CPurchase;
	}

	public void setCPurchase(Date CPurchase) {
		this.CPurchase = CPurchase;
	}

	public Date getCPayment() {
		return this.CPayment;
	}

	public void setCPayment(Date CPayment) {
		this.CPayment = CPayment;
	}

	public Double getCAmount() {
		return this.CAmount;
	}

	public void setCAmount(Double CAmount) {
		this.CAmount = CAmount;
	}

	public Double getCAmountpaid() {
		return this.CAmountpaid;
	}

	public void setCAmountpaid(Double CAmountpaid) {
		this.CAmountpaid = CAmountpaid;
	}

	public Double getCAccount() {
		return this.CAccount;
	}

	public void setCAccount(Double CAccount) {
		this.CAccount = CAccount;
	}

	public Integer getHId() {
		return this.HId;
	}

	public void setHId(Integer HId) {
		this.HId = HId;
	}

	public String getCRemarks() {
		return this.CRemarks;
	}

	public void setCRemarks(String CRemarks) {
		this.CRemarks = CRemarks;
	}

}