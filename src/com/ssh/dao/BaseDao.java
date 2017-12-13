package com.ssh.dao;

import java.util.List;
/**
 * 基础的增删改查 根据id查询　
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
