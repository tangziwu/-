package com.ssh.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T>{
     Class<T> clazz;
	
     //拿到泛型实体类T  
     @SuppressWarnings("unchecked")
	public BaseDaoImpl(){  
         //BaseDaoImpl<User>获取此类泛型框中的第一个泛型  
         ParameterizedType pt=(ParameterizedType)this.getClass().getGenericSuperclass();  
         clazz=(Class<T>)pt.getActualTypeArguments()[0];  
     }  
	@Override
	public void add(T t) {
		
		this.getHibernateTemplate().save(t);
		
	}

	@Override
	public void remove(T t) {
		
		this.getHibernateTemplate().delete(t);
		
	}

	@Override
	public void modify(T t) {
		
		this.getHibernateTemplate().update(t);
		
	}

	@Override
	public T findById(Integer id) {
		
		return this.getHibernateTemplate().get(clazz, id);
	}

	@Override
	public List<T> find() {
		 String hql=" from "+clazz.getName();
		 return
			(List<T>) this.getHibernateTemplate().find(hql, new Object[] {});
	}

	
}
