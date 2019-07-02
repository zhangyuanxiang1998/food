package edu.zstu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import edu.zstu.entity.Food;
import edu.zstu.repository.FoodDao;



//Spring Bean的标识.
@Component
//默认将类中的所有public函数纳入事务管理.
@Transactional
public class FoodService extends CrudService<Food, FoodDao>{
	@Autowired
	private FoodDao dao;
	
	@Override
	protected FoodDao getDao() {
		return dao;
	}
	

}
