package edu.zstu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import edu.zstu.entity.ActivityOrder;
import edu.zstu.entity.Food;
import edu.zstu.entity.FoodCollect;
import edu.zstu.entity.User;

public interface FoodCollectDao extends BaseDao<FoodCollect> {

	List<FoodCollect> findByUserAndFood(User user, Food food);
	List<FoodCollect> findByUser(User user);

	@Modifying
	@Query(value="delete from FOOD_COLLECT WHERE FOOD_ID=?1 AND USER_ID=?2",nativeQuery=true)
	void deleteByFoodIdAndUserId(Long foodId, Long userId);



}
