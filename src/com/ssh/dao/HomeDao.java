package com.ssh.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.util.StringUtils;

import com.ssh.pojo.Home;

public class HomeDao extends HibernateDaoSupport{
	
	/**
	 * 添加房产信息
	 * @param home
	 */
	public void addHome(Home home){
		this.getHibernateTemplate().save(home);
	}
	
	/**
	 * 修改房产信息
	 * @param home
	 */
	public void modifyHome(Home home){
		this.getHibernateTemplate().update(home);
	}
	
	/**
	 * 删除
	 */
	public void removeHome(Home home){
		this.getHibernateTemplate().delete(home);
	}
	
	/**
	 * 根据ID查询
	 */
	public Home findById(Integer hid){
		return this.getHibernateTemplate().get(Home.class, hid);
	}
	
	/**
	 * 根据房产门牌编号查询房产信息
	 */
	public Home findByHnum(Integer hnum){
		String temphql = "from Home where 1=1 ";
		if(hnum!=null){
			temphql += " and h_number = :hnum";
		}
		final String hql = temphql;
		return this.getHibernateTemplate().executeWithNativeSession(
				new HibernateCallback<Home>() {
					@Override
					public Home doInHibernate(Session session) throws HibernateException {
						Query query = session.createQuery(hql);
						if(hnum!=null){
							query.setParameter("hnum", hnum);
						}
						return (Home) query.uniqueResult();
					}
		});
	}
	
	/**
	 * 总记录数
	 */
	public Integer getTotal(String h_type,String h_state,String h_bulid,String h_unit,String h_floor){
		String temphql = "select count(h_id) from Home where 1=1 ";
		if(!StringUtils.isEmpty(h_type)){
			temphql += " and h_type = :h_type";
		}
		if(!StringUtils.isEmpty(h_state)){
			temphql += " and h_state = :h_state";
		}
		if(!StringUtils.isEmpty(h_bulid)){
			temphql += " and h_bulid = :h_bulid";
		}
		if(!StringUtils.isEmpty(h_unit)){
			temphql += " and h_unit = :h_unit";
		}
		if(!StringUtils.isEmpty(h_floor)){
			temphql += " and h_floor = :h_floor";
		}
		final String hql = temphql;
		return this.getHibernateTemplate().executeWithNativeSession(
				new HibernateCallback<Integer>() {
					@Override
					public Integer doInHibernate(Session session) throws HibernateException {
						Query query = session.createQuery(hql);
						if(!StringUtils.isEmpty(h_type)){
							query.setParameter("h_type", h_type);
						}
						if(!StringUtils.isEmpty(h_state)){
							query.setParameter("h_state", h_state);
						}
						if(!StringUtils.isEmpty(h_bulid)){
							query.setParameter("h_bulid", h_bulid);
						}
						if(!StringUtils.isEmpty(h_unit)){
							query.setParameter("h_unit", h_unit);
						}
						if(!StringUtils.isEmpty(h_floor)){
							query.setParameter("h_floor", h_floor);
						}
						Long count = (Long) query.uniqueResult();
						Integer newCount = Integer.parseInt(String.valueOf(count));
						return newCount;
					}
				});
	}
	
	/**
	 * 分页数据
	 */
	public List<Home> findPageHome(Integer h_page,Integer row,String h_type,String h_state,String h_bulid,String h_unit,String h_floor){
		String temphql = "from Home where 1=1 ";
		if(!StringUtils.isEmpty(h_type)){
			temphql += " and h_type = :h_type";
		}
		if(!StringUtils.isEmpty(h_state)){
			temphql += " and h_state = :h_state";
		}
		if(!StringUtils.isEmpty(h_bulid)){
			temphql += " and h_bulid = :h_bulid";
		}
		if(!StringUtils.isEmpty(h_unit)){
			temphql += " and h_unit = :h_unit";
		}
		if(!StringUtils.isEmpty(h_floor)){
			temphql += " and h_floor = :h_floor";
		}
		temphql += " order by h_number";
		final String hql = temphql;
		return this.getHibernateTemplate().executeWithNativeSession(
				new HibernateCallback<List<Home>>() {
					@SuppressWarnings("unchecked")
					@Override
					public List<Home> doInHibernate(Session session) throws HibernateException {
						Query query = session.createQuery(hql);
						if(!StringUtils.isEmpty(h_type)){
							query.setParameter("h_type", h_type);
						}
						if(!StringUtils.isEmpty(h_state)){
							query.setParameter("h_state", h_state);
						}
						if(!StringUtils.isEmpty(h_bulid)){
							query.setParameter("h_bulid", h_bulid);
						}
						if(!StringUtils.isEmpty(h_unit)){
							query.setParameter("h_unit", h_unit);
						}
						if(!StringUtils.isEmpty(h_floor)){
							query.setParameter("h_floor", h_floor);
						}
						query.setFirstResult(row*(h_page-1));//起始索引
						query.setMaxResults(row);	//最大数据条数
						return query.list();
					}
				});
	}
	
}
