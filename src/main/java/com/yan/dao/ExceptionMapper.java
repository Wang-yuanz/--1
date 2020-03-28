package com.yan.dao;

import com.yan.pojo.Exception;
import com.yan.pojo.ExceptionKey;

public interface ExceptionMapper {
    int deleteByPrimaryKey(ExceptionKey key);

    int insert(Exception record);

    int insertSelective(Exception record);

    Exception selectByPrimaryKey(ExceptionKey key);

    int updateByPrimaryKeySelective(Exception record);

    int updateByPrimaryKey(Exception record);
}