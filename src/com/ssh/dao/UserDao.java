package com.ssh.dao;

import java.io.Serializable;
import java.util.List;

import com.ssh.pojo.Attendance;
import com.ssh.pojo.User;

/**
 * dao�� ������Դ���ݿ� ��hibernate����
 * @author chen
 *
 */
public interface UserDao {
	
	List<User> find(User user);
	
	List<User> find(String account);
	
    void add(User user);
	
	void modify(User user);
	
	void remove(User user);
	
	void modifypassword(User user);
	
    Integer findCount();
	
	List<User> findByPage(Integer begin,Integer pageSize);
	
	List<User> find();
	
	User find(Integer id);
	User find1(Integer id);
	User find2(Integer id);
	
}
