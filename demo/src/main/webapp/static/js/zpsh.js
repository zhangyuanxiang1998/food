// JavaScript Document
$(document).ready(function() {
	$("#myActivityManage").hide();
	$("#mySettings").hide();
	$("#divFoodrelease").hide();
	$("#divActivityrelease").hide();

	$("#menuMyFood").click(function(){
		 	$("#myFoodManage").show();
			$("#myActivityManage").hide();
			$("#mySettings").hide();
			$("#divFoodrelease").hide();
			$("#divActivityrelease").hide();
			
			$("#menuMyFood").parent().addClass("active");
			$("#menuMyActivity").parent().removeClass("active");
			$("#menuMySettings").parent().removeClass("active");
			$("#menuFoodRelease").parent().removeClass("active");
			$("#menuActivityRelease").parent().removeClass("active");
	 });


	$("#menuMyActivity").click(function(){
		 	$("#myActivityManage").show();
			$("#myFoodManage").hide();
			$("#mySettings").hide();
			$("#divFoodrelease").hide();
			$("#divActivityrelease").hide();
			
			$("#menuMyActivity").parent().addClass("active");
			$("#menuMyFood").parent().removeClass("active");
			$("#menuMySettings").parent().removeClass("active");
			$("#menuFoodRelease").parent().removeClass("active");
			$("#menuActivityRelease").parent().removeClass("active");
	 });

	$("#menuMySettings").click(function(){
		 	$("#mySettings").show();
			$("#myFoodManage").hide();
			$("#myActivityManage").hide();
			$("#divFoodrelease").hide();
			$("#divActivityrelease").hide();
			
			$("#menuMySettings").parent().addClass("active");
			$("#menuMyFood").parent().removeClass("active");
			$("#menuMyActivity").parent().removeClass("active");
			$("#menuFoodRelease").parent().removeClass("active");
			$("#menuActivityRelease").parent().removeClass("active");
	 });	
	
	$("#menuFoodRelease").click(function(){
		 	$("#divFoodrelease").show();
			$("#myFoodManage").hide();
			$("#myActivityManage").hide();
			$("#mySettings").hide();
			$("#divActivityrelease").hide();
			
			$("#menuFoodRelease").parent().addClass("active");
			$("#menuMyFood").parent().removeClass("active");
			$("#menuMySettings").parent().removeClass("active");
			$("#menuMyActivity").parent().removeClass("active");
			$("#menuActivityRelease").parent().removeClass("active");
	 });	
	 
	$("#menuActivityRelease").click(function(){
	 	$("#divActivityrelease").show();
		$("#myFoodManage").hide();
		$("#myActivityManage").hide();
		$("#mySettings").hide();
		$("#divFoodrelease").hide();
		
		$("#menuActivityRelease").parent().addClass("active");
		$("#menuFoodRelease").parent().removeClass("active");
		$("#menuMyFood").parent().removeClass("active");
		$("#menuMySettings").parent().removeClass("active");
		$("#menuMyActivity").parent().removeClass("active");
		
	});
	
	 
	 
	
	//按照步骤数增加DOM内容
    $("#btnStepsNumber").click(function(){
			var stepsNumber=$("#stepsNumber").val();
			//alert(i);
			if(stepsNumber<3){
				alert('至少三个步骤以上!');
				$("#stepsNumber").val(3);
				return;
			}
			for(var i=4;i<=stepsNumber;i++)
			{
				$('<div class="form-group"><label for="step'+i+'" class="col-sm-2 control-label">步骤'+i+'</label><div class="col-sm-10"><input type="text" class="form-control" id="step'+i+'" name="stepDesc" placeholder="步骤'+i+' 具体操作" required></div></div><div class="form-group"> <label for="uploadImageForStep'+i+'"  class="col-sm-2 control-label">上传照片</label><div class="col-sm-4"><input type="file" name="file" required accept="image/*" id="uploadImageForStep'+i+'"></div></div>').appendTo($("#divSteps"));
				//alert(stepsNumber);
			}
		});
});