package com.ssh.service;

import java.util.List;

import javax.servlet.ServletOutputStream;

import com.ssh.pojo.Attendance;
import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;

/**
 * 
 * @author chen
 *
 */
public interface UserService {
	
	boolean find(User user);
	List<User> find(String account);
    void add(User user);
	
	void modify(User user);
	
	void remove(User user);
	
	void modifypassword(User user);
	
	List<User> find();
	
	User find(Integer id);
	User find1(Integer id);
	User find2(Integer id);
    Integer findCount();
    //导出列表  
    public void exportExcel(List<User> userList,ServletOutputStream outputStream); 
	PageBean<User> findPage(Integer currPage);
}
