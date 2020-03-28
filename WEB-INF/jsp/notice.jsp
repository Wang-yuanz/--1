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
                  <span class="x-red">*</span>学车时间
              </label>
              <div class="layui-input-inline">
<!--               学生ID -->
              <input type="hidden" id="adminid"     value="${adminid}">
                  <input type="text" id="start"      class="layui-input"   >
                  
              </div>
              
          </div>
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  type="button" class="layui-btn" lay-filter="add" lay-submit="" onclick="sub()">
                                                   提交
              </button>
          </div>
            <form id="userForm" action="" method="get">
                <input id="userFormJson" name="userId" type="hidden"/>
            </form>
            
    </div>
    
    <script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start'//指定元素
//           change: function(value, date){  
//         	  console.log(value);
//         	  console.log(date);
//                 }
          ,done:function(value, date, endDate){//选择完时间后触发事件
        	  console.log(value);
        	  $('#start').change();  // 一定要加上这句！！！不然没有回调！！！
              	var lianchedate = value; 
              	var id = $("#adminid").val(); 
              	if(lianchedate.length==0){
              		return false;
              	}
              	jQuery
             	  	.ajax({
             	  		url : "<c:url value='/booking/yanzhengshijian'/>",
             	  		dataType : 'json',
             	  		data:{"lianchedate":lianchedate,"id":id},
             	  		contentType : "application/x-www-form-urlencoded; charset=utf-8",
             	  		type : "post",
             	  		success : function(data){
             	  			 if(data=="-1"){
             	  			   layer.msg('学车时间不可小于预约时间!',{icon:5,time:1500});
             	  			   $("#start").val("");
             	  			 }
             	  		}
             	  	});
        	    
        	  }
        });
      });
  
   
    
    
        //执行修改
        
        function sub() {
        	//练车时间
        	var liancheString = $("#start").val();
        	var stuid = $("#adminid").val(); 
        	if(liancheString.length==0){
        		   layer.msg('提交的时间不可为空!',{icon:5,time:1500});
        		   return false;
        	}
//	    	字符串转date
		 
		    var lianchedate=getDate(liancheString);
       	 jQuery
       	  	.ajax({
       	  		url : "<c:url value='/booking/addlianche'/>",
       	  		dataType : 'json',
       	  		data:{"stuid":stuid,"lianchedate":lianchedate},
       	  		contentType : "application/x-www-form-urlencoded; charset=utf-8",
       	  		type : "post",
       	  		success : function(data){
       	  			  if(data=="0"){
       	  			 layer.msg('提交失败!',{icon:5,time:1500});
       	  			  }else{
       	  			 alert("通知成功");
       	  		    window.parent.location.reload();//刷新父页面
			        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
			        parent.layer.close(index);
       	  			  }
       	  		}
       	 		
       	  	});
        }
        
         
        
    </script>
  </body>

</html>