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
            padding-top: 50px;
            padding-bottom: 40px;
        }
		a:hover,a:visited,a:link,a:active{
			text-decoration:none;
			outline:none;
		}
        /* 轮播广告 */

        .carousel {        
            margin-bottom: 60px;
        }

        .carousel .item {
            height: 500px;
        }

        .carousel .item img {
            width: 100%;
        }

        .carousel-caption p {
            margin-bottom: 20px;
            font-size: 20px;
            line-height: 1.8;
        }
		#summary-container{
			text-align:center;
		}
		#summary-container a:hover{
			text-decoration:none;
			color:#000;
		}
		#summary-container a{
			color:#333;
		}
		.hr-divider{
			margin-top:100px;
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
            <a class="navbar-brand" href="#">臻品生活家</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="${ctx}/portal/index">首页</a></li>
              <li><a href="${ctx}/portal/food">美食</a></li>
              <li><a href="${ctx}/portal/activity">活动</a></li>
              <li><a href="#"  data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
<%--             <ul class="nav navbar-nav navbar-right">
              <li><a href="${ctx}/portal//login">登录</a></li>
              <li><a href="${ctx}/portal/reg">注册</a></li>
            </ul> --%>
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




      <!--    轮播 -->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
          </ol>
        
          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="${ctx}/static/images/lunbo/lunbo1.jpg" alt="...">
              <div class="carousel-caption">
                <h1>红酒雪梨 </h1>
                <p><a class="btn btn-primary" href="#" role="button">查看详情</a></p>
              </div>
            </div>
            <div class="item">
              <img src="${ctx}/static/images/lunbo/lunbo2.jpg" alt="...">
              <div class="carousel-caption">
                <h1>南瓜酒酿小圆子</h1>
                <p><a class="btn btn-primary" href="#" role="button">查看详情</a></p>
              </div>
            </div>
            <div class="item">
              <img src="${ctx}/static/images/lunbo/lunbo3.jpg" alt="...">
              <div class="carousel-caption">
                <h1>藜麦秋葵虾仁蛋饼</h1>
                <p><a class="btn btn-primary" href="#" role="button">查看详情</a></p>
              </div>
            </div>
            <div class="item">
              <img src="${ctx}/static/images/lunbo/lunbo4.jpg" alt="...">
              <div class="carousel-caption">
                <h1>雪梨银耳炖木瓜</h1>
                <p><a class="btn btn-primary" href="#" role="button">查看详情</a></p>
              </div>
            </div>
          </div>
        
          <!-- Controls -->
          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
       <!--/carousel --> 



    <div class="container">    
    
    
         <!-- 简介 -->
    <div class="row" id="summary-container">
        <div class="col-md-4">
            <a href="${ctx}/portal/food">
            <img class="img-circle" src="${ctx}/static/images/icons/meishi.png" alt="美食">

            <h2>美食</h2>

            <p>体验极致烹饪</p>
			</a>
            
        </div>
        <div class="col-md-4">
        	<a href="${ctx}/portal/activity">
            <img class="img-circle" src="${ctx}/static/images/icons/huodong.png" alt="活动">

            <h2>活动</h2>

            <p>我们号召城中所有美食达人，辣妈主妇，烘焙大师，城市OL等民间高手，爱好生活、美食的伙伴们都将相聚于此。</p>
			</a>

           
        </div>
        <div class="col-md-4">
        	<a href="${ctx}/manage">
            <img class="img-circle" src="${ctx}/static/images/icons/wode.png" alt="我的">

            <h2>我的</h2>

            <p>更多个人信息查询管理。</p>
			</a>

            
        </div>
    </div>

    <hr class="hr-divider">
    <footer>
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p>&copy; 2018 臻品生活家 </p>
    </footer>
    
        
</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/static/js/bootstrap.min.js"></script>
  </body>
</html>