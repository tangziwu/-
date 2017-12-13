package com.ssh.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.util.StringUtils;

import com.ssh.pojo.Owner;

public class OwnerDao extends HibernateDaoSupport{

	/**
	 * 添加业主信息
	 * @param home
	 */
	public void addOwner(Owner owner){
		this.getHibernateTemplate().save(owner);
	}
	
	/**
	 * 修改业主信息
	 * @param home
	 */
	public void modifyOwner(Owner owner){
		this.getHibernateTemplate().update(owner);
	}
	
	/**
	 * 删除
	 */
	public void removeOwner(Owner owner){
		this.getHibernateTemplate().delete(owner);
	}
	
	/**
	 * 根据ID查询
	 */
	public Owner findById(Integer oid){
		return this.getHibernateTemplate().get(Owner.class, oid);
	}
	
	/**
	 * 根据姓名，身份证查找oid
	 */
	public Integer findOid(String oname,String ocarder){
		String temphql = "select oid from Owner where 1=1 ";
		if(!StringUtils.isEmpty(oname)){
			temphql += " and o_name = :oname";
		}
		if(!StringUtils.isEmpty(ocarder)){
			temphql += " and o_carder = :ocarder";
		}
		final String hql = temphql;
		return this.getHibernateTemplate().executeWithNativeSession(
				new HibernateCallback<Integer>() {
					@Override
					public Integer doInHibernate(Session session) throws HibernateException {
						Query query = session.createQuery(hql);
						if(!StringUtils.isEmpty(oname)){
							query.setParameter("oname", oname);
						}
						if(!StringUtils.isEmpty(ocarder)){
							query.setParameter("ocarder", ocarder);
						}
						return (Integer) query.uniqueResult();
					}
				});
	}
	
	/**
	 * 总记录数
	 */
	public Integer getTotal(String o_name) {
		String temphql = "select count(o_id) from Owner where 1=1 ";
		if(!StringUtils.isEmpty(o_name)){
			temphql += " and o_name like :o_name";
		}
		final String hql = temphql;
		return this.getHibernateTemplate().executeWithNativeSession(
				new HibernateCallback<Integer>() {
					@Override
					public Integer doInHibernate(Session session) throws HibernateException {
						Query query = session.createQuery(hql);
						if(!StringUtils.isEmpty(o_name)){
							query.setParameter("o_name", "%"+o_name+"%");
						}
						return Integer.parseInt(String.valueOf((Long)query.uniqueResult()));
					}
				});
	}

	/**
	 * 分页数据
	 */
	public List<Owner> findPageOwner(Integer h_page, Integer row, String o_name) {
		String temphql = "from Owner where 1=1 ";
		if(!StringUtils.isEmpty(o_name)){
			temphql += " and o_name like :o_name";
		}
		temphql += " order by o_id";
		final String hql = temphql;
		return this.getHibernateTemplate().executeWithNativeSession(
				new HibernateCallback<List<Owner>>() {
					@SuppressWarnings("unchecked")
					@Override
					public List<Owner> doInHibernate(Session session) throws HibernateException {
						Query query = session.createQuery(hql);
						if(!StringUtils.isEmpty(o_name)){
							query.setParameter("o_name", "%"+o_name+"%");
						}
						query.setFirstResult(row*(h_page-1));//起始索引
						query.setMaxResults(row);	//最大数据条数
						return query.list();
					}
				});
	}
	
	/**
	 * 通讯录
	 */
	public List<Owner> findByName(String oname){
		String temphql = "from Owner where 1=1 ";
		if(!StringUtils.isEmpty(oname)){
			temphql += " and o_name like :oname";
		}
		final String hql = temphql;
		return this.getHibernateTemplate().executeWithNativeSession(
			new HibernateCallback<List<Owner>>() {
				@SuppressWarnings("unchecked")
				@Override
				public List<Owner> doInHibernate(Session session) throws HibernateException {
					Query query = session.createQuery(hql);
					if(!StringUtils.isEmpty(oname)){
						query.setParameter("oname", "%"+oname+"%");
					}
					return query.list();
				}
			});	
	}
}
