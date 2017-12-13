package com.ssh.dao;

import java.util.List;

import com.ssh.pojo.Cost;
import com.ssh.pojo.User;


public interface CostDao {
	Cost findById(Integer CId);
	List<Cost> find();
	List<Cost> find(Integer HId);
	void modify(Cost cost);
	void add(Cost cost);
	 Integer findCount();
	 List<Cost> findByPage(Integer begin,Integer pageSize);
}
