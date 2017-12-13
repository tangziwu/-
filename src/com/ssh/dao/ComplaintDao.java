package com.ssh.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ssh.pojo.Complaint;
import com.ssh.pojo.Inform;



public class ComplaintDao  extends HibernateDaoSupport{
	
	
	//按id查询
	public  Complaint   findById(Integer id){
		
		return this.getHibernateTemplate().get(Complaint.class, id);
		
		
	}
	
	//记录总数
	public  int  findTotal(){
		String  hql=" from Complaint  ";
		return  this.getHibernateTemplate().find(hql, new Object[]{}).size();
		
	}
	
	//查询yi处理
	public  int  findTotal1(){
		String  hql=" select count(*) from Complaint where compre_State='已处理'";
		return  this.getHibernateTemplate().executeWithNativeSession(new HibernateCallback<Integer>() {
			@Override
			public Integer doInHibernate(Session session) throws HibernateException{
				Query query =session.createQuery(hql);
				Long i = (Long) query.uniqueResult();
				int count = new Long(i).intValue();
				return count;
			}
		});
		
	}
	
	
	//查询正在处理
	public  int  findTotal2(){
		String  hql=" select count(*) from Complaint where compre_State='正在审核'";
		return  this.getHibernateTemplate().executeWithNativeSession(new HibernateCallback<Integer>() {
			@Override
			public Integer doInHibernate(Session session) throws HibernateException{
				Query query =session.createQuery(hql);
				Long i = (Long) query.uniqueResult();
				int count = new Long(i).intValue();
				return count;
			}
		});
		
	}
	//查询未处理
	public  int  findTotal3(){
		String  hql=" select count(*) from Complaint where compre_State='未处理'";
		return  this.getHibernateTemplate().executeWithNativeSession(new HibernateCallback<Integer>() {
			@Override
			public Integer doInHibernate(Session session) throws HibernateException{
				Query query =session.createQuery(hql);
				Long i = (Long) query.uniqueResult();
				int count = new Long(i).intValue();
				return count;
			}
		});
		
	}
	public Integer findCount() {
		String hql = "select count(*) from Complaint";
		
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
		
			return list.get(0).intValue();
		}
		return 0;
	}

	
	public List<Complaint> findByPage(Integer begin, Integer pageSize) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Complaint.class);
		List<Complaint> list=(List<Complaint>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}
	
	
public  void  add(Complaint complaint){//新增
		
		this.getHibernateTemplate().save(complaint);

	}
	
	public  void  modify(Complaint complaint){//修改
		
		this.getHibernateTemplate().update(complaint);
		
	}
	
	
	public  void  remove(Complaint complaint){//删除
		
		this.getHibernateTemplate().delete(complaint);
		
	}

	
	public  List<Complaint>  find(){//查询所有
		
		String  hql=" from Complaint ";
		
		return  (List<Complaint>) this.getHibernateTemplate().find(hql, new Object[]{});
		
		
	}
	
	
	public   List<Complaint> findByName(final String  compreType){//模糊查询
		
		String  tem =" from Complaint  where 1=1 ";
	 if(compreType!=null){
		 
		 tem+=" and  compreType like :compreType";
	 }
		final  String hql =tem;
		return  this.getHibernateTemplate().executeWithNativeSession( new HibernateCallback<List<Complaint>>() {

			@Override
			public List<Complaint> doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery(hql);
				query.setParameter("compreType", "%"+compreType+"%");
				
				
				return query.list();
			}
		});
		
	}
	
	

}
