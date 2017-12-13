package com.ssh.service;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;

import com.ssh.dao.AttendanceDao;
import com.ssh.pojo.Attendance;
import com.ssh.pojo.PageBean;
//import com.ssh.pojo.PageBean;
import com.ssh.utils.ExcelUtil;
import com.ssh.utils.ExcelUtil2;

public class AttendanceServiceImp implements AttendanceService {

	// ע��dao��
	private AttendanceDao attendanceDao;

	@Override
	public void add(Attendance att) {
		attendanceDao.add(att);
	}
	// ע��dao��
	public void setAttendanceDao(AttendanceDao attendanceDao) {
		this.attendanceDao = attendanceDao;
	}

	@Override
	public Integer findCount() {
		// TODO Auto-generated method stub
		return attendanceDao.findCount();
	}

	@Override
	public PageBean<Attendance> findPage(Integer currPage) {

		PageBean<Attendance> pageBean = new PageBean<Attendance>();
		// ��װ��ǰҳ��
		pageBean.setCurrPage(currPage);
		// ��װÿҳ��ʾ�ļ�¼��
		int pageSize = 11;
		pageBean.setPageSize(pageSize);

		// ��װ�ܼ�¼��
		int totalCount = attendanceDao.findCount();
		pageBean.setTotalCount(totalCount);
		// ��װ��ҳ��
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		// ��װÿҳ������
		int begin = (currPage - 1) * pageSize;
		List<Attendance> list = attendanceDao.findByPage(begin, pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	@Override
	public void exportExcel(List<Attendance> attendanceList, ServletOutputStream outputStream) {
		ExcelUtil2.exportExcel(attendanceList, outputStream);
		
	}
	@Override
	public List<Attendance> find() {
		
		return attendanceDao.find();
	}
}
