package com.ssh.service;

import java.util.List;

import javax.servlet.ServletOutputStream;

import com.ssh.dao.UserDao;
import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;
import com.ssh.utils.ExcelUtil;

public class UserServiceImp implements UserService {
	// ע��dao�㣬��ȡ����
	private UserDao userDao;
     
	@Override
	public List<User> find(String account) {
		
		return userDao.find(account);
	}

	
	@Override
	public boolean find(User user) {
		List<User> list = userDao.find(user);
		for (int i = 0; i < list.size(); i++) {
			User user2 = list.get(i);
			if (user2 != null && !user2.getAccount().equals("")) {
				System.out.println(user2.getAccount() + "��¼�ɹ�");
				return true;
			}
		}
		System.out.println("��¼ʧ��");
		return false;
	}

	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	@Override
	public void add(User user) {
		
		userDao.add(user);
		
	}


	@Override
	public void modify(User user) {
		
		userDao.modify(user);
		
	}


	@Override
	public void remove(User user) {
		
		userDao.remove(user);
		
	}


	@Override
	public List<User> find() {
		
		return userDao.find();
	}


	@Override
	public User find(Integer id) {
		
		return userDao.find(id);
	}
	@Override
	public User find1(Integer id) {
		
		return userDao.find(id);
	}

	@Override
	public void modifypassword(User user) {
		
		userDao.modifypassword(user);
		
	}


	@Override
	public Integer findCount() {
		// TODO Auto-generated method stub
		return userDao.findCount();
	}


	@Override
	public PageBean<User> findPage(Integer currPage) {
		
		PageBean<User> pageBean=new PageBean<User>();
		//封装当前页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize=11;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount=userDao.findCount();
		pageBean.setTotalCount(totalCount);
		//封装总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页的数据
		int begin=(currPage - 1)*pageSize;
		List<User> list=userDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}


	@Override
	public User find2(Integer id) {
		// TODO Auto-generated method stub
		return userDao.find2(id);
	}


	
	@Override
	public void exportExcel(List<User> userList,
			ServletOutputStream outputStream) {
		ExcelUtil.exportExcel(userList, outputStream);
	}
	

	
	
}
