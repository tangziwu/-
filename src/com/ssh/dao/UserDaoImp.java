package com.ssh.dao;

import static org.hamcrest.CoreMatchers.theInstance;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ssh.pojo.Attendance;
import com.ssh.pojo.User;

public class UserDaoImp extends HibernateDaoSupport implements UserDao{

	

	@SuppressWarnings("unchecked")
	@Override
	public List<User> find(String account) {
		String hql=" from User where account=?";
		return (List<User>) this.getHibernateTemplate().find(hql, account);
	}

	
	@Override
	public List<User> find(User user) {
		
		String hql="from User u where u.account=? and u.password=?";
		return (List<User>) this.getHibernateTemplate().find(hql,  new String[]{user.getAccount(),user.getPassword()});
	}


	@Override
	public void add(User user) {
		
		this.getHibernateTemplate().save(user);
		
	}


	@Override
	public void modify(User user) {
		
		this.getHibernateTemplate().update(user);
		
	}


	@Override
	public void remove(User user) {
		this.getHibernateTemplate().delete(user);
		
	}


	@Override
	public List<User> find() {
		String hql="from User";
		return (List<User>) this.getHibernateTemplate().find(hql, new Object[]{});
	}


	@Override
	public User find(Integer id) {
		
		return this.getHibernateTemplate().get(User.class, id);
	}
     
	@Override
	public User find1(Integer id) {
		
		return this.getHibernateTemplate().get(User.class, id);
	}

	@Override
	public void modifypassword(User user) {
		
		this.getHibernateTemplate().update(user);
		
	}


	@Override
	public Integer findCount() {
         String hql = "select count(*) from User";
		
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
		
			return list.get(0).intValue();
		}
		return 0;
	}


	@Override
	public List<User> findByPage(Integer begin, Integer pageSize) {
		DetachedCriteria criteria=DetachedCriteria.forClass(User.class);
		List<User> list=(List<User>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}


	@Override
	public User find2(Integer id) {
		
		return this.getHibernateTemplate().get(User.class, id);

	}


	

}
