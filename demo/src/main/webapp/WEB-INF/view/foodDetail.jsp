<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>臻品生活家-美食-南瓜葡萄发糕</title>

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
            padding-top: 50px;
            padding-bottom: 40px;
        }
		#food-container .thumbnail{
			height:320px;
		}
		hr{
			margin-top:3px;
		}
		a:hover,a:visited,a:link,a:active{
			text-decoration:none;
		}
		.glyphicon-thumbs-up{
			margin-left:30px;
		}
		.thumbs-up-no{
			color:#999;
		}
		.thumbs-up-yes{
			color:#69C;
		}
		.heart-no{
			color:#999;
		}
		.heart-yes{
			color:#F60;
		}
    </style>
    
  </head>
  <body>

        	<!--    导航 -->
     <div class="navbar navbar-default navbar-fixed-top" role="navigation" id="menu-nav">

        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${ctx}/portal/index">臻品生活家</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="${ctx}/portal/index">首页</a></li>
              <li class="active"><a href="${ctx}/portal/food">美食</a></li>
              <li><a href="${ctx}/portal/activity">活动</a></li>
              <li><a href="#"  data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
			<jsp:directive.include file="layout/userinfo.jsp"/>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </div><!--/nav -->


    <!-- 关于 -->
    <div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">关于</h4>
                </div>
                <div class="modal-body">
                    <p>动态网站开发课程Demo。</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
                </div>
            </div>
        </div>
    </div>


  <div class="container">   
    

    <!--制作过程-->
	<div class="foodmaking">
        <div class="food_tit">        	
        	<h1>${food.foodName}</h1>
        	<c:if test="${collectFlag==null || collectFlag==false}">
            <a href="#" id="add-collect"><span class="glyphicon glyphicon-heart-empty heart-no" aria-hidden="true"> </span></a><span class="heart-no">收藏</span>
            </c:if>
            <c:if test="${collectFlag==true}">
            <a href="#" id="cancel-collect"><span class="glyphicon glyphicon-heart heart-no" aria-hidden="true"> </span></a><span class="heart-no">取消收藏</span>
            </c:if>
            <a href="#" id="food-likes"><span class="glyphicon glyphicon-thumbs-up thumbs-up-no" aria-hidden="true"> </span></a><span class="thumbs-up-no">${food.foodLikes}人</span>
      </div>
        <hr>
        <div class="food_time" id="news_time"><fmt:formatDate value="${food.deployDate}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;发布人:${food.user.loginName}</div>
        <div class="food_content" id="news_content">
            <p>
                <img alt="" src="${ctx}${food.file.filePath}" />
            </p>
            <p>素材：</p>
            <p>${food.foodMaterial}</p>
            <p>步骤：</p>
			<c:forEach var="foodStep" items="${food.steps}" varStatus="varStep">
				<p>${varStep.index+1}.${foodStep.stepDesc}</p>
            	<p><img alt="" src="${ctx}${foodStep.file.filePath}"></p>
			</c:forEach>
		</div>
    </div>
	<!--/制作过程-->

    <hr class="hr-divider">
    <footer>
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p>&copy; 2018 臻品生活家 </p>
    </footer>
    
        
  </div> <!-- container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/static/js/bootstrap.min.js"></script>
    	<script type="text/javascript">		
		$(document).ready(function() {
    		$('#add-collect').click(function(){
    			if(curUser==null){
    				alert('请先登录！');
    				window.location.href="${ctx}/login";
    			}else{
        			var id=${food.id};
    				$.get("${ctx}/food/addCollect?id="+id,function(data,status){
    					var ret=data;
    					if(!ret){
    						alert('操作异常,请重试!');
    					}else{
    						window.location.reload();
    					}
    				});
    			}
    		});	
    		$('#cancel-collect').click(function(){
    			var id=${food.id};
				$.get("${ctx}/food/cancelCollect?id="+id,function(data,status){
					var ret=data;
					if(!ret){
						alert('操作异常,请重试!');
					}else{
						window.location.reload();
					}
				});
    		});	
    		$('#food-likes').click(function(){
    			var id=${food.id};
				$.get("${ctx}/portal/foodLikes?id="+id,function(data,status){
					var ret=data;
					if(!ret){
						alert('操作异常,请重试!');
					}else{
						window.location.reload();
					}
				});
    		});	
		});
	</script>
  </body>
</html>