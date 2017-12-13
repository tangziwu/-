package com.ssh.service;

import java.util.List;

import com.ssh.dao.ComplaintDao;
import com.ssh.pojo.Complaint;
import com.ssh.pojo.Inform;
import com.ssh.pojo.PageBean;


public class ComplaintService {
	
	private ComplaintDao complaintDao;

	//按id查询
	public  Complaint  findById(Integer  id){
		
		return this.complaintDao.findById(id);
		
	}
	
	
	//查询总记录数
	public  int  findTotal(){
		
		return  this.complaintDao.findTotal();
		
		
	}
	//查询总记录数
		public  int  findTotal1(){
			
			return  this.complaintDao.findTotal1();
			
			
		}
	
	public Integer findCount() {
		// TODO Auto-generated method stub
		return complaintDao.findCount();
	}

	
	public PageBean<Complaint> findPage(Integer currPage) {
		PageBean<Complaint> pageBean=new PageBean<Complaint>();
		//封装当前页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize=11;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount=complaintDao.findCount();
		pageBean.setTotalCount(totalCount);
		//封装总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页的数据
		int begin=(currPage - 1)*pageSize;
		List<Complaint> list=complaintDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	
	public int find1(){
		return complaintDao.findTotal1();
	}
	public int find2(){
		return complaintDao.findTotal2();
	}
	public int find3(){
		return complaintDao.findTotal3();
	}
	public  void  add(Complaint complaint){//新增
		this.complaintDao.add(complaint);
		
	}
	
	
	
	public  void  modify(Complaint complaint){//修改
		this.complaintDao.modify(complaint);
		
	}
	
	
	
	
	public  void  remove(Complaint complaint){//删除
		this.complaintDao.remove(complaint);
		
	}
	
	
	
   public List<Complaint> find(){
	   return this.complaintDao.find();
   }
	
	
	public  List<Complaint>  findByName(String  compreType){//模糊查询
		
		return this.complaintDao.findByName(compreType);
		
	}
	
	
	//
	
	public void setComplaintDao(ComplaintDao complaintDao) {
		this.complaintDao = complaintDao;
	}
	
	
	
	

}
