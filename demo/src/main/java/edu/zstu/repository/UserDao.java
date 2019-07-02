package edu.zstu.repository;

import edu.zstu.entity.User;

public interface UserDao extends BaseDao<User> {

	User findByLoginName(String loginName);

}
