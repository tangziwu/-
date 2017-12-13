package com.ssh.service;

import java.util.List;

import com.ssh.dao.InformDao;
import com.ssh.pojo.FileTransfer;
import com.ssh.pojo.Inform;
import com.ssh.pojo.PageBean;


public class InformService {
	
	
	
	private  InformDao  informDao;//注入dao方法

	//按id查询
	public Inform  findById(Integer id){
		
		return  this.informDao.findById(id);
		
	}
	
	
	
	
	public  int findTotal(){//查询记录总数
		return this.informDao.findTotal();
		
	}
	
	
	public  List<Inform>  find(){//查询所有
		
		return this.informDao.find();
	}
    
    public  List<Inform>  find1(){//查询所有
		
		return this.informDao.find1();
	}
	public  void  moidfy(Inform inform){//修改
		
		this.informDao.modify(inform);
	}

	
	public  void  remove(Inform inform){//删除
		
		this.informDao.remove(inform);
	}

	
	public  void  add(Inform inform){//新增
		
		this.informDao.add(inform);
	}

	
	
	public List<Inform> findByName(String title){//按通知标题来模糊查询
		
		return this.informDao.findByName(title);
		
	}
	
	
	
	
	public void setInformDao(InformDao informDao) {
		this.informDao = informDao;
	}
	

	public Integer findCount() {
		// TODO Auto-generated method stub
		return informDao.findCount();
	}

	
	public PageBean<Inform> findPage(Integer currPage) {
		PageBean<Inform> pageBean=new PageBean<Inform>();
		//封装当前页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize=11;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount=informDao.findCount();
		pageBean.setTotalCount(totalCount);
		//封装总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页的数据
		int begin=(currPage - 1)*pageSize;
		List<Inform> list=informDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	

}
