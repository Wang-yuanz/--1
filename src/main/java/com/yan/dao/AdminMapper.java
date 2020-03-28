package com.yan.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yan.pojo.Admin;

public interface AdminMapper {
	
	//根据用户名  用户密码  查询一个用户
	 Admin selectByUsernameAndPassword(@Param("adminuname")String adminuname,@Param("adminpwd")String adminpwd);
	   int deleteByPrimaryKey(Integer adminid);

		int insert(Admin record);

		int insertSelective(Admin record);

		Admin selectByPrimaryKey(Integer adminid);

		int updateByPrimaryKeySelective(Admin record);

		int updateByPrimaryKey(Admin record);
		
		List<Map<String, Object>>selectAllAdmin(@Param("name") String name,@Param("adminphone") String adminphone,@Param("idno") String idno,@Param("yujing") String yujing); 
		List<Map<String, Object>>  selectByName(@Param("adminuname") String adminuname);
		List<Map<String, Object>>  selectByPhone(@Param("adminphone") String adminphone);
		List<Map<String, Object>>  selectAllcoachs(@Param("name") String name);//获取所有的教练信息
		
}
