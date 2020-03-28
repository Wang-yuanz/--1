package com.yan.dao;

import com.yan.pojo.Inputparam;
import com.yan.pojo.InputparamKey;

public interface InputparamMapper {
    int deleteByPrimaryKey(InputparamKey key);

    int insert(Inputparam record);

    int insertSelective(Inputparam record);

    Inputparam selectByPrimaryKey(InputparamKey key);

    int updateByPrimaryKeySelective(Inputparam record);

    int updateByPrimaryKey(Inputparam record);
}