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
    <title>臻品生活家-美食</title>

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
        a:hover,a:visited,a:link,a:active{
			text-decoration:none;
		}
		.navpager{
			text-align:center;
		}
		#example li {cursor: pointer;}
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
    			<!-- 查询条件面板 -->
    			<p>	<p>	<p>
			<div class="panel panel-default">
				  <div class="panel-body">
				    <span><strong>排序方式：</strong></span>
				    <div class="btn-group" data-toggle="buttons">
				    <label class="btn btn-default active">
					    <input type="radio" name="options" id="option1" autocomplete="off" value="deployDate"> 发布日期
					  </label>	
					  <label class="btn btn-default">
					    <input type="radio" name="options" id="option2" autocomplete="off" value="foodName">美食名称
					  </label>
					  <label class="btn btn-default">
					    <input type="radio" name="options" id="option3" autocomplete="off" value="user.loginName">发布人
					  </label>	
				  
					</div>
				    <br><br>
				    <div id="queryForm">
					    <form class="form-inline">
						  <div class="form-group">
						    <label for="txtFoodName">美食名称：</label>
						    <input type="text" class="form-control" id="txtFoodName" placeholder="美食名称">
						  </div>
						  <div class="form-group">
						    <label for="txtDeployUser">发布人：</label>
						    <input type="text" class="form-control" id="txtDeployUser" placeholder="发布人：">
						  </div>
						  <div class="form-group">
						    <label for="dateB">发布日期：</label>
						    <input type="date" class="form-control" id="dateB">
						  </div>
						  <div class="form-group">
						    <label for="dateE">至</label>
						    <input type="date" class="form-control" id="dateE">
						  </div>
						  <input type="button" name="query" id="query" value="查询" class ="btn btn-primary">
		        		  <input type="reset" name="reset" id="reset" value="重置" class ="btn btn-primary">
						</form>
					</div>
				  </div>
			</div>
    
         <!-- 美食列表 -->
    <div class="row" id="food-container">         
		
    </div> <!-- 美食列表 row -->
	<div class="row" style="margin:0 auto; text-align:center;">
		<ul id='example'></ul>
	</div>
    <hr class="hr-divider">
    <footer>
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p>&copy; 2018 臻品生活家 </p>
    </footer>
    
        
</div> <!-- container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx}/static/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/js/bootstrap-paginator.min.js"></script>
    <!-- 列表读取模板js -->
	<script type="text/javascript">
		var limit = 1;	
		var currentPage=1;
		var totalPages=0;		
		function listFoods(page) {
			var sort = $("input[name='options']:checked").val();
			var foodName=$("#txtFoodName").val();
			var deployUser=$("#txtDeployUser").val();
			var startDate=$("#dateB").val();
			var endDate=$("#dateE").val();
			$.get("${ctx}/portal/getFoods", {page: page, limit: limit,sort:sort,foodName:foodName,deployUser:deployUser,startDate:startDate,endDate:endDate}, function(data) {
				var foodHtms = "";	
				if (data != null && data.records != null && data.records.length!=0) {
					if(page==1){
			 		    var options = {
								bootstrapMajorVersion: 3, 	//版本
								currentPage: data.currentPage, 	//当前页数
								totalPages: data.pageCount, 		//总页数
								itemTexts: function(type, page, current) {
									switch(type) {
										case "first":
											return "首页";
										case "prev":
											return "上一页";
										case "next":
											return "下一页";
										case "last":
											return "末页";
										case "page":
											return page;
									}
								} ,
								//点击事件，用于通过Ajax来刷新整个list列表
								onPageClicked: function(event, originalEvent, type, page) {
									listFoods(page);              
								}
							};
						$('#example').bootstrapPaginator(options); 	
					}					
					$.each(data.records, function(index, item){
						foodHtms += '<div class="col-sm-6 col-md-4 col-lg-3 ">';
						foodHtms += '<div class="thumbnail">';
						foodHtms += '<a href="${ctx}/portal/foodDetail?id='+item.id+'" title="'+item.foodName+'" target="_blank" ><img class="lazy" src="${ctx}/'+item.file.filePath+'"   alt="'+item.foodName+'"></a>';
						foodHtms += "<div class='caption'>";
						var d=new Date(item.deployDate);
						foodHtms += '<div class="caption"> <h3><a href="${ctx}/portal/foodDetail?id='+item.id+'" title="'+item.foodName+'" target="_blank">'+item.foodName+'<br><small>'+d.toLocaleDateString()+'</small></a></h3>';
						foodHtms +='<p>'+item.foodMaterial+'</p>  </div>';
						foodHtms += "</div>";
						foodHtms += "</div>";
						foodHtms += "</div>";
					});
				}else{
					foodHtms='<div class="row" id="food-container"> <div class="col-sm-6 col-md-4 col-lg-3 "><div class="thumbnail">'
			          		+'<div class="caption"> <h3>No Records</h3></div></div></div>';
				}
				$("#food-container").html(foodHtms);
			}, "json");	
			
		}

		$(document).ready(function() {
			listFoods(1);
			$("#query").click(function(){ listFoods(1); });
			$("input[name='options']").change(function(){ listFoods(1); });
		})
	</script>

  </body>
</html>