package com.ssh.service;

import java.util.List;

import com.ssh.pojo.Leave;



public interface LeaveService {
     
	        //����
			public void add(Leave leave);
			//����
			public void modify(Leave leave );
			//����idɾ��
			public void remove(Leave leave );
			//����id����
			public Leave  findById(Integer id);
			//�����б�
			public List<Leave> find();
}
