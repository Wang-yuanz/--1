<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jsp界面中可以写java代码,  书写格式是这样 ,下面买的代码是获取  启动项目的相对路径,为了方便下面引用获取静态的js  css  引用格式 -->
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>疫情防控管理系统</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<!--     加载了是这样的     http://localhost:8080/jxm/css/font.css-->
    <link rel="stylesheet" href="<%=basePath%>/css/font.css">
	<link rel="stylesheet" href="<%=basePath%>/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="<%=basePath%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/js/xadmin.js"></script>
     <script type="text/javascript" src="<%=basePath%>/js/cookie.js"></script>
</head>
<body class="login-bg" style="background-image:url(<%=basePath%>/images/login.jpeg)">
     <form id="userForm" action="" method="get">
        <input id="userFormJson" name="userId" type="hidden"/>
    </form>
    <div class="login layui-anim layui-anim-up">
        <div class="message">疫情防控管理系统</div>
        <div id="darkbannerwrap"></div>
        
            <input name="username" placeholder="用户名"    id="username"    type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  id="password" type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="button" onclick="toLogin()">
            <hr class="hr20" >
          <button  style='float:right' class="layui-btn" onclick="x_admin_show('添加用户','<%=basePath%>/login/toAddUser',1100,480)"><i class="layui-icon"></i>注册</button>
    </div>

    <script>
        
        
        function toLogin(){
        	 //根据jquery  ID 选择器获取用户输入的信息  (传到后台进行和数据库中的用户名跟密码做对比)
             	var username = $("#username").val();
             	var password = $("#password").val();
             	jQuery.ajax({
         	 		url : "<c:url value='/login/tologin'/>",
         	 		dataType : 'json',
         	 		data:{"username":username,"password":password},
         	 		contentType : "application/x-www-form-urlencoded; charset=utf-8",
         	 		type : "post",
         	 		success : function(data){
         	 			if(data==0){
         	 				alert("账户或者密码错误");
         	 			}else{
         	 				 
         	 				 $("#userFormJson").val(data.adminid);
         	 	             $("#userForm").attr("action",'<%=basePath%>/login/main');
         	 	             $("#userForm").submit();
         	 				
         	 			}
         	 		}
         	 		
         	 	});
             	
             }
        	
        
    </script>

    
    <!-- 底部结束 -->
     
</body>
</html>