package com.ssh.dao;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ssh.pojo.Park;

public class ParkDaoImpl extends HibernateDaoSupport implements ParkDao {

	@Override
	public Park find(Integer hid) {
		String hql = "from Park where hid = hid";
		return (Park) this.getHibernateTemplate().find(hql,new Object[]{});
	}

}
