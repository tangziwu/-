package com.ssh.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ssh.pojo.Attendance;
import com.ssh.pojo.Inform;


public class InformDao  extends HibernateDaoSupport{
	
	//按id查询
	public   Inform  findById(Integer id){
		
		return  this.getHibernateTemplate().get(Inform.class, id);
	}
	
	//记录总数
	public  int  findTotal(){
		String  hql=" from Inform ";
		return  this.getHibernateTemplate().find(hql, new Object[]{}).size();
		
	}
	
	public Integer findCount() {
		String hql = "select count(*) from Inform";
		
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list.size() > 0) {
		
			return list.get(0).intValue();
		}
		return 0;
	}

	
	public List<Inform> findByPage(Integer begin, Integer pageSize) {
		DetachedCriteria criteria=DetachedCriteria.forClass(Inform.class);
		List<Inform> list=(List<Inform>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}
	
	
	
	
	
	
	
	public  void  add(Inform inform){//新增
		
		this.getHibernateTemplate().save(inform);

	}
	
	public  void  modify(Inform inform){//修改
		
		this.getHibernateTemplate().update(inform);
		
	}
	
	
	public  void  remove(Inform inform){//删除
		
		this.getHibernateTemplate().delete(inform);
		
	}

	
	public  List<Inform>  find(){//查询所有
		
		String  hql=" from Inform ";
		
		return  (List<Inform>) this.getHibernateTemplate().find(hql, new Object[]{});
		
		
	}
	
     public  List<Inform>  find1(){//查询所有
		
		String  hql=" from Inform ";
		
		return  (List<Inform>) this.getHibernateTemplate().find(hql, new Object[]{});
		
		
	}
	
	public   List<Inform> findByName(final String  title){//模糊查询
		
		String  tem =" from Inform  where 1=1 ";
	 if(title!=null){
		 
		 tem+=" and  title like :title";
	 }
		final  String hql =tem;
		return  this.getHibernateTemplate().executeWithNativeSession( new HibernateCallback<List<Inform>>() {

			@Override
			public List<Inform> doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery(hql);
				query.setParameter("title", "%"+title+"%");
				
				
				return query.list();
			}
		});
		
	}
	
	
	
}
