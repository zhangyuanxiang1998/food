package edu.zstu.web.activity;

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

import edu.zstu.entity.Activity;
import edu.zstu.entity.ActivityOrder;
import edu.zstu.entity.FileAttach;
import edu.zstu.service.FileAttachService;
import edu.zstu.entity.Food;
import edu.zstu.entity.FoodSteps;
import edu.zstu.entity.User;
import edu.zstu.service.ActivityOrderService;
import edu.zstu.service.ActivityService;
import edu.zstu.service.UserService;

@Controller
@RequestMapping(value="/activity")
public class ActivityController {
	@Autowired
	private UserService userService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private ActivityOrderService activityOrderService;
	@Autowired
	private FileAttachService fileAttachService;
	
	@RequestMapping(value = "/deploy", method = RequestMethod.POST)
	public  String deploy(@RequestParam("file") CommonsMultipartFile[]  files,	@RequestParam("activityName") String  activityName,
			@RequestParam("activityArea") String activityArea,@RequestParam("activityAddress") String activityAddress,
			@RequestParam("activityContent") String activityContent ,@RequestParam("activityTimeStart") String activityTimeStart,
			@RequestParam("activityTimeEnd") String activityTimeEnd ,HttpServletRequest request) {
		Activity entity=new Activity();
		User user=this.userService.getCurrentUser();
		entity.setUser(user);
		entity.setActivityName(activityName);
		entity.setActivityArea(activityArea);
		entity.setActivityAddress(activityAddress);
		entity.setActivityContent(activityContent);
		entity.setActivityTimeStart(activityTimeStart);
		entity.setActivityTimeEnd(activityTimeEnd);
		 //处理图片
		CommonsMultipartFile file=files[0];
		List<FileAttach> pics=new ArrayList<FileAttach>();
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
        FileAttach fileAttach=new FileAttach();
        fileAttach.setFileName(filename);
        fileAttach.setFileType(type);
        fileAttach.setFilePath("/static/upload/" + filename);
        this.fileAttachService.save(fileAttach);
        pics.add(fileAttach);
        
		for(int i=0;i<1;i++){
//			ActivityOrder order=new ActivityOrder();
//			order.setStepNo(new Integer(i+1));
//			order.setStepDesc(stepDescs[i]);
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
            pics.add(fileAttach);
		}	
		entity.setFiles(pics);
        this.activityService.save(entity);
        return "redirect:../portal/activity";
	}
//	Ajax请求预定
	@RequestMapping(value = "addOrder")
	public @ResponseBody Boolean addOrder(@RequestParam("id") Long id){
		User user=this.userService.getCurrentUser();
		if(user!=null){
			Activity activity=this.activityService.findOne(id);
			if(activity!=null){
				ActivityOrder order=new ActivityOrder();
				order.setActivity(activity);
				order.setUser(user);
				this.activityOrderService.save(order);
				return true;
			}
		}
		return false;
	}
	
//	Ajax请求取消预定
	@RequestMapping(value = "cancelOrder")
	public @ResponseBody Boolean cancelOrder(@RequestParam("id") Long id){
		User user=this.userService.getCurrentUser();
		if(user!=null){
			Activity activity=this.activityService.findOne(id);
			if(activity!=null){
				List<ActivityOrder> order=this.activityOrderService.findByUserAndFood(user, activity);;
				this.activityOrderService.delete(order.get(0).getId());
				return true;
			}
		}
		return false;
	}
}
