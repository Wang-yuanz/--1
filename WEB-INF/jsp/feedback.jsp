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
    <link rel="shortcut icon" href="<%=basePath%>/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>/js/xadmin.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/cookie.js"></script>
<!--     导出excel表格的两个文件插件-->
    <script type="text/javascript" src="<%=basePath%>/js/tableExport.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/base64.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body class="layui-anim layui-anim-up">
     
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="<%=basePath%>/login/member-list" method="post">
          
          
          <a href="<%=basePath%>/feedback/toFeedback" title="刷新" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">刷新</i></a>
        </form>
      </div>
      <xblock>

      
      </xblock>
      <table class="layui-table" id="tables">
        <thead>
          <tr>
            <th>用户名</th>
            <th>反馈时间</th>
            <th>反馈内容</th>
            </tr>
        </thead>
        <tbody>
        
        
        <c:forEach items="${feedbacks}" var="feedback" >
          <tr>
            <td>${feedback.fbuname}</td>
            <td><fmt:formatDate value="${feedback.fbtime}" pattern="yyyy-MM-dd"/></td>
            <td>${feedback.fbcontent}</td>
          </tr>
          </c:forEach>
         
        </tbody>
      </table>
      
      <div class="page">
        <div id="test1"></div>
      </div>
     
    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

      layui.use('laypage', function(){
    	  var laypage = layui.laypage;
    	  var counts= $("#counts").val();
    	  
    	  //执行一个laypage实例s
    	  laypage.render({
    	    elem: 'test1', //注意，这里的 test1 是 ID，不用加 # 号
    	    count: counts, //数据总数，从服务端得到
    	    jump: function(obj, first){
    	        //obj包含了当前分页的所有参数，比如：
    	        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据  页数
    	        console.log(obj.limit); //得到每页显示的条数  每页条数
    	        
    	        //首次不执行
    	        if(!first){
    	          //do something
    	        }
    	      }
    	  });
    	});

    </script>
    
  </body>

</html>