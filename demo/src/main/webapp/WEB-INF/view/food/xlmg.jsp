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
    <title>臻品生活家-美食-雪梨银耳炖木瓜</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

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
              <li class="active"><a href="${ctx}/portal/index">首页</a></li>
              <li><a href="${ctx}/portal/food">美食</a></li>
              <li><a href="${ctx}/portal/activity">活动</a></li>
              <li><a href="#"  data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
			<jsp:directive.include file="../layout/userinfo.jsp"/>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </div><!--/nav -->


    <!-- 登录框 -->
    <div class="modal fade" id="signin-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">请登录</h4>
                </div>
                <div class="modal-body">
                    <form class="form-signin">
                        <p><label for="inputEmail" class="sr-only">邮件</label>
                        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus></p>
                        <p><label for="inputPassword" class="sr-only">密码</label>
                        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required></p>
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" value="remember-me"> 记住我
                          </label>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--注册框 -->
    <div class="modal fade" id="reg-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">欢迎注册</h4>
                </div>
                <div class="modal-body">
                    <form class="form-reg">
                        <p><label for="inputEmail" class="sr-only">邮件</label>
                        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus></p>
                        <p><label for="inputPassword" class="sr-only">密码</label>
                        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required></p>
                        <p><label for="inputPasswordagain" class="sr-only">再次输入密码</label>
                        <input type="passwordagain" id="inputPasswordagain" class="form-control" placeholder="Passwordagain" required></p>
                        <p><button class="btn btn-lg btn-primary btn-block" type="submit">注册</button></p>
                    </form>
                </div>
            </div>
        </div>
    </div>




  <div class="container">    
    

    <!--制作过程-->
	<div class="foodmaking">
        <div class="food_tit"><h1>雪梨银耳炖木瓜</h1>
        <a href="#"><span class="glyphicon glyphicon-heart-empty heart-no" aria-hidden="true"> </span></a><span class="heart-no"> 收藏</span>            
        <a href="#"><span class="glyphicon glyphicon-thumbs-up thumbs-up-yes" aria-hidden="true"> </span></a><span class="thumbs-up-yes"> 32人</span>
        </div>
        <hr>
        <div class="food_time" id="news_time">2018-01-16</div>
        <div class="food_content" id="news_content">
            <p>
                <img alt="" src="images/xlmg01.jpg" />
            </p>
            <p>素材：</p>
            <p>银耳 一朵、雪梨 1个、木瓜 150g、冰糖 50g</p>
            <p>步骤：</p>
            <p>1 银耳用水泡发一小时，冲洗干净后，摘成小碎片。</p>
            <p><img alt="" src="images/xlmg02.jpg"></p>
            <p>2 雪梨削皮去核，切成小块。</p>
            <p><img alt="" src="images/xlmg03.jpg" /></p>
            <p>3 木瓜去外皮，剖开去掉中间的瓤，切成小块。</p>
            <p><img alt="" src="images/xlmg04.jpg"></p>
            <p>4 碗内放凉水，加入所有食材全部，放进方太蒸箱 100度 30分钟即可。</p>
            <p><img alt="" src="images/xlmg05.jpg" /></p>
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
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>