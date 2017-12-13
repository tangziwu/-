package com.ssh.service;

import java.util.List;

import com.ssh.pojo.FileTransfer;
import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;



public interface FileWordService {
      
	    //����
		public void add(FileTransfer fileTransfer);
		//����
		public void modify(FileTransfer fileTransfer );
		//����idɾ��
		public void remove(FileTransfer fileTransfer );
		//����id����
		public FileTransfer  findById(Integer id);
		//�����б�
		public List<FileTransfer> find();
		
		
		 Integer findCount();
		
		PageBean<FileTransfer> findPage(Integer currPage);
		
	
}
