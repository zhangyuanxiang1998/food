package edu.zstu.web.portal;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.zstu.entity.Activity;
import edu.zstu.entity.ActivityOrder;
import edu.zstu.entity.Food;
import edu.zstu.entity.FoodCollect;
import edu.zstu.entity.User;
import edu.zstu.json.JsonReaderResponse;
import edu.zstu.service.ActivityService;
import edu.zstu.service.ActivityOrderService;
import edu.zstu.service.FoodCollectService;
import edu.zstu.service.FoodService;
import edu.zstu.service.UserService;

@Controller
@RequestMapping(value="/portal")
public class UrlControl {
	@Autowired
	private UserService userService;
	
	@Autowired
	private FoodService foodService;

	@Autowired
	private FoodCollectService foodCollectService;
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private ActivityOrderService activityOrderService;
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(Model model) {
		//model.addAttribute("message", "欢迎光临！");
		return "index";
	}
	
/*	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}*/
	
	@RequestMapping(value = "food", method = RequestMethod.GET)
	public String food() {
		return "food";
	}
	
	@RequestMapping(value = "activity", method = RequestMethod.GET)
	public String activity(Model model) {
		User user=this.userService.getCurrentUser();
		if(user!=null){
			List<ActivityOrder> activityOrder=this.activityOrderService.findByUser(user);
			model.addAttribute("userOrders",activityOrder);
		}
		return "activity";
	}
	
//	美食详情	
//	@RequestMapping(value = "foodDetail", method = RequestMethod.GET)
//	public String foodDetail() {
//		return "foodDetail";
//	}
	@RequestMapping(value="/foodDetail")
	public String foodDetail(@RequestParam(value="id")Long id,Model model){
		if(id!=null && id.longValue()!=0){
			Food food =this.foodService.findOne(id);
			if(food!=null){
				model.addAttribute("food",food);
				User user=this.userService.getCurrentUser();
				if(user!=null){
					List<FoodCollect> collects=this.foodCollectService.findByUserAndFood(user,food);
					if(collects!=null && collects.size()>0){
						model.addAttribute("collectFlag",true);
					}else{
						model.addAttribute("collectFlag",false);
					}
				}else{
					model.addAttribute("collectFlag",false);
				}
			}
		}
		return "foodDetail";
	}
	
	@RequestMapping(value = "getCurrentUser", method = RequestMethod.GET)
	public @ResponseBody User getCurrentUser() {
		return this.userService.getCurrentUser();
	}
	
//	获取美食列表
	@RequestMapping(value="getFoods",method=RequestMethod.GET)
	public @ResponseBody JsonReaderResponse<Food> getFoods(
			@RequestParam(value="page",defaultValue="1")int pageNumber,
			@RequestParam(value="limit",defaultValue="5")int pageSize,
			@RequestParam(value="sort",defaultValue="")String sort,
			String foodName,String deployUser,String startDate,String endDate) throws ParseException{
		Map<String,Object> searchParams=new HashMap<String,Object>();
		if(StringUtils.isNotBlank(foodName)){
			searchParams.put("LIKE_foodName",foodName);
		}
		if(StringUtils.isNotBlank(deployUser)){
			searchParams.put("LIKE_user.loginName",deployUser);
		}
		if(StringUtils.isNotBlank(startDate)){
			searchParams.put("GTE_deployDate",startDate);
		}
		if(StringUtils.isNotBlank(endDate)){
			searchParams.put("LTE_deployDate",endDate);
		}
		Page<Food> list=this.foodService.getList(searchParams,pageNumber,pageSize,sort,Food.class);
		return new JsonReaderResponse<Food>(list,pageSize,pageNumber);
	}
//	获取活动列表
	@RequestMapping(value="getActivities",method=RequestMethod.GET)
	public @ResponseBody JsonReaderResponse<Activity> getActivities(
			@RequestParam(value="page",defaultValue="1")int pageNumber,
			@RequestParam(value="limit",defaultValue="5")int pageSize,
			@RequestParam(value="sort",defaultValue="")String sort,
			String activityName,String deployUser,String activityTimeStart,String activityTimeEnd,String activityArea,
			String activityAddress,String activityContent) throws ParseException{
		Map<String,Object> searchParams=new HashMap<String,Object>();
		if(StringUtils.isNotBlank(activityName)){
			searchParams.put("LIKE_activityName",activityName);
		}
		if(StringUtils.isNotBlank(deployUser)){
			searchParams.put("LIKE_user.loginName",deployUser);
		}
		if(StringUtils.isNotBlank(activityArea)){
			searchParams.put("LIKE_activityArea",activityArea);
		}
		if(StringUtils.isNotBlank(activityTimeStart)){
			searchParams.put("LIKE_activityTimeStart",activityTimeStart);
		}
		if(StringUtils.isNotBlank(activityTimeEnd)){
			searchParams.put("LIKE_activityTimeEnd",activityTimeEnd);
		}
		if(StringUtils.isNotBlank(activityAddress)){
			searchParams.put("LIKE_activityAddress",activityAddress);
		}
		if(StringUtils.isNotBlank(activityContent)){
			searchParams.put("LIKE_activityContent",activityContent);
		}
		Page<Activity> list=this.activityService.getList(searchParams,pageNumber,pageSize,sort,Activity.class);
		return new JsonReaderResponse<Activity>(list,pageSize,pageNumber);
	}
	
	/**
	 * Ajax请求增加点赞数
	 */
	@RequestMapping(value = "foodLikes")
	public @ResponseBody Boolean foodLikes(@RequestParam("id") Long id) {
		Food food=this.foodService.findOne(id);
		if(food!=null){
			food.setFoodLikes(food.getFoodLikes()+1);				
			this.foodService.save(food);
			return true;
		}
		return false;
	}
	
	/*管理页获取收藏的美食*/
	@RequestMapping(value = "getFoodsManage", method = RequestMethod.GET)
	public @ResponseBody List<FoodCollect> getFoodsManage()  {
		User user=this.userService.getCurrentUser();
		List<FoodCollect> list = this.foodCollectService.findByUser(user);
		return list;
	}
	
	/*管理页获取预约的活动*/
	@RequestMapping(value = "getActivitiesManage", method = RequestMethod.GET)
	public @ResponseBody List<ActivityOrder> getActivitiesManage()  {
		User user=this.userService.getCurrentUser();
		List<ActivityOrder> list = this.activityOrderService.findByUser(user);
		return list;
	}
}
