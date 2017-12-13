package com.ssh.dao;

import java.util.List;

import com.ssh.pojo.Attendance;

public interface AttendanceDao {
	
	void add(Attendance att);
	
	void modify(Attendance attendance);
	
	Integer findCount();
	List<Attendance> find();
	List<Attendance> findByPage(Integer begin,Integer pageSize);
	
}
