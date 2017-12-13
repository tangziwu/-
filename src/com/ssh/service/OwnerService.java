package com.ssh.service;

import java.util.List;

import com.ssh.dao.OwnerDao;
import com.ssh.pojo.Owner;

public class OwnerService {
	private OwnerDao ownerDao;

	public void addHome(Owner owner){
		ownerDao.addOwner(owner);
	}
	
	public void modifyHome(Owner owner){
		ownerDao.modifyOwner(owner);
	}
	
	public void removeHome(Owner owner){
		ownerDao.removeOwner(owner);
	}
	
	public Owner findById(Integer oid){
		return ownerDao.findById(oid);
	}
	
	public OwnerDao getOwnerDao() {
		return ownerDao;
	}
	
	public List<Owner> findByName(String oname){
		return this.ownerDao.findByName(oname);
	}

	public void setOwnerDao(OwnerDao ownerDao) {
		this.ownerDao = ownerDao;
	}

	public Integer getTotal(String o_name) {
		return this.ownerDao.getTotal(o_name);
	}

	public List<Owner> findPageOwner(Integer h_page, Integer row, String o_name) {
		return this.ownerDao.findPageOwner(h_page,row,o_name);
	}
	
	
}
