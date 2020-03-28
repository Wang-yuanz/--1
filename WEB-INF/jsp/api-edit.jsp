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
     <input type="hidden" id="apiid"    value="${api.apiid}" >
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>厂商名称
              </label>
              <div class="layui-input-inline">
              
                  <input type="text" id="sname"   required=""  value="${api.sname}" 
                  autocomplete="off" class="layui-input" >
              </div>
              
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>调用地址
              </label>
              <div class="layui-input-inline">
                  <input value="${api.url}"  type="text" id="url" name="url" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>返回对象:
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${api.returndata}" id="returndata" name="returndata" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input"   >
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>返回格式
              </label>
              <input type="hidden" value="${api.returndataformat}" id="returndataformatinput">
              <div class="layui-input-inline">
                  <select id="returndataformat" name="returndataformat" class="valid">
                  
                    <option value="0">JSON</option>
                    <option value="1">XML</option>
                  </select>
              </div>
          </div>
         <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>返回格式
              </label>
              <input type="hidden" value="${api.requestmode}" id="requestmodeinput">
              <div class="layui-input-inline">
                  <select id="requestmode" name="requestmode" class="valid">
                    <option value="0">get</option>
                    <option value="1">put</option>
                    <option value="2">post</option>
                    <option value="3">delete</option>
                    <option value="4">Options</option>
                    <option value="5">HEAD</option>
                  </select>
              </div>
          </div>
         
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>请求实例
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${api.requestexample}" id="requestexample" name="requestexample" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>备注
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${api.remark}" id="remark" name="remark" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>状态码
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${api.exestateobj}" id="exestateobj" name="exestateobj" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>API标注
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${api.apitypetag}" id="apitypetag" name="apitypetag" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  type="button" class="layui-btn" lay-filter="add" lay-submit="" onclick="updateApi()">
                                           修改
              </button>
          </div>
    </div>
    
    <script>
    
    
//		初始化
	$(function() {
			
//默认返回数据格式
			var returndataformatinput = $("#returndataformatinput").val();
			var numbers = $("#returndataformat").find("option"); //获取select下拉框的所有值
			for (var j = 1; j < numbers.length; j++) {
			if ($(numbers[j]).val() == returndataformatinput) {
			$(numbers[j]).attr("selected", "selected");
			}
		}
			
			//默认请求方式
			var requestmodeinput = $("#requestmodeinput").val();
			var numberrequestmodes = $("#requestmode").find("option");  
			for (var j = 1; j < numberrequestmodes.length; j++) {
			if ($(numberrequestmodes[j]).val() == requestmodeinput) {
			$(numberrequestmodes[j]).attr("selected", "selected");
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

        });
        
        
        
        
         //form表单提交
  	    function updateApi(){
  	    	var path =getRootPath();
  	    	var apiid = $("#apiid").val();
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
  	    	layer.msg('厂商不可为空!',{icon:1,time:1000});
  	    	return false;
  	    	}
  	    	if(url.length==0){
  		    	layer.msg('路径不可为空!',{icon:1,time:1000});
  		    	return false;
  		    	}
  	    	if(returndata.length==0){
  		    	layer.msg('返回对象不可为空!',{icon:1,time:1000});
  		    	return false;
  		    	}
  	    	 
  	    	
  	    	if(requestexample.length==0){
  		   	layer.msg('请求实例不可为空!',{icon:1,time:1000});
  		    	return false;
  		    	}
  	    	if(exestateobj.length==0){
  		    	layer.msg('状态码不可为空!',{icon:1,time:1000});
  		    	return false;
  		    	}
  	    	if(apitypetag.length==0){
  	    		layer.msg('api标注不可为空!',{icon:5,time:1000});
  		    	 
  		    	return false;
  		    	}

  	    	
  	    	$.ajax({
  				url : path + "/api/updateApi",
  				dataType : 'json',
  				data: {
  					"apiid":apiid,
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
  						 layer.msg('修改失败!',{icon:1,time:1000});
  					}else{
  						 
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