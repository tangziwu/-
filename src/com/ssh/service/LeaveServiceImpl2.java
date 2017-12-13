package com.ssh.service;

import java.util.List;

import com.ssh.dao.LeaveDao;
import com.ssh.dao.LeaveDao2;
import com.ssh.pojo.Leave;
import com.ssh.pojo.PersonLeave;

public class LeaveServiceImpl2 implements LeaveService2 {
   
	private LeaveDao2 leavedao2;

	@Override
	public void add(PersonLeave leave) {
	
		leavedao2.add(leave);
	}

	@Override
	public void modify(PersonLeave leave) {
		
		leavedao2.modify(leave);
		
	}

	@Override
	public void remove(PersonLeave leave) {
		
		leavedao2.remove(leave);
		
	}

	@Override
	public PersonLeave findById(Integer id) {
		// TODO Auto-generated method stub
		return leavedao2.findById(id);
	}

	@Override
	public List<PersonLeave> find() {
		// TODO Auto-generated method stub
		return leavedao2.find();
	}

	

	public void setLeavedao2(LeaveDao2 leavedao2) {
		this.leavedao2 = leavedao2;
	}

	@Override
	public List<PersonLeave> find1() {
		// TODO Auto-generated method stub
				return leavedao2.find1();
	}
	
	

}
