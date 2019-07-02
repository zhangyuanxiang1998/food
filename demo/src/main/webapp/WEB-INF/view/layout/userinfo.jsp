 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
 <script src="${ctx}/static/js/jquery.min.js"></script> 
<script type="text/javascript">
var curUser=null;
	$(document).ready(function () { 
		
        //判断当前登录用户
    	$.get("${ctx}/portal/getCurrentUser", function(data) {
    		
    		curUser = data;
			if(curUser != null && curUser != undefined){
				$("#userInfoLi").html('<a href="${ctx}/manage">'+curUser.loginName+'</a>');
				$("#userOperationLi").html('<a href="${ctx}/logout">注销</a>');

			} else {
				$("#userInfoLi").html('<a href="${ctx}/login">登录</a>');
				$("#userOperationLi").html('<a href="${ctx}/reg">注册</a>');			 
			}
		}, "json");
	});
	</script>

   <ul class="nav navbar-nav navbar-right">
     <li id="userInfoLi"><a href="${ctx}/login">登录</a></li>
     <li id="userOperationLi"><a href="${ctx}/reg">注册</a></li>
   </ul>
