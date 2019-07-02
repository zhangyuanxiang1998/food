package edu.zstu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import edu.zstu.entity.Activity;
import edu.zstu.entity.ActivityOrder;
import edu.zstu.entity.Food;
import edu.zstu.entity.FoodCollect;
import edu.zstu.entity.User;
import edu.zstu.repository.ActivityOrderDao;



//Spring Bean的标识.
@Component
//默认将类中的所有public函数纳入事务管理.
@Transactional
public class ActivityOrderService extends CrudService<ActivityOrder, ActivityOrderDao>{
	@Autowired
	private ActivityOrderDao dao;
	
	@Override
	protected ActivityOrderDao getDao() {
		return dao;
	}

	public List<ActivityOrder> findByUserAndFood(User user, Activity activity) {
		// TODO Auto-generated method stub
		return this.getDao().findByUserAndActivity(user,activity);
	}

	public void deleteByActivityIdAndUserId(Long activityId, Long userId) {
		// TODO Auto-generated method stub
		this.getDao().deleteByActivityIdAndUserId(activityId,userId);
	}
	
	public List<ActivityOrder> findByUser(User user) {
		// TODO Auto-generated method stub
		return this.getDao().findByUser(user);
	}
}
