package com.yan.service.serevicImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yan.dao.FeedbackMapper;
import com.yan.pojo.Feedback;
import com.yan.service.FeedbackService;
@Service
public class FeedbackServiceImpl implements FeedbackService{
    @Autowired
	FeedbackMapper feedbackMapper;
	
	@Override
	public List<Feedback> getlist() {
	 
		List<Feedback> list =  feedbackMapper.selectFeedbacks();
		 
		return list;
	}

}
