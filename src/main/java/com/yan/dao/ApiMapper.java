package com.yan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yan.pojo.Api;
import com.yan.pojo.ApiWithBLOBs;

public interface ApiMapper {
	int deleteByPrimaryKey(Integer apiid);

	int insert(ApiWithBLOBs record);

	int insertSelective(ApiWithBLOBs record);

	ApiWithBLOBs selectByPrimaryKey(Integer apiid);

	int updateByPrimaryKeySelective(ApiWithBLOBs record);

	int updateByPrimaryKeyWithBLOBs(ApiWithBLOBs record);

	int updateByPrimaryKey(Api record);

	List<ApiWithBLOBs> selectApi(@Param("sname") String sname);

	List<ApiWithBLOBs> selectApis();

	List<java.util.Map<String, Object>> selectByRemark(@Param("remark") String remark);

}