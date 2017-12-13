package com.ssh.dao;

import java.util.List;
/**
 * ��������ɾ�Ĳ� ����id��ѯ��
 * @author Administrator
 *
 * @param <T>
 */
public interface BaseDao<T> {
    
	void add(T t);
	
	void remove(T t);
	
	void modify(T t);
	
	T findById(Integer id);
	
	List<T> find();
}
