package com.ssh.service;

import java.util.List;

import com.ssh.pojo.Leave;



public interface LeaveService {
     
	        //新增
			public void add(Leave leave);
			//更新
			public void modify(Leave leave );
			//根据id删除
			public void remove(Leave leave );
			//根据id查找
			public Leave  findById(Integer id);
			//查找列表
			public List<Leave> find();
}
