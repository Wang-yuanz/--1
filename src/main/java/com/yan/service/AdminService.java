package com.yan.service;

import com.yan.pojo.Admin;

public interface AdminService {

	//根据用户名和密码查询用户
	Admin getModelByUsernameAndPassword(Admin admin);
	
	int addUser(Admin admin);
	
	int updateUser(Admin admin);
	
}
