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
     <style>
  
  .box ul {
list-style-type: none;
margin:0px;
padding:0px;
}
.box li {
margin:7px;
padding:5px;
float:left;
width:220px;
height:100px;
} 
  
  </style>
  </head>
  
  <body>
  
 
     <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					 <small>用户详情</small>
				</h1>
			</div>
			<ul class="unstyled  box">
				<li>
			       <label>厂商:</label>${api.sname}
				</li>
				<li>
			       <label>路径:</label>${api.url}
				</li>
				<li>
			        <label>返回的数据格式:</label>
			          <c:if test="${api.returndataformat==0}">
			           JSON
			          </c:if>
			           <c:if test="${api.returndataformat==1}">
			             XML
			          </c:if>
				</li>
				<li>
			        <label>请求方式:</label>
			          <c:if test="${api.requestmode==0}">
			           get
			          </c:if>
			           <c:if test="${api.requestmode==1}">
			           put
			          </c:if>
			           <c:if test="${api.requestmode==2}">
			           Post 
			          </c:if>
			           <c:if test="${api.requestmode==3}">
			           Delete  
			          </c:if>
			           <c:if test="${api.requestmode==4}">
			           Options
			          </c:if>
			           <c:if test="${api.requestmode==5}">
			           HEAD
			          </c:if>
				</li>
				 
				<li>
			        <label>请求示例:</label> ${api.requestexample}
				</li>
				<li>
			       <label>备注:</label>${api.remark}
				</li>
				
				<li>
			        <label>状态码:</label> ${api.exestateobj}
				</li>
				<li>
			        <label>类型标签:</label> ${api.apitypetag}
				</li>
			</ul>
		</div>
	</div>
</div>
    
  </body>

</html>