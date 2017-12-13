package com.ssh.dao;

import java.util.List;

import com.ssh.pojo.FileTransfer;




public interface FileWordDao extends BaseDao<FileTransfer> {
	List<FileTransfer> findByPage(Integer begin,Integer pageSize);
	Integer findCount();
}
