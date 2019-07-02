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
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/static/js/bootstrap.min.js"></script>
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
       .form-signin {
		  max-width: 330px;
		  padding: 15px;
		  margin: 0 auto;
		}
		.form-signin .form-signin-heading,
		.form-signin .checkbox {
		  margin-bottom: 10px;
		}
		.form-signin .checkbox {
		  font-weight: normal;
		}
		.form-signin .form-control {
		  position: relative;
		  height: auto;
		  -webkit-box-sizing: border-box;
			 -moz-box-sizing: border-box;
				  box-sizing: border-box;
		  padding: 10px;
		  font-size: 16px;
		}
		.form-signin .form-control:focus {
		  z-index: 2;
		}
		.form-signin input[type="email"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}
		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
		#error{
			position: absolute;
			width: 300px;
			height: 60px;
			background-color:#FEDC75;
			border: 1px #FFB46D solid;
			left: 50%;
			top: 10%;
			margin-left: -150px;
			margin-top: -30px;
			line-height: 60px;
			text-align: center;
			color: #f20c00;
			border-radius: 4px;
			font-size: 14px;
		}
		#erropClose{
			position: absolute;
			right: 4px;
			top:4px;
			width: 22px;
			height:22px;
			line-height:22px; 
			border: 0;
			color: #FFB46D;
			background-color:#fff;
			cursor: pointer;
			font-weight: bold;
		}
    </style>
    
  </head>
  <body>

		<%
			String error = (String) request.getAttribute("shiroLoginFailure");	
			if (error != null) {
				String errInfo="用户名不存在!";
				if(error.equals("org.apache.shiro.authc.IncorrectCredentialsException")) {
					errInfo="密码错误!";
				}
		%>	
		<script type="text/javascript">
			$(document).ready(function() {
				$("#error").animate({
					top : '10%'
				});
				$("#erropClose").click(function() {
					$("#error").fadeOut();
				});
			});
		</script>
		<div id="error"><%=errInfo%><a id="erropClose">×</a></div>
		<% } %>
<div class="container">
    <!-- 登录框 -->

                    <form class="form-signin" action="${ctx}/login" method="post">
                    	<h2 class="form-signin-heading">请登录</h2>
                        <p><label for="inputEmail" class="sr-only">邮件</label>
                        <input type="email" id="username"  name="username" class="form-control" placeholder="邮件" required autofocus value="${username}"></p>
                        <p><label for="inputPassword" class="sr-only">密码</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="密码" required></p>
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" value="true" id="rememberMe" name="rememberMe"> 记住我
                          </label>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
                    </form>

    
</div>

  </body>
</html>