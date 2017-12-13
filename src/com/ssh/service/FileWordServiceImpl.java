package com.ssh.service;

import java.util.List;

import com.ssh.dao.FileWordDao;
import com.ssh.pojo.FileTransfer;
import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;



public class FileWordServiceImpl implements FileWordService {
    private FileWordDao fileWordDao;

	@Override
	public void add(FileTransfer fileTransfer) {
		
		fileWordDao.add(fileTransfer);
		
	}

	@Override
	public void modify(FileTransfer fileTransfer) {
	
		fileWordDao.modify(fileTransfer);
		
	}

	@Override
	public void remove(FileTransfer fileTransfer) {
		fileWordDao.remove(fileTransfer);
		
	}

	@Override
	public FileTransfer findById(Integer id) {
	
		return fileWordDao.findById(id);
	}

	@Override
	public List<FileTransfer> find() {
		// TODO Auto-generated method stub
		return fileWordDao.find();
	}

	public FileWordDao getFileWordDao() {
		return fileWordDao;
	}

	public void setFileWordDao(FileWordDao fileWordDao) {
		this.fileWordDao = fileWordDao;
	}

	@Override
	public Integer findCount() {
		// TODO Auto-generated method stub
		return fileWordDao.findCount();
	}

	@Override
	public PageBean<FileTransfer> findPage(Integer currPage) {
		PageBean<FileTransfer> pageBean=new PageBean<FileTransfer>();
		//封装当前页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize=11;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount=fileWordDao.findCount();
		pageBean.setTotalCount(totalCount);
		//封装总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页的数据
		int begin=(currPage - 1)*pageSize;
		List<FileTransfer> list=fileWordDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	

}
