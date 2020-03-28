<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- jsp界面中可以写java代码,  书写格式是这样 ,下面买的代码是获取  启动项目的相对路径,为了方便下面引用获取静态的js  css  引用格式 -->
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>疫情防控管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>/css/xadmin.css">
    <link rel="stylesheet" href="<%=basePath%>/css/fileinput.css" type="text/css" >
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/js/xadmin.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/fileinput.js" charset="UTF-8" ></script>
    <script type="text/javascript" src="<%=basePath%>/js/zh.js"></script>
     <script type="text/javascript" src="<%=basePath%>/js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body layui-anim layui-anim-up">
    
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>新密码
              </label>
              <div class="layui-input-inline">
              
                  <input type="text" id="adminpwd"   required=""   
                  autocomplete="off" class="layui-input" >
              </div>
              
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>确认密码
              </label>
              <div class="layui-input-inline">
                  <input    type="text" id="thispass" name="thispass" required="" lay-verify="nikename"
                 onblur="yanzhengmima()" autocomplete="off" class="layui-input">
              </div>
          </div>
            
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  type="button" class="layui-btn" lay-filter="add" lay-submit="" onclick="updatepass()">
                                                   修改
              </button>
          </div>
            <form id="userForm" action="" method="get">
                <input id="userFormJson" name="userId" type="hidden"/>
            </form>
    </div>
    
    <script>
    
    function yanzhengmima(){
    	var adminpwd = $("#adminpwd").val();
    	var thispass = $("#thispass").val();
    	if(thispass.length>0&&!(adminpwd==thispass)){
    		alert("密码不一致");
    		$("#thispass").val("");
    	}
    	
    }
   
        //执行修改
        function updatepass() {
        	
        	var adminpwd = $("#adminpwd").val();
        	var thispass = $("#thispass").val();
        	
        	if(adminpwd.length==0||thispass.length==0){
        		alert("密码不可为空");
        	}
       	 jQuery
       	  	.ajax({
       	  		url : "<c:url value='/login/updatepass'/>",
       	  		dataType : 'json',
       	  		data:{"adminpwd":adminpwd},
       	  		contentType : "application/x-www-form-urlencoded; charset=utf-8",
       	  		type : "post",
       	  		success : function(data){
       	  			 if(data=="0"){
       	  				alert("修改失败"); 
       	  			 }else{
       	  		    layer.msg('修改成功!',{icon:1,time:2000});
       	  		   $("#userForm").attr("action",'<%=basePath%>/login');
     	 	       $("#userForm").submit();
      	 	       x_admin_close();//关闭弹框
       	  			 }
       	  		}
       	 		
       	  	});
        }
        
         
        
    </script>
  </body>

</html>