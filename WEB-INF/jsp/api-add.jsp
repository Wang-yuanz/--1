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
    <title>API管理系统</title>
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
     <input type="hidden" id="adminid"    value="${api.apiid}" >
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
              
                  <input type="text" id="sname"   required=""   
                  autocomplete="off" class="layui-input" >
              </div>
<!--               <div class="layui-form-mid layui-word-aux"> -->
<!--                   <span class="x-red">*</span>必须唯一 -->
<!--               </div> -->
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>身份证号
              </label>
              <div class="layui-input-inline">
                  <input   type="text" id="url" name="url" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
           
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>是否来自湖北
              </label>
              <div class="layui-input-inline">
                   <select id="returndata" name="returndata" class="valid">
                  
                    <option value="否">否</option>
                    <option value="是">是</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>是否来自武汉
              </label>
<!--               <input type="hidden"   id="returndataformatinput"> -->
              <div class="layui-input-inline">
                  <select id="returndataformat" name="returndataformat" class="valid">
                  
                    <option value="否">否</option>
                    <option value="是">是</option>
                  </select>
              </div>
          </div>
         <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>是否近期进入湖北武汉
              </label>
<!--               <input type="hidden"  id="requestmodeinput"> -->
              <div class="layui-input-inline">
                  <select id="requestmode" name="requestmode" class="valid">
                    <option value="否">否</option>
                    <option value="是">是</option>
                    
                  </select>
              </div>
          </div>
         
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>是否有疑似症状
              </label>
              <div class="layui-input-inline">
                  <select id="requestexample" name="requestexample" class="valid">
                    <option value="否">否</option>
                    <option value="是">是</option>
                    
                  </select>
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>是否患新冠肺炎
              </label>
              <div class="layui-input-inline">
                  <select id="apitypetag" name="apitypetag" class="valid">
                    <option value="否">否</option>
                    <option value="是">是</option>
                    
                  </select>
             </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>学院
              </label>
              <div class="layui-input-inline">
                  <input type="text"   id="remark" name="remark" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>日期
              </label>
              <div class="layui-input-inline">
                  <input type="text"   id="exestateobj" name="exestateobj" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  type="button" class="layui-btn" lay-filter="add" lay-submit="" onclick="addApi()">
                                           添加
              </button>
          </div>
    </div>
    
    <script>
    
    
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

        });
        
      //form表单提交
 	    function addApi(){
 	    	var path =getRootPath();
 	    	var sname = $("#sname").val();
 	    	var url =$("#url").val();
 	    	var returndata =$("#returndata").val();
 	    	var returndataformat =  $("#returndataformat").val();
 	    	var requestmode = $("#requestmode").val();
 	    	var requestexample = $("#requestexample").val();
 	    	var remark = $("#remark").val();
 	    	var exestateobj =   $("#exestateobj").val();
 	     	var apitypetag =   $("#apitypetag").val();
 	    	
 	    	 
 	    	
 	    	if(sname.length==0){
 	    	layer.msg('不可为空!',{icon:1,time:1000});
 	    	return false;
 	    	}
 	    	if(url.length==0){
 		    	layer.msg('不可为空!',{icon:1,time:1000});
 		    	return false;
 		    	}
 	    	if(returndata.length==0){
 		    	layer.msg('不可为空!',{icon:1,time:1000});
 		    	return false;
 		    	}
 	    	 
 	    	
 	    	if(requestexample.length==0){
 		   	layer.msg('不可为空!',{icon:1,time:1000});
 		    	return false;
 		    	}
 	    	if(exestateobj.length==0){
 		    	layer.msg('不可为空!',{icon:1,time:1000});
 		    	return false;
 		    	}
 	    	if(apitypetag.length==0){
 	    		layer.msg('不可为空!',{icon:5,time:1000});
 		    	 
 		    	return false;
 		    	}

 	    	
 	    	$.ajax({
 				url : path + "/api/addApi",
 				dataType : 'json',
 				data: {
 					"sname":sname,
 					"url":url,
 					"returndataformat":returndataformat,
 					"returndata":returndata,
 					"requestmode":requestmode,
 					"requestexample":requestexample,
 					"remark":remark,
 					"exestateobj":exestateobj,
 					"apitypetag":apitypetag
 				},
 				contentType : "application/x-www-form-urlencoded; charset=utf-8",
 				type : "post",
 				success : function(data) {
 				
 					
 					if(data=="0"){
 						 layer.msg('添加失败!',{icon:1,time:1000});
 					}else{
 						alert("上传成功！");
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