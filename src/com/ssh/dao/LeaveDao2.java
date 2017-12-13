package com.ssh.dao;

import java.util.List;

import com.ssh.pojo.Leave;
import com.ssh.pojo.PersonLeave;

public interface LeaveDao2{
     
     void add(PersonLeave leave);
	
	void remove(PersonLeave leave);
	
	void modify(PersonLeave leave);
	
	PersonLeave   findById(Integer id);
	
	List<PersonLeave> find();
	List<PersonLeave> find1();
}
