<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>臻品生活家</title>

    <!-- Bootstrap -->
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            padding-top: 40px;
			padding-bottom: 40px;
			background-color: #eee;
        }
       .form-reg {
		  max-width: 330px;
		  padding: 15px;
		  margin: 0 auto;
		}
		.form-reg .form-signin-heading,
		.form-reg .checkbox {
		  margin-bottom: 10px;
		}
		.form-reg .checkbox {
		  font-weight: normal;
		}
		.form-reg .form-control {
		  position: relative;
		  height: auto;
		  -webkit-box-sizing: border-box;
			 -moz-box-sizing: border-box;
				  box-sizing: border-box;
		  padding: 10px;
		  font-size: 16px;
		}
		.form-reg .form-control:focus {
		  z-index: 2;
		}
		.form-reg input[type="email"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}
		.form-reg input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
		#errorInfo {
			font-family: "微软雅黑";
			font-size: 12px;
			line-height: 50px;
			color: #F00;
			background-color: #CCC;
			height: 60px;
			width: 300px;
			border: 1px solid #D6D6D6;
			position: absolute;
			left: 40%;
			top: 10%;
			display:none;
			border-radius:5px;
			text-align: center;
			z-index:9999;
		}
    </style>
    
  </head>
  <body>

<div id="errorInfo">error info</div>

<div class="container">
    <!-- 登录框 -->                    	
                    <form  id="reg_form" class="form-reg" method="post" action="${ctx}/reg">
                    	<h2 class="form-signin-heading">请注册</h2>
                        <p><label for="inputEmail" class="sr-only">邮件</label>
                        <input type="email" id="inputEmail" class="form-control" placeholder="邮件" required autofocus></p>
                        <p><label for="inputPassword" class="sr-only">密码</label>
                        <input type="password" id="inputPassword" class="form-control" placeholder="密码" required></p>
                        <p><label for="inputPasswordagain" class="sr-only">再次输入密码</label>
                        <input type="password" id="inputPasswordagain" class="form-control" placeholder="再次输入密码" required></p>
                        <p><button class="btn btn-lg btn-primary btn-block" type="button" id="regBtn">注册</button></p>
                    </form>

    
</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/static/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	    var flagU=false;
		var flagPsd=false;
		var flagPsdAgn=false;
    	$(document).ready(function (){
    		$('input#inputEmail').blur(function(){
    			var username=$('input#inputEmail').val();
    			var reg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;		
    			if(!reg.test(username)){
    				$('#errorInfo').html('请输入正确的电子邮件格式');
    				$('#errorInfo').fadeIn();
    				$('#errorInfo').fadeOut(3000);
    				flagU=false;
    			}else{
    				$.get("${ctx}/reg/checkLoginName.asp?loginName="+username,function(data,status){
    					var ret=data;
    					if(!ret){
    						$('#errorInfo').html('您输入的Email已经注册!');
    						$('#errorInfo').fadeIn();
    						$('#errorInfo').fadeOut(3000);
    						flagU=false;
    						return;
    					}
    				});
    				flagU=true;
    			}
    		});	
    		$('input#inputPassword').blur(function(){
    			var psd=$('input#inputPassword').val();
    			var reg=/^(?![0-9]+$)(?![A-Za-z]+$).{6,}/;		
    			if(!reg.test(psd)){
    				$('#errorInfo').html('请输入至少6位密码且必须同时包含数字字母');
    				$('#errorInfo').fadeIn();
    				$('#errorInfo').fadeOut(3000);
    				flagPsd=false;
    			}else{
    				flagPsd=true;
    				}
    		});	
    		$('input#inputPasswordagain').blur(function(){
    			var psdAgn=$('input#inputPassword').val();
    			var psd=$('input#inputPasswordagain').val();	
    			if(psdAgn!=psd){
    				$('#errorInfo').html('两次密码输入不一致');
    				$('#errorInfo').fadeIn();
    				$('#errorInfo').fadeOut(3000);
    				flagPsdAgn=false;
    			}else{
    				flagPsdAgn=true;
    				}
    		});	
    		$('button#regBtn').click(function(){
    			if(flagU && flagPsd && flagPsdAgn){
    				var data = {
    						loginName:$('input#inputEmail').val(),		
    						password:$('input#inputPassword').val()
    				};
    				$.post("${ctx}/reg", data, function(e,status) {
    					var ret =$.parseJSON(e);
    			        if(ret.success){
    			            alert(ret.msg);
    			            window.location.href='${ctx}/login';
    			        }
    			        else{
    			        	$('#errorInfo').html(ret.msg);
    	    				$('#errorInfo').fadeIn();
    	    				$('#errorInfo').fadeOut(3000);
    			        }  
    			    });
    			}else{
    				$('#errorInfo').html('请正确填写注册信息!');
    				$('#errorInfo').fadeIn();
    				$('#errorInfo').fadeOut(3000);
    			}
    		});	
    		$('#reg_form').keypress(function(event){
    			if(event.keyCode==13){
    				if(flagU && flagPsd && flagPsdAgn){
        				var data = {
        						loginName:$('input#inputEmail').val(),		
        						password:$('input#inputPassword').val()
        				};
        				$.post("${ctx}/reg", data, function(e,status) {
        					var ret =$.parseJSON(e);
        			        if(ret.success){
        			            alert(ret.msg);
        			            window.location.href='${ctx}/login';
        			        }
        			        else{
        			        	$('#errorInfo').html(ret.msg);
        	    				$('#errorInfo').fadeIn();
        	    				$('#errorInfo').fadeOut(3000);
        			        }  
        			    });
    				}else{
    					$('#errorInfo').html('请正确填写注册信息!');
    					$('#errorInfo').fadeIn();
    					$('#errorInfo').fadeOut(3000);
    				}
    			}
    		});	
    	});
    
    </script>
  </body>
</html>