package com.ssh.dao;

import java.util.List;

import com.ssh.pojo.Leave;

public interface LeaveDao{
     
     void add(Leave leave);
	
	void remove(Leave leave);
	
	void modify(Leave leave);
	
	Leave  findById(Integer id);
	
	List<Leave> find();
}
