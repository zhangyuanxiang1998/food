package edu.zstu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import edu.zstu.entity.Activity;
import edu.zstu.repository.ActivityDao;



//Spring Bean的标识.
@Component
//默认将类中的所有public函数纳入事务管理.
@Transactional
public class ActivityService extends CrudService<Activity, ActivityDao>{
	@Autowired
	private ActivityDao dao;
	
	@Override
	protected ActivityDao getDao() {
		return dao;
	}



}
