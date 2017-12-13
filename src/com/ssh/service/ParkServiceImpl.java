package com.ssh.service;

import com.ssh.dao.ParkDao;
import com.ssh.pojo.Park;


public class ParkServiceImpl implements ParkService {
	private ParkDao parkDao;
	@Override
	public Park find(Integer hid) {
		return parkDao.find(hid);
	}
	public void setParkDao(ParkDao parkDao) {
		this.parkDao = parkDao;
	}

}
