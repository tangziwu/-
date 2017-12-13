package com.ssh.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ssh.pojo.Cost;
import com.ssh.pojo.User;


public class CostDaoImpl extends HibernateDaoSupport implements CostDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Cost> find() {
		String hql = "from Cost";
		return (List<Cost>)this.getHibernateTemplate().find(hql, new Object[]{});
	}

	@Override
	public List<Cost> find(final Integer HId) {
		String tmphql = "from Cost where 1=1 ";
		if (HId != null) {
			tmphql += " and h_id = :hid ";
		}
		final String hql = tmphql;
		return this.getHibernateTemplate().executeWithNativeSession(new HibernateCallback<List<Cost>>() {

			@SuppressWarnings("unchecked")
			@Override
			public List<Cost> doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery(hql);
				if (HId != null) {
					query.setParameter("hid", HId);
				}
				return query.list();
			}
		});
	}

	@Override
	public void modify(Cost cost) {
		this.getHibernateTemplate().update(cost);

	}

	
	@Override
	public Cost findById(Integer CId) {
		return this.getHibernateTemplate().get(Cost.class, CId);
	}

	@Override
	public void add(Cost cost) {
		this.getHibernateTemplate().save(cost);
		
	}

	@Override
	public Integer findCount() {
         String hql = "select count(*) from Cost";
		
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
		
			return list.get(0).intValue();
		}
		return 0;
	}


	@Override
	public List<Cost> findByPage(Integer begin, Integer pageSize) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Cost.class);
		List<Cost> list=(List<Cost>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}
}
