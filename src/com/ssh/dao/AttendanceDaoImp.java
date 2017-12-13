package com.ssh.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ssh.pojo.Attendance;

public class AttendanceDaoImp extends HibernateDaoSupport implements AttendanceDao {

	@Override
	public void add(Attendance att) {
		this.getHibernateTemplate().save(att);

	}

	@Override
	public void modify(Attendance attendance) {
		this.getHibernateTemplate().update(attendance);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Integer findCount() {
		String hql = "select count(*) from Attendance";
		
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
		
			return list.get(0).intValue();
		}
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Attendance> findByPage(Integer begin, Integer pageSize) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Attendance.class);
		List<Attendance> list=(List<Attendance>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

	@Override
	public List<Attendance> find() {
		String hql="from Attendance";
		return (List<Attendance>) this.getHibernateTemplate().find(hql, new Object[]{});
	}

}