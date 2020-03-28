package com.yan.dao;

import com.yan.pojo.Service;

public interface ServiceMapper {
    int deleteByPrimaryKey(String sname);

    int insert(Service record);

    int insertSelective(Service record);

    Service selectByPrimaryKey(String sname);

    int updateByPrimaryKeySelective(Service record);

    int updateByPrimaryKeyWithBLOBs(Service record);

    int updateByPrimaryKey(Service record);
}