package com.ssh.service;

import java.util.List;

import com.ssh.pojo.Cost;
import com.ssh.pojo.PageBean;


public interface CostService {
	Cost findById(Integer CId);
	List<Cost> find();
	List<Cost> find(Integer HId);
	void modify(Cost cost);
	void add(Cost cost);
	 Integer findCount();
	 PageBean<Cost> findPage(Integer currPage);
}
