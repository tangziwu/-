package com.ssh.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ssh.pojo.FileTransfer;
import com.ssh.pojo.User;

public class FileWordDaoImpl extends BaseDaoImpl<FileTransfer> implements FileWordDao{

	@Override
	public List<FileTransfer> findByPage(Integer begin, Integer pageSize) {
		DetachedCriteria criteria=DetachedCriteria.forClass(FileTransfer.class);
		List<FileTransfer> list=(List<FileTransfer>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

	@Override
	public Integer findCount() {
		 String hql = "select count(*) from FileTransfer";
			
			List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
			if (list.size() > 0) {
			
				return list.get(0).intValue();
			}
			return 0;
	}
    
}
