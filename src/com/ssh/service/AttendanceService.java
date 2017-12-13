package com.ssh.service;

import java.util.List;

import javax.servlet.ServletOutputStream;

import com.ssh.pojo.Attendance;
import com.ssh.pojo.PageBean;
//import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;

public interface AttendanceService {
	
	void add(Attendance att);
	
	List<Attendance> find();
	Integer findCount();
	public void exportExcel(List<Attendance> attendanceList,ServletOutputStream outputStream); 
	PageBean<Attendance> findPage(Integer currPage);
}
