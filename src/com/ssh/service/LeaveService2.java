package com.ssh.service;

import java.util.List;

import com.ssh.pojo.Leave;
import com.ssh.pojo.PersonLeave;



public interface LeaveService2 {
     
	        //����
			public void add(PersonLeave leave);
			//����
			public void modify(PersonLeave leave );
			//����idɾ��
			public void remove(PersonLeave leave );
			//����id����
			public PersonLeave  findById(Integer id);
			//�����б�
			public List<PersonLeave> find();
			
			public List<PersonLeave> find1();
}
