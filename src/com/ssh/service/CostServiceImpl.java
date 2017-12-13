package com.ssh.service;

import java.util.List;

import com.ssh.dao.CostDao;
import com.ssh.pojo.Cost;
import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;



public class CostServiceImpl implements CostService {
	private CostDao costDao;
	@Override
	public List<Cost> find() {
		return costDao.find();
	}

	@Override
	public List<Cost> find(Integer HId) {
		return costDao.find(HId);
	}

	@Override
	public void modify(Cost cost) {
		costDao.modify(cost);
	}

	public void setCostDao(CostDao costDao) {
		this.costDao = costDao;
	}

	
	@Override
	public Cost findById(Integer CId) {
		return this.costDao.findById(CId);
	}

	@Override
	public void add(Cost cost) {
		
		costDao.add(cost);
		
	}

	@Override
	public Integer findCount() {
		// TODO Auto-generated method stub
		return costDao.findCount();
	}


	@Override
	public PageBean<Cost> findPage(Integer currPage) {
		
		PageBean<Cost> pageBean=new PageBean<Cost>();
		//封装当前页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize=11;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount=costDao.findCount();
		pageBean.setTotalCount(totalCount);
		//封装总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页的数据
		int begin=(currPage - 1)*pageSize;
		List<Cost> list=costDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	


}
