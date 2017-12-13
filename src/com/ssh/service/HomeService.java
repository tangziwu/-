package com.ssh.service;

import java.util.List;

import com.ssh.dao.HomeDao;
import com.ssh.dao.OwnerDao;
import com.ssh.pojo.Home;

public class HomeService {
	private HomeDao homeDao;
	private OwnerDao ownerDao;
	
	public Home findByHnum(Integer hnum){
		return homeDao.findByHnum(hnum);
	}
	
	public Integer findOid(String oname,String ocarder){
		return ownerDao.findOid(oname,ocarder);
	}
	
	public void addHome(Home home){
		homeDao.addHome(home);
	}
	
	public void modifyHome(Home home){
		homeDao.modifyHome(home);
	}
	
	public void removeHome(Home home){
		homeDao.removeHome(home);
	}
	
	public Home findById(Integer hid){
		return homeDao.findById(hid);
	}
	
	public Integer getTotal(String h_type,String h_state,String h_bulid,String h_unit,String h_floor){
		return homeDao.getTotal(h_type, h_state, h_bulid, h_unit, h_floor);
	}
	
	public List<Home> findPageHome(Integer h_page,Integer row,String h_type,String h_state,String h_bulid,String h_unit,String h_floor){
		return homeDao.findPageHome(h_page, row, h_type, h_state, h_bulid, h_unit, h_floor);
	}
	
	public HomeDao getHomeDao() {
		return homeDao;
	}

	public void setHomeDao(HomeDao homeDao) {
		this.homeDao = homeDao;
	}

	public OwnerDao getOwnerDao() {
		return ownerDao;
	}

	public void setOwnerDao(OwnerDao ownerDao) {
		this.ownerDao = ownerDao;
	}
	
	
}
