package com.ssh.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;


import com.ssh.pojo.Leave;

public class LeaveDaoImpl extends HibernateDaoSupport implements LeaveDao{

	@Override
	public void add(Leave leave) {
		
		this.getHibernateTemplate().save(leave);
		
	}

	@Override
	public void remove(Leave leave) {
		
		this.getHibernateTemplate().delete(leave);
		
	}

	@Override
	public void modify(Leave leave) {
	
		this.getHibernateTemplate().update(leave);
		
	}

	@Override
	public Leave findById(Integer id) {
	
		return this.getHibernateTemplate().get(Leave.class, id);
	}

	@Override
	public List<Leave> find() {
		
		String hql = "from Leave";
		return (List<Leave>) this.getHibernateTemplate().find(hql, new Object[]{});
	}

	

}
