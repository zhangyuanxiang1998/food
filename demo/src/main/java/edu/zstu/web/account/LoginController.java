package edu.zstu.web.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * 
 * 真正登录的POST请求由Filter完成,
 * 
 * @author tlb
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@RequestMapping(method = RequestMethod.POST)
	public String fail(@RequestParam("username") String userName, Model model,HttpServletRequest request) {
		model.addAttribute("username", userName);
		return "login";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String login(HttpServletRequest request,HttpServletResponse response) {
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser != null)			
			currentUser.logout();
		return "login";
	}


}
