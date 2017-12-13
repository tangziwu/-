package com.ssh.utils;

import java.util.List;

public class Pager<T> {
	private Integer total;
	private List<T> Rows;
	private Integer page;
	private Integer sumPage;
	
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<T> getRows() {
		return Rows;
	}
	public void setRows(List<T> rows) {
		Rows = rows;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSumPage() {
		return sumPage;
	}
	public void setSumPage(Integer sumPage) {
		this.sumPage = sumPage;
	}
	
	
}
