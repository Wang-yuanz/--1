package com.yan.service.serevicImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yan.common.Constant;
import com.yan.dao.AdminMapper;
import com.yan.pojo.Admin;
import com.yan.service.AdminService;
import com.yan.util.ToolUtil;

@Service
public class AdminServiceImpl implements AdminService {

//	在业务层要是和数据库打交道就得通过持久层(mapper层)  adminMapper,但是怎么引用那 必须装配进来,方可使用里面的方法
	
	@Autowired
	AdminMapper	adminMapper;
	
	//根据用户名和密码查询用户
	@Override
	public Admin getModelByUsernameAndPassword(Admin admin) {
		 
		Admin adminLogin = null;
		if(ToolUtil.isEmpty(admin)){//如果是空直接返回空数据,不执行查询库的操作
			return adminLogin;
		}
		String  adminuname = admin.getAdminuname();
		String  adminpwd =  admin.getAdminpwd();
		if(ToolUtil.isEmpty(adminuname)||ToolUtil.isEmpty(adminpwd)){
			return adminLogin;
		}
		//需要查询数据库 就要建立mapper类 
		adminLogin = adminMapper.selectByUsernameAndPassword(adminuname, adminpwd);
		System.out.println("mapper"+adminLogin);
		return adminLogin;
	}

	@Override
	public int addUser(Admin admin) {
		 
		if(ToolUtil.isEmpty(admin)){
			return 0;
		}
		//所有用户的初始密码为111111
		admin.setAdminpwd(Constant.INIT_PWP);
		admin.setAdminrole(1);//普通人员
	    adminMapper.insert(admin);
		int id = admin.getAdminid();
		return id;
	}

	@Override
	public int updateUser(Admin admin) {
		if(ToolUtil.isEmpty(admin)){
			return 0;
		}
	    adminMapper.updateByPrimaryKeySelective(admin);
		int id = admin.getAdminid();
		return id;
	}
}
