package com.yan.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yan.pojo.Admin;
 
//
///**
// * 
// * 拦截器 (这个类是获取登陆用户的信息,如果获取不到直接重定向的 )
// * 
// * */
public class SysInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
	   
	    HttpSession session = request.getSession();
	    session.setMaxInactiveInterval(30*60);
	    Admin admin = (Admin)session.getAttribute("admin");
	    if(null == admin){
	    response.sendRedirect(request.getContextPath()+"/login");
	    return false;
	    }
	    return true;
	    }
}
