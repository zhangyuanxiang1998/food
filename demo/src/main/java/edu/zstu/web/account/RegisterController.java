package edu.zstu.web.account;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.zstu.entity.User;
import edu.zstu.json.JsonReaderResponse;
import edu.zstu.service.UserService;


/**
 * 用户注册的Controller.
 *  * @author tlb
 */
@Controller
@RequestMapping(value = "/reg")
public class RegisterController {

	@Autowired
	private UserService userService;
	
	/**
	 * 用户注册
	 * @param reg
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String reg() {
		return "reg";
	}
	@RequestMapping(method = RequestMethod.POST)
	private @ResponseBody String registerPersonal(String loginName,String password){
		if(this.checkLoginName(loginName)){
			User u = new User();
			u.setLoginName(loginName);
			u.setPassword(password);
			this.userService.regUser(u);
			return "{\"success\":true,\"msg\":\"注册成功,立即登录！\"}";
		}
		return "{\"success\":false,\"msg\":\"用户名已存在!\"}";
	}
	

	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value = "checkLoginName")
	public @ResponseBody Boolean checkLoginName(@RequestParam("loginName") String loginName) {
		if (this.userService.findByLoginName(loginName) == null) {
			return true;
		} else {
			return false;
		}
	}
	
//	/*返回用户列表-TEST*/
//	@RequestMapping(value = "getUsers", method = RequestMethod.GET)
//	public @ResponseBody
//	JsonReaderResponse<User> getUsers(
//			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
//			@RequestParam(value = "start", defaultValue = "0") int start,
//			@RequestParam(value = "limit", defaultValue = "5") int pageSize,
//			@RequestParam(value = "sort", defaultValue = "") String sort) {
//		Map<String, Object> searchParams = new HashMap<String, Object>();
//		searchParams.put("LIKE_loginName", "t.cn");		
//		Page<User> list = this.userService.getList(searchParams, pageNumber,pageSize, sort, User.class);
//		return new JsonReaderResponse<User>(list, pageSize, pageNumber);
//	}
	
}
