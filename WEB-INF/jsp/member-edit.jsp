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
     <input type="hidden" id="adminid"    value="${admin.adminid}" >
    <a id="aa" href="<%=basePath%>/login/member-list"></a>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>用户名
              </label>
              <div class="layui-input-inline">
              
                  <input type="text" id="adminuname"   required=""  value="${admin.adminuname}" 
                  autocomplete="off" class="layui-input" onblur="yanzhengadminuname()">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                  <input value="${admin.name}"  type="text" id="name" name="name" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>手机号
              </label>
              <div class="layui-input-inline">
                  <input type="text"  value="${admin.adminphone}"  id="adminphone" name="adminphone" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input"onblur="yanzhengshouji()">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>身份号
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${admin.idno}" id="idno" name="idno" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input"   onblur="yzshenfen()">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>性别
              </label>
              <input type="hidden" value="${admin.sex}" id="sexinput">
              <div class="layui-input-inline">
                  <select id="sex" name="sex" class="valid">
                  
                    <option value="1">男</option>
                    <option value="2">女</option>
                  </select>
              </div>
          </div>
         
         
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>住址
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${admin.addrs}" id="addrs" name="addrs" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          
          <form id="fileAction" class="form-horizontal required-validate" action="<%=basePath%>/login/uploadFile" enctype="multipart/form-data" method="post">
								<div class="form-group">
                                   <label class="col-sm-3 control-label">头像</label>
									<div class="col-sm-4">
									   	<input type="hidden" name="ubid" id="ubid">
										 <input id="file" type="file" name="uplodFile" />
										<p class="help-block">支持格式 jpg  png 大小不超过5M</p>
									</div>
								</div>
			</form>
         
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  type="button" class="layui-btn" lay-filter="add" lay-submit="" onclick="adduser()">
                                                   增加
              </button>
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
        
        
        //验证用户名是不是重复
        function yanzhengadminuname() {
        	
        	var adminuname = $("#adminuname").val();
       	 jQuery
       	  	.ajax({
       	  		url : "<c:url value='/login/yzzh'/>",
       	  		dataType : 'json',
       	  		data:{"adminuname":adminuname},
       	  		contentType : "application/x-www-form-urlencoded; charset=utf-8",
       	  		type : "post",
       	  		success : function(data){
       	  			if(data=="0"){
       	  				alert("账户重复");
       	  				$("#adminuname").val("");
       	  			}
       	  		}
       	 		
       	  	});
        }
        
        //验证手机号
         function yanzhengshouji(){
        	var adminphone = $("#adminphone").val();
            var pattern = /^1[34578]\d{9}$/; 
           if(!(pattern.test(adminphone))&&adminphone.length>0){
        	   alert("手机号错误");
        	   $("#adminphone").val("");
        	   return false;
           }
          	 jQuery
          	  	.ajax({
          	  		url : "<c:url value='/login/yzzhsj'/>",
          	  		dataType : 'json',
          	  		data:{"adminphone":adminphone},
          	  		contentType : "application/x-www-form-urlencoded; charset=utf-8",
          	  		type : "post",
          	  		success : function(data){
          	  			if(data=="0"){
          	  				alert("手机号不能重复");
          	  				$("#adminphone").val("");
          	  			}
          	  		}
          	 		
          	  	});
          }
//         验证身份证信息
         function yzshenfen(){
        	 var idno=$('#idno').val();
        	 var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
        	   if(reg.test(idno) === false&&idno.length>0){  
        	       alert("身份证输入不合法");
        	       $('#idno').val("");
        	       return  false;  
        	   }  
        	 
         }
        
       //form表单提交
 	    function adduser(){
 	    	var path =getRootPath();
 	    	var adminid = $("#adminid").val();
 	    	var adminuname = $("#adminuname").val();
 	    	var name =$("#name").val();
 	    	var adminrole =$("#adminrole").val();
 	    	var adminphone =  $("#adminphone").val();
 	    	var idno = $("#idno").val();
 	    	var sex = $("#sex").val();
 	    	var addrs = $("#addrs").val();
 	    	var file =   $("#file").val();
 	    	if (filelast()) {
 				alert("上传格式不正确!!");
 				return false;
 			}
 	    	 
 	    	if (file == "") {
 				alert("文件资源不可为空!!");
 				return false;
 			}
 	    	
 	    	if(adminuname.length==0){
 	    	alert("账号不可为空");
 	    	return false;
 	    	}
 	    	if(idno.length==0){
 		    	alert("身份证不可为空");
 		    	return false;
 		    	}
 	    	if(addrs.length==0){
 		    	alert("地址不可为空");
 		    	return false;
 		    	}
 	    	if(name.length==0){
 		    	alert("用户姓名不可为空");
 		    	return false;
 		    	}
 	    	$.ajax({
 				url : path + "/login/updateuser",
 				dataType : 'json',
 				data: {
 					"adminid":adminid,
 					"adminuname":adminuname,
 					"name":name,
 					"adminrole":adminrole,
 					"adminphone":adminphone,
 					"idno":idno,
 					"sex":sex,
 					"addrs":addrs
 					
 				},
 				contentType : "application/x-www-form-urlencoded; charset=utf-8",
 				type : "post",
 				success : function(data) {
 					$("#ubid").val("");
 					
 					if(data=="0"){
 						alert("添加失败！");
 					}else{
 						 
 						
 						$("#ubid").val(data);
 						$("#fileAction").submit();
 						window.parent.location.reload();//刷新父页面
 				        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
 				        parent.layer.close(index);
 						 
 					}
 					
 				}
 					
 			});
 	    	x_admin_close();//关闭弹框
 	    }
        
    </script>
  </body>

</html>