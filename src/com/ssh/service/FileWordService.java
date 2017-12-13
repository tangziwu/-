package com.ssh.service;

import java.util.List;

import com.ssh.pojo.FileTransfer;
import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;



public interface FileWordService {
      
	    //新增
		public void add(FileTransfer fileTransfer);
		//更新
		public void modify(FileTransfer fileTransfer );
		//根据id删除
		public void remove(FileTransfer fileTransfer );
		//根据id查找
		public FileTransfer  findById(Integer id);
		//查找列表
		public List<FileTransfer> find();
		
		
		 Integer findCount();
		
		PageBean<FileTransfer> findPage(Integer currPage);
		
	
}
