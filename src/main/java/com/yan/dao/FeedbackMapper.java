package com.yan.dao;

import java.util.List;

import com.yan.pojo.Feedback;

public interface FeedbackMapper {
    int deleteByPrimaryKey(Integer fbid);

    int insert(Feedback record);

    int insertSelective(Feedback record);

    Feedback selectByPrimaryKey(Integer fbid);

    int updateByPrimaryKeySelective(Feedback record);

    int updateByPrimaryKey(Feedback record);
    
    List<Feedback> selectFeedbacks();
    
    
}