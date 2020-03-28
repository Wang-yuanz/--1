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
        <form class="layui-form layui-col-md12 x-so" action="<%=basePath%>/api/api-list" method="get">
         
          
          
          
          <div class="layui-input-inline">
                   <select id="remark" name="remark" class="valid">
                  
                    <option value="计算机">计算机学院</option>
                    <option value="数学">数学学院</option>
                    <option value="音乐">音乐学院</option>
                    <option value="美术">美术学院</option>
                    <option value="物理">物理学院</option>
                    <option value="历史">历史学院</option>
                    <option value="外语">外语学院</option>
                    <option value="传媒">传媒学院</option>
                   
                  </select>
              </div>
          
          <button class="layui-btn"   lay-filter="sreach" type="submit" ><i class="layui-icon">&#xe615;</i></button>
          <a href="<%=basePath%>/api/api-list" title="刷新" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">刷新</i></a>
        </form>
        <button class="layui-btn" onclick="x_admin_show('添加疫情','<%=basePath%>/api/toAddApi',1100,480)"><i class="layui-icon"></i>上传疫情</button>
       
      </div>
      <table class="layui-table" id="tables">
        <thead>
          <tr>
            <th>姓名</th>
            <th>是否来自武汉</th>
            <th>是否来自湖北</th>
            <th>是否近期进入湖北武汉</th>
            <th>是否患有新冠肺炎</th>
            <th>日期</th>
            <th>学院</th>
            <th>操作</th>
            </tr>
        </thead>
        <tbody>
        
        
        <c:forEach items="${apis}" var="api" >
          <tr>
            <td>${api.sname}</td>
            <c:if test="${api.returndataformat=='否'}">
            <td>否</td>
            </c:if>
            <c:if test="${api.returndataformat=='是'}">
            <td style=" color: red">是</td>
            </c:if>
            <td>${api.returndata}</td>
            <c:if test="${api.requestmode=='否'}">
            <td>否</td>
            </c:if>
            <c:if test="${api.requestmode=='是'}">
            <td>是</td>
            </c:if>
            <td>${api.apitypetag}</td>
            <td>${api.exestateobj}</td>
            <td>${api.remark}</td>
                         
            <td class="td-manage">
               
              </a>
              
               
              </a>
              <a title="删除" onclick="api_del(${api.apiid})" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
          </c:forEach>
         
        </tbody>
      </table>
     
      <div class="page">

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

      
      
      
      
      
      
      
      /*用户-删除*/
      function api_del(id){
          layer.confirm('确认要删除吗？',function(index){
        	  jQuery
      	  	.ajax({
      	  		url : "<c:url value='/api/delapi'/>",
      	  		dataType : 'json',
      	  		data:{"id":id},
      	  		contentType : "application/x-www-form-urlencoded; charset=utf-8",
      	  		type : "post",
//       	  		 async:false, 
      	  		success : function(data){
	 	        
      	  		}
      	 		
      	  	});
        	  $("#userForm").attr("action",'<%=basePath%>/api/api-list');
	 	      $("#userForm").submit();
 
           layer.msg('已删除!',{icon:1,time:1000});
          });
      }
      
   
    </script>
    
  </body>

</html>