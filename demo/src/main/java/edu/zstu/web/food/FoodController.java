package edu.zstu.web.food;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import edu.zstu.entity.FileAttach;
import edu.zstu.entity.Food;
import edu.zstu.entity.FoodCollect;
import edu.zstu.entity.FoodSteps;
import edu.zstu.entity.User;
import edu.zstu.service.FileAttachService;
import edu.zstu.service.FoodCollectService;
import edu.zstu.service.FoodService;
import edu.zstu.service.UserService;


/**
 * 美食处理Controller.
 *  * @author tlb
 */
@Controller
@RequestMapping(value = "/food")
public class FoodController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private FoodCollectService foodCollectService;
	
	@Autowired
	private FileAttachService fileAttachService;
	
	@RequestMapping(value = "/deploy", method = RequestMethod.POST)
	public  String deploy(@RequestParam("file") CommonsMultipartFile[]  files,	@RequestParam("stepDesc") String[]  stepDescs,
			@RequestParam("foodName") String foodName,@RequestParam("foodMaterial")String foodMaterial  ,HttpServletRequest request) {
		Food entity=new Food();
		User user=this.userService.getCurrentUser();
		entity.setUser(user);
		entity.setDeployDate(new Date());
		entity.setFoodName(foodName);
		entity.setFoodMaterial(foodMaterial);
		entity.setFoodSteps(stepDescs.length);
		entity.setFoodLikes(0);		
		/*保存第一张照片*/
		CommonsMultipartFile file=files[0];
		String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));// 取文件格式后缀名
        String filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
        String path = request.getSession().getServletContext().getRealPath("/static/upload/" + filename);// 存放位置
        File destFile = new File(path);
        try {
       	   // FileUtils.copyInputStreamToFile()这个方法里对IO进行了自动操作，不需要额外的再去关闭IO流
       	     FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);// 复制临时文件到指定目录下
       	            } catch (IOException e) {
       	                  e.printStackTrace();
       	             }
        //保存图片路径到数据库
        FileAttach fileAttach=new FileAttach();
        fileAttach.setFileName(filename);
        fileAttach.setFileType(type);
        fileAttach.setFilePath("/static/upload/" + filename);
        this.fileAttachService.save(fileAttach);
        entity.setFile(fileAttach);
        //处理加工步骤
		List<FoodSteps> steps=new ArrayList<FoodSteps>();
		for(int i=0;i<stepDescs.length;i++){
			FoodSteps step=new FoodSteps();
			step.setStepNo(new Integer(i+1));
			step.setStepDesc(stepDescs[i]);
			file=files[i+1];
			//保存图片到服务器
			type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));// 取文件格式后缀名
            filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
            path = request.getSession().getServletContext().getRealPath("/static/upload/" + filename);// 存放位置
            destFile = new File(path);
            try {
           	   // FileUtils.copyInputStreamToFile()这个方法里对IO进行了自动操作，不需要额外的再去关闭IO流
           	     FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);// 复制临时文件到指定目录下
           	            } catch (IOException e) {
           	                  e.printStackTrace();
           	             }
          //保存图片路径到数据库
            fileAttach=new FileAttach();
            fileAttach.setFileName(filename);
            fileAttach.setFileType(type);
            fileAttach.setFilePath("/static/upload/" + filename);
            this.fileAttachService.save(fileAttach);
            step.setFile(fileAttach);	
            steps.add(step);
		}		
		entity.setSteps(steps);
		this.foodService.save(entity);
	 return "redirect:../portal/food";
	}
//	Ajax请求添加收藏
	@RequestMapping(value = "addCollect")
	public @ResponseBody Boolean addCollect(@RequestParam("id") Long id){
		User user=this.userService.getCurrentUser();
		if(user!=null){
			Food food=this.foodService.findOne(id);
			if(food!=null){
				FoodCollect collect=new FoodCollect();
				collect.setFood(food);
				collect.setUser(user);
				this.foodCollectService.save(collect);
				return true;
			}
		}
		return false;
	}
	
//	Ajax请求取消收藏
	@RequestMapping(value = "cancelCollect")
	public @ResponseBody Boolean cancelCollect(@RequestParam("id") Long id){
		User user=this.userService.getCurrentUser();
		if(user!=null){
			Food food=this.foodService.findOne(id);
			if(food!=null){
				List<FoodCollect> collect=this.foodCollectService.findByUserAndFood(user, food);;
				this.foodCollectService.delete(collect.get(0).getId());
				return true;
			}
		}
		return false;
	}
}
