package edu.zstu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import edu.zstu.entity.Activity;
import edu.zstu.entity.ActivityOrder;
import edu.zstu.entity.Food;
import edu.zstu.entity.FoodCollect;
import edu.zstu.entity.User;


public interface ActivityOrderDao extends BaseDao<ActivityOrder> {

	List<ActivityOrder> findByUserAndActivity(User user, Activity activity);
	List<ActivityOrder> findByUser(User user);

	@Modifying
	@Query(value="delete from ACTIVITY_ORDER WHERE ACTIVITY_ID=?1 AND USER_ID=?2",nativeQuery=true)
	void deleteByActivityIdAndUserId(Long activityId, Long userId);



}
