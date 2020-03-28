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
			       <label> 姓名:</label>${admin.name}
				</li>
				<li>
			       <label> 账户名:</label>${admin.adminuname}
				</li>
				<li>
			        <label>性别:</label>
			          <c:if test="${admin.sex==1}">
			                                      男
			          </c:if>
			           <c:if test="${admin.sex==2}">
			                                      女
			          </c:if>
				</li>
				 
				<li>
			        <label>住址:</label> ${admin.addrs}
				</li>
				<li>
			       <label> 电话:</label>${admin.adminphone}
				</li>
				
				<li>
			        <label>身份证:</label> ${admin.idno}
				</li>
				<li>
			        <label>照片:</label> <img src="<%=basePath%>${admin.adminphone}" width="145" height="100" />
				</li>
			</ul>
		</div>
	</div>
</div>
    
    <script>
    
    
//		初始化
	$(function() {
			
			var control = $("#file");
			//初始化上传插件
			control.fileinput({
				language : 'zh', //设置语言
				showCaption : true,//是否显示标题
				showUpload : false, //是否显示上传按钮
				dropZoneEnabled : true,//是否显示拖拽区域
				textEncoding : 'UTF-8',
				browseClass : "btn btn-primary", //按钮样式
				dropZoneEnabled : false,
				allowedFileExtensions : [ 'jpg', 'png' ], //接收的文件后缀
				maxFileCount : 1,//最大上传文件数限制
				maxFileSize : 10240,//单位为kb，如果为0表示不限制文件大小
				previewFileIcon : '<i class="glyphicon glyphicon-file"></i>',
				showPreview : true, //是否显示预览
				enctype : 'multipart/form-data',
				previewFileIconSettings : {
					'doc' : '<i ass="fa fa-file-word-o text-success"></i>',
					'docx' : '<i ass="fa fa-file-word-o text-success"></i>',
					'pdf' : '<i class="fa fa-file-archive-o text-success"></i>',
					'xlsx' : '<i class="fa fa-file-excel-o text-error"></i>',
					'xls' : '<i class="fa fa-file-excel-o text-error"></i>',
					'pptx' : '<i class="fa fa-file-powerpoint-o text-error"></i>',
					'zip' : '<i class="fa fa-file-archive-o text-error"></i>',
					'rar' : '<i class="fa fa-file-archive-o text-error"></i>',
					'txt' : '<i class="fa fa-file-word-o text-error"></i>'
				}

			});
//默认性别
			var sexinput = $("#sexinput").val();
			var numbers = $("#sex").find("option"); //获取select下拉框的所有值
			for (var j = 1; j < numbers.length; j++) {
			if ($(numbers[j]).val() == sexinput) {
			$(numbers[j]).attr("selected", "selected");
			}
		} 
			
			//默认权限
			var adminroleinput = $("#adminroleinput").val();
			var rolenumbers = $("#adminrole").find("option"); //获取select下拉框的所有值
			for (var j = 1; j < rolenumbers.length; j++) {
			if ($(rolenumbers[j]).val() == adminroleinput) {
			$(rolenumbers[j]).attr("selected", "selected");
			}
		} 
			//默认车型
			var cartypeinput = $("#cartypeinput").val();
			var cartypenumbers = $("#cartype").find("option"); //获取select下拉框的所有值
			for (var j = 1; j < cartypenumbers.length; j++) {
			if ($(cartypenumbers[j]).val() == cartypeinput) {
			$(cartypenumbers[j]).attr("selected", "selected");
			}
		} 
			
			/////////////////////////////////////初始化结束////////////////////////////////////////////////////
		});
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#signupdate' //指定元素
        });

        
      });
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
//           form.on('submit(add)', function(data){
//             console.log(data);
//             //发异步，把数据提交给php
//             layer.alert("增加成功", {icon: 6},function () {
//                 // 获得frame索引
//                 var index = parent.layer.getFrameIndex(window.name);
//                 //关闭当前frame
//                 parent.layer.close(index);
//             });
//             return false;
//           });
        });
        
        
     
        
      
    </script>
  </body>

</html>