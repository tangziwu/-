package com.ssh.service;

import java.util.List;

import com.ssh.pojo.Leave;
import com.ssh.pojo.PersonLeave;



public interface LeaveService2 {
     
	        //新增
			public void add(PersonLeave leave);
			//更新
			public void modify(PersonLeave leave );
			//根据id删除
			public void remove(PersonLeave leave );
			//根据id查找
			public PersonLeave  findById(Integer id);
			//查找列表
			public List<PersonLeave> find();
			
			public List<PersonLeave> find1();
}
