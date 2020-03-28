package com.yan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yan.pojo.Feedback;
import com.yan.service.FeedbackService;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {

	
	@Autowired
	FeedbackService feedbackService;
	
	   @RequestMapping(value = "/toFeedback", method = RequestMethod.GET)
	    @ResponseBody
	    public ModelAndView toFeedback(HttpServletRequest request){
	    	 
	        ModelAndView mv = new ModelAndView();
	        List<Feedback> list = feedbackService.getlist();
	        mv.addObject("feedbacks", list);
	        mv.setViewName("feedback");
	        return mv;
	    }
	
	
}
