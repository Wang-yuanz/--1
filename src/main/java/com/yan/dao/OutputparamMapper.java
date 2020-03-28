package com.yan.dao;

import com.yan.pojo.Outputparam;
import com.yan.pojo.OutputparamKey;

public interface OutputparamMapper {
    int deleteByPrimaryKey(OutputparamKey key);

    int insert(Outputparam record);

    int insertSelective(Outputparam record);

    Outputparam selectByPrimaryKey(OutputparamKey key);

    int updateByPrimaryKeySelective(Outputparam record);

    int updateByPrimaryKey(Outputparam record);
}