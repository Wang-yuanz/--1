<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<head lang="en">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>StartUI - Premium Bootstrap 4 Admin Dashboard Template</title>
 

	<link href="<%=basePath%>/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="<%=basePath%>/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="<%=basePath%>/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="<%=basePath%>/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="<%=basePath%>/img/favicon.png" rel="icon" type="image/png">
	<link href="<%=basePath%>/img/favicon.ico" rel="shortcut icon">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<link rel="stylesheet" href="<%=basePath%>/css/separate/pages/error.min.css">
    <link rel="stylesheet" href="<%=basePath%>/css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>/css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>/css/main.css">
</head>
<body>

<div class="page-error-box">
    <div class="error-code">404</div>
    <div class="error-title">Page not found</div>
    <a href="#" class="btn btn-rounded">Main page</a>
</div>