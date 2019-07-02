package edu.zstu.service;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Encodes;

import edu.zstu.entity.User;
import edu.zstu.repository.UserDao;
import edu.zstu.service.ShiroDbRealm.ShiroUser;
//Spring Bean的标识.
@Component
//默认将类中的所有public函数纳入事务管理.
@Transactional
public class UserService extends CrudService<User, UserDao> {
	@Autowired
	private UserDao userDao;

	@Override
	protected UserDao getDao() {
		// TODO Auto-generated method stub
		return userDao;
	}

	public User regUser(User user) {
		// TODO Auto-generated method stub	
		byte[] salts = Digests.generateSalt(8);  
		// 将8位byte数组装换为string  
		String salt = Encodes.encodeHex(salts);  
		// 将string数组转化为8位byte数组  
		salts = Encodes.decodeHex(salt);  	  
		// 对密码加盐进行1024次SHA1加密  
		byte[] hashPassword = Digests.sha1(user.getPassword().getBytes(), salts, 1024);  
		// 将加密后的密码数组转换成字符串  
		String password = Encodes.encodeHex(hashPassword);
		user.setSalt(salt);
		user.setPassword(password);
		this.userDao.save(user);
		return user;
	}



	public User getCurrentUser(){
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		if(user==null){
			return null;
		}
		return this.getDao().findOne(user.id);
	}

	public User findByLoginName(String username) {
		// TODO Auto-generated method stub
		return this.getDao().findByLoginName(username);
	}
}
