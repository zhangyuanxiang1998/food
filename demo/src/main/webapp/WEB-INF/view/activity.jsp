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
    <title>臻品生活家-活动</title>

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
			background-color:#fefefe;
        }
		#activity-container .thumbnail{
			height:320px;
		}
        a:hover,a:visited,a:link,a:active{
			text-decoration:none;
		}
		.activityholder{
			width:100%;
			border:1px solid #eee;
			margin:30px auto;
			padding:10px;
			background-color:#FFF;
		}
		.hd_title{
			padding:30px 0 10px 0;
			color:#666;
			font-size:28px;
		}
		.hd_adr{
			color:#666;
		}
		.hd_basic{
			border-bottom:1px solid #ddd;
		}
		.hd_basic span{
			font-weight:bold;
		}
		.hd_desc img{
			width:100%;
		}
		.hd_order{
			text-align:center;
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
              <li><a href="${ctx}/portal/food">美食</a></li>
              <li  class="active"><a href="${ctx}/portal/activity">活动</a></li>
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
					    <input type="radio" name="options" id="option2" autocomplete="off" value="activityName">活动名称
					  </label>
					  <label class="btn btn-default">
					    <input type="radio" name="options" id="option3" autocomplete="off" value="user.loginName">发布人
					  </label>	
				  
					</div>
				    <br><br>
				    <div id="queryForm">
					    <form class="form-inline">
						  <div class="form-group">
						    <label for="txtActivityName">活动名称：</label>
						    <input type="text" class="form-control" id="txtActivityName" placeholder="活动名称">
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

 
         <!-- 活动列表 -->
    <div class="row" id="activity-container">  
    <div class="activityholder"> <!-- activity holder start -->
    </div>             
		
    </div> <!-- 活动列表 row -->
	<div class="row" style="margin:0 auto; text-align:center;">
		<ul id='example'></ul>
	</div>
    <hr class="hr-divider">
    <footer>
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p>&copy; 2018 臻品生活家 </p>
    </footer>
    
        
</div>  <!-- container -->
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
		function listactivities(page) {
			var sort = $("input[name='options']:checked").val();
			var activityName=$("#txtActivityName").val();
			var deployUser=$("#txtDeployUser").val();
			var startDate=$("#dateB").val();
			var endDate=$("#dateE").val();
			$.get("${ctx}/portal/getActivities", {page: page, limit: limit,sort:sort,activityName:activityName,deployUser:deployUser,startDate:startDate,endDate:endDate}, function(data) {
				var activityHtms = '<div class="activityholder">';	
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
									listactivities(page);              
								}
							};
						$('#example').bootstrapPaginator(options); 	
					}					
					$.each(data.records, function(index, item){
						var orderTag = false;
						var i = 0;
						
						<c:forEach items="${userOrders}" var="userOrder"> 
							if( ${ userOrder.activity.getId() } == item.id ){
								orderTag = true;
							} 
						</c:forEach>	
						activityHtms += '<div class="hd_list">';
						activityHtms += '<p class="hd_title">'+item.activityName+'</p>';
						activityHtms += '<p class="hd_adr"><span class="glyphicon glyphicon glyphicon-map-marker" aria-hidden="true"> </span>'+item.activityArea+'</p>';
						activityHtms += '<p class="hd_basic"><span>活动时间:</span>'+item.activityTimeStart+'-'+item.activityTimeEnd+'<span style="padding-left:100px;">活动地点:</span>'+item.activityAddress+'</p>';
						activityHtms += '<div class="hd_desc"><p>'+item.activityContent+'</p>';
						activityHtms += '<p><a href="${ctx}/portal/activityDetail?id='+item.id+'" title="'+item.activityName+'" target="_blank" ><img src="${ctx}/'+item.files[0].filePath+'"   alt="'+item.activityName+'"></a></p>';
						activityHtms += '<p><a href="${ctx}/portal/activityDetail?id='+item.id+'" title="'+item.activityName+'" target="_blank" ><img src="${ctx}/'+item.files[1].filePath+'"   alt="'+item.activityName+'"></a></p>';
						activityHtms += "</div>";
						if(orderTag){
							activityHtms += '<p class="hd_order"><a href="#" class="btn btn-danger btn-lg" id="cancelOrder" data-id="'+item.id+'">取消预约</a></p>';
						}
						else{
							activityHtms += '<p class="hd_order"><a href="#" class="btn btn-default btn-lg" id="addOrder" data-id="'+item.id+'">点击预约</a></p>';
						}
						//activityHtms += '<p class="hd_order"><a href="#" class="btn btn-default btn-lg">点击预约</a></p>';
						activityHtms += "</div>";
						activityHtms += "</div>";
					});
				}else{
					activityHtms='<div class="row" id="activity-container"> <div class="col-sm-6 col-md-4 col-lg-3 "><div class="thumbnail">'
			          		+'<div class="caption"> <h3>No Records</h3></div></div></div>';
				}
				$("#activity-container").html(activityHtms);
			}, "json");	
			
		}

		$(document).ready(function() {
			listactivities(1);
			$("#query").click(function(){ listactivities(1); });
			$("input[name='options']").change(function(){ listactivities(1); });
			$(document).on('click','#addOrder',function(){  
    			if(curUser==null){
    				window.location.href="${ctx}/login";
    			}else{
        			var id= this.getAttribute("data-id");
        			$.get("${ctx}/activity/addOrder?id="+id,function(data,status){
    					var ret=data;
    					if(!ret){
    						alert('操作异常,请重试!');
    					}else{
    						window.location.reload();
    					}
    				});
    			}
		    }); 
			$(document).on('click','#cancelOrder',function(){  
    			if(curUser==null){
    				window.location.href="${ctx}/login";
    			}else{
        			var id= this.getAttribute("data-id");
        			$.get("${ctx}/activity/cancelOrder?id="+id,function(data,status){
    					var ret=data;
    					if(!ret){
    						alert('操作异常,请重试!');
    					}else{
    						window.location.reload();
    					}
    				});
    			}
		    });  
		})
	</script>
  </body>
</html>