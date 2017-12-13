package com.ssh.service;

import java.util.List;

import com.ssh.dao.LeaveDao;
import com.ssh.pojo.Leave;

public class LeaveServiceImpl implements LeaveService {
   
	private LeaveDao Leavedao;
	
	@Override
	public void add(Leave leave) {
		
		Leavedao.add(leave);
		
		
	}

	@Override
	public void modify(Leave leave) {
		
		Leavedao.modify(leave);
		
		
	}

	@Override
	public void remove(Leave leave) {
		
		Leavedao.remove(leave);
		
	}

	@Override
	public Leave findById(Integer id) {
		
		return Leavedao.findById(id);
	}

	@Override
	public List<Leave> find() {
		
		return Leavedao.find();
	}

	
	public void setLeaveDao(LeaveDao leaveDao) {
		Leavedao = leaveDao;
	}
	
	

}
