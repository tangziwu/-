package com.ssh.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;


import com.ssh.pojo.Leave;
import com.ssh.pojo.PersonLeave;

public class LeaveDaoImpl2 extends HibernateDaoSupport implements LeaveDao2{

	@Override
	public void add(PersonLeave leave) {
		
		this.getHibernateTemplate().save(leave);
		
	}

	@Override
	public void remove(PersonLeave leave) {
		this.getHibernateTemplate().delete(leave);
		
	}

	@Override
	public void modify(PersonLeave leave) {
		this.getHibernateTemplate().update(leave);
		
	}

	@Override
	public PersonLeave findById(Integer id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(PersonLeave.class, id);
	}

	@Override
	public List<PersonLeave> find() {
		String hql = "from PersonLeave";
		return (List<PersonLeave>) this.getHibernateTemplate().find(hql, new Object[]{});
	}

	@Override
	public List<PersonLeave> find1() {
		String hql = "from PersonLeave";
		return (List<PersonLeave>) this.getHibernateTemplate().find(hql, new Object[]{});
	}



}
