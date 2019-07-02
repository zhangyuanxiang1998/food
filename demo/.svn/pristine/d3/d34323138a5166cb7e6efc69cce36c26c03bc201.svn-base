package edu.zstu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import edu.zstu.entity.FileAttach;
import edu.zstu.repository.FileAttachDao;



//Spring Bean的标识.
@Component
//默认将类中的所有public函数纳入事务管理.
@Transactional
public class FileAttachService extends CrudService<FileAttach, FileAttachDao>{
	@Autowired
	private FileAttachDao dao;
	
	@Override
	protected FileAttachDao getDao() {
		return dao;
	}
	

}
