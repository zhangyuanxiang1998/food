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
    <title>我的臻品生活-美食</title>

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
            color: #5a5a5a;
        }

/* 下面是左侧导航栏的代码 */
.sidebar {
            position: fixed;
            top: 51px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            padding: 20px;
            overflow-x: hidden;
            overflow-y: auto;
            background-color: #ddd;
            border-right: 1px solid #eee;
        }

        .nav-sidebar {
            margin-right: -21px;
            margin-bottom: 20px;
            margin-left: -20px;
        }

        .nav-sidebar > li > a {
            padding-right: 20px;
            padding-left: 20px;
        }

        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
            color: #fff;
            background-color: #428bca;
        }
		.nav button{
			margin-top:-5px;
		}
        .main {
            padding: 20px;
        }

        .main .page-header {
            margin-top: 0;
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
				form img{
			width:200px;
			height:150px;
			border:1px solid #CCC;
		}
</style>

</head>

<body>
<!--下面是顶部导航栏的代码-->
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
              <li><a href="${ctx}/portal/food">美食</a></li>
              <li><a href="${ctx}/portal/activity">活动</a></li>
              <li><a href="#"  data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
			<jsp:directive.include file="layout/userinfo.jsp"/>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </div><!--/nav -->
      
      

<!--自适应布局-->
<div class="container-fluid">
<div class="row">
<!--左侧导航栏-->

    <div class="col-sm-3 col-md-2 sidebar">
        <ul class="nav nav-sidebar">
            <li class="active"><a href="#" id="menuMyFood">收藏的美食</a></li>
            <li><a href="#"  id="menuMyActivity">预约的活动</a></li>
        </ul>
        <ul class="nav nav-sidebar">
            <li><a href="#"  id="menuMySettings">设置</a></li>
        </ul>
        <ul class="nav nav-sidebar">
            <li><a href="#"  id="menuFoodRelease">美食发布</a></li>
            <li><a href="#"  id="menuActivityRelease">活动发布</a></li>
        </ul>
        
    </div>
<!--右侧管理控制台myFoodManage-->
    <div id="myFoodManage" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header">管理我的臻品生活</h1>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">我收藏的美食</h3>
            </div>
            <div class="panel-body">
                <ul class="nav nav-pills nav-stacked" role="tablist" id="collectManage">
                   
                </ul>
            </div>
        </div>
    </div>
    
<!--右侧管理控制台myActivityManage-->
    <div id="myActivityManage" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header">管理我的臻品生活</h1> 
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">我预约的活动</h3>
            </div>
            <div class="panel-body">
                <ul class="nav nav-pills nav-stacked" role="tablist" id="orderManage">
                   
                </ul>
            </div>
        </div>
    </div>
 <!--右侧管理控制mySettings台-->
	<div id="mySettings" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h3>修改密码</h3>
        <form class="form-reg">
            <p><label for="inputEmail" class="sr-only">邮件</label>
            <input type="email" id="inputEmail" class="form-control" placeholder="邮件" required autofocus></p>
            <p><label for="inputPassword" class="sr-only">原来的密码</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="原来的密码" required></p>
            <p><label for="inputNewPassword" class="sr-only">输入新密码</label>
            <input type="password" id="inputNewPassword" class="form-control" placeholder="输入新密码" required></p>
            <p><button class="btn btn-lg btn-primary btn-block" type="submit">提交</button></p>
        </form>
	</div>  
    
 
 <!--右侧管理控制台divFoodrelease-->
	<div id="divFoodrelease" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

        <form class="form-horizontal" role="form"  action="${ctx}/food/deploy" method="post"  enctype="multipart/form-data"> 
            <div class="form-group"> 
                <label for="inputFoodName" class="col-sm-2 control-label">美食名称</label> 
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputFoodName" name="foodName" placeholder="请输入美食名称" required>
                </div> 
            </div>
            <div class="form-group"> 
                <label for="uploadImage" class="col-sm-2 control-label">上传照片</label> 
                <div class="col-sm-10">
                    <input type="file" name="file" id="uploadImage" accept="image/*"   required>
                </div> 
            </div>
            <div class="form-group"> 
                <label for="inputMaterials" class="col-sm-2 control-label">材料</label> 
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputMaterials" placeholder="需要材料" name="foodMaterial" required>
                </div> 
            </div>    
            <div class="form-group"> 
                <label for="stepsNumber" class="col-sm-2 control-label">步骤数</label> 
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="stepsNumber" name="foodSteps" placeholder="步骤数" value="3" required>
                </div> 
                <div class="col-sm-2">
                    <a class="btn btn-success" id="btnStepsNumber">确定</a>
                </div>
            </div>  
            <div id="divSteps">
                <div class="form-group"> 
                    <label for="step1" class="col-sm-2 control-label">步骤1</label> 
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="step1" name="stepDesc" placeholder="步骤1 具体操作" required>
                    </div> 
                </div>
                <div class="form-group"> 
                    <label for="uploadImageForStep1" class="col-sm-2 control-label">上传照片</label> 
                    <div class="col-sm-4">
                        <input type="file" id="uploadImageForStep1" name="file"  accept="image/*" required>                 
                    </div> 
<!--                     <div class="col-sm-6">        
                        <img src="">
                    </div>  -->
                </div>
                <div class="form-group"> 
                    <label for="step2" class="col-sm-2 control-label">步骤2</label> 
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="step2" name="stepDesc" placeholder="步骤2 具体操作" required>
                    </div> 
                </div>
                <div class="form-group"> 
                    <label for="uploadImageForStep2" class="col-sm-2 control-label">上传照片</label> 
                    <div class="col-sm-4">
                        <input type="file" id="uploadImageForStep2" name="file"  accept="image/*" required>                 
                    </div> 
                </div>
                <div class="form-group"> 
                    <label for="step3" class="col-sm-2 control-label">步骤3</label> 
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="step3" name="stepDesc" placeholder="步骤3 具体操作" required>
                    </div> 
                </div>
                <div class="form-group"> 
                    <label for="uploadImageForStep3" class="col-sm-2 control-label">上传照片</label> 
                    <div class="col-sm-4">
                        <input type="file" id="uploadImageForStep3"  name="file" accept="image/*" required>                 
                    </div> 
                </div>
            </div><!--/div-steps-->
            <div class="form-group text-center"> 
            <button type="submit" class="btn btn-default" >提交</button> 
            </div>
        </form>

	</div>
	
<!--右侧管理控制台divActivityrelease-->
	<div id="divActivityrelease" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

        <form class="form-horizontal" role="form"  action="${ctx}/activity/deploy" method="post"  enctype="multipart/form-data"> 
            <div class="form-group"> 
                <label for="inputActivityName" class="col-sm-2 control-label">活动名称</label> 
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputActivityName" name="activityName" placeholder="请输入活动名称" required>
                </div> 
            </div>
            <div id="divSteps">
                <div class="form-group"> 
                    <label for="uploadImageForStep1" class="col-sm-2 control-label">上传照片</label> 
                    <div class="col-sm-4">
                        <input type="file" id="uploadImageForStep1" name="file"  accept="image/*" required>                 
                    </div> 
<!--                     <div class="col-sm-6">        
                        <img src="">
                    </div>  -->
                </div>
                <div class="form-group"> 
                    <label for="uploadImageForStep2" class="col-sm-2 control-label">上传照片</label> 
                    <div class="col-sm-4">
                        <input type="file" id="uploadImageForStep2" name="file"  accept="image/*" required>                 
                    </div> 
                </div>
             </div>
            <div class="form-group"> 
                <label for="inputActivityArea" class="col-sm-2 control-label">活动区域</label> 
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputActivityArea" placeholder="活动区域" name="activityArea" required>
                </div> 
            </div>   
            <div class="form-group"> 
                <label for="inputActivityAddress" class="col-sm-2 control-label">活动地点</label> 
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputActivityAddress" placeholder="活动地点" name="activityAddress" required>
                </div> 
            </div> 
            <div class="form-group"> 
                <label for="inputActivityTimeStart" class="col-sm-2 control-label">活动开始时间</label> 
                <div class="col-sm-10">
                    <input type="date" class="form-control" id="inputActivityTimeStart" placeholder="活动开始时间" name="activityTimeStart" required>
                </div> 
            </div> 
            <div class="form-group"> 
                <label for="inputActivityTimeEnd" class="col-sm-2 control-label">活动结束时间</label> 
                <div class="col-sm-10">
                	<input type="date" class="form-control" id="inputActivityTimeEnd" placeholder="活动结束时间" name="activityTimeEnd" required>
                </div>
            </div> 
            <div class="form-group"> 
                <label for="inputActivityContent" class="col-sm-2 control-label">活动内容</label> 
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputActivityContent" placeholder="活动内容" name="activityContent" required>
                </div> 
            </div> 
            <div class="form-group text-center"> 
            <button type="submit" class="btn btn-default" >提交</button> 
            </div>
        </form>

	</div>
	<!--右侧管理控制台-->   
    
    
    
    
    
    
    
</div>
</div>
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/zpsh.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$.get("${ctx}/portal/getFoodsManage",  function(data) {
			var foodHtms = "";	
			if (data != null && data.length!=0) {	
				$.each(data, function(index, item){
					foodHtms += '<li role="presentation">';
					foodHtms += '<a href="#" class="alert alert-info">'+item.food.foodName+'</a>';
					foodHtms += '</li>';
				}); 
			 }else{
				foodHtms='<div class="row" id="food-container"> <div class="col-sm-6 col-md-4 col-lg-3 "><div class="thumbnail">'
		          		+'<div class="caption"> <h3>No Records</h3></div></div></div>';
			} 
			$("#collectManage").html(foodHtms);
		}, "json");	
	})
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$.get("${ctx}/portal/getActivitiesManage",  function(data) {
			var activityHtms = "";	
			if (data != null && data.length!=0) {	
				$.each(data, function(index, item){
					activityHtms += '<li role="presentation">';
					activityHtms += '<a href="#" class="alert alert-info"><span class="pull-right"><button class="btn btn-sm btn-danger">取消</button></span>'+item.activity.activityName+'</a>';
					activityHtms += '</li>';
				}); 
			 }else{
				foodHtms='<div class="row" id="food-container"> <div class="col-sm-6 col-md-4 col-lg-3 "><div class="thumbnail">'
		          		+'<div class="caption"> <h3>No Records</h3></div></div></div>';
			} 
			$("#orderManage").html(activityHtms);
		}, "json");	
	})
</script>
</body>
</html>