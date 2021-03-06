<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>StartUI - Premium Bootstrap 4 Admin Dashboard Template</title>
	<%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
	<link href="{APP_PATH}/img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="{APP_PATH}/img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="{APP_PATH}/img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="{APP_PATH}/img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="{APP_PATH}/img/favicon.png" rel="icon" type="image/png">
	<link href="{APP_PATH}/img/favicon.ico" rel="shortcut icon">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<link rel="stylesheet" href="{APP_PATH}/css/separate/pages/error.min.css">
    <link rel="stylesheet" href="{APP_PATH}/css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="{APP_PATH}/css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="{APP_PATH}/css/main.css">
</head>
<body>

<div class="page-error-box">
    <div class="error-code">500</div>
    <div class="error-title">Internal server error</div>
    <a href="#" class="btn btn-rounded">Main page</a>
</div>