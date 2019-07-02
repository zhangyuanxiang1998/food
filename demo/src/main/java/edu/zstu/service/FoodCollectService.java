package edu.zstu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import edu.zstu.entity.ActivityOrder;
import edu.zstu.entity.Food;
import edu.zstu.entity.FoodCollect;
import edu.zstu.entity.User;
import edu.zstu.repository.FoodCollectDao;



//Spring Bean的标识.
@Component
//默认将类中的所有public函数纳入事务管理.
@Transactional
public class FoodCollectService extends CrudService<FoodCollect, FoodCollectDao>{
	@Autowired
	private FoodCollectDao dao;
	
	@Override
	protected FoodCollectDao getDao() {
		return dao;
	}

	public List<FoodCollect> findByUserAndFood(User user, Food food) {
		// TODO Auto-generated method stub
		return this.getDao().findByUserAndFood(user,food);
	}

	public void deleteByFoodIdAndUserId(Long foodId, Long userId) {
		// TODO Auto-generated method stub
		this.getDao().deleteByFoodIdAndUserId(foodId,userId);
	}
	
	public List<FoodCollect> findByUser(User user) {
		// TODO Auto-generated method stub
		return this.getDao().findByUser(user);
	}
}
