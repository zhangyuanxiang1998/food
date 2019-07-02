package edu.zstu.entity;



import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
@Table(name = "FOOD")
public class Food extends BaseEntity {
	private String foodName;
	private Date deployDate;
	private String foodMaterial;
	private Integer foodLikes;
	private Integer foodSteps;
	private User user;
	private FileAttach file;
	private List<FoodSteps> steps;
	
	@OneToMany
	@Cascade(value = { CascadeType.ALL })
	@JoinColumn(name = "Food_ID")
	@OrderBy("STEP_NO ASC")
	public List<FoodSteps> getSteps() {
		return steps;
	}
	public void setSteps(List<FoodSteps> steps) {
		this.steps = steps;
	}
	@Column(name = "FOOD_NAME")
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	
	@Column(name = "DEPLOY_DATE")
	public Date getDeployDate() {
		return deployDate;
	}
	public void setDeployDate(Date deployDate) {
		this.deployDate = deployDate;
	}
	
	@Column(name = "FOOD_MATERIAL")
	public String getFoodMaterial() {
		return foodMaterial;
	}
	public void setFoodMaterial(String foodMaterial) {
		this.foodMaterial = foodMaterial;
	}
	
	@Column(name = "FOOD_LIKES")
	public Integer getFoodLikes() {
		return foodLikes;
	}
	public void setFoodLikes(Integer foodLikes) {
		this.foodLikes = foodLikes;
	}
	
	@Column(name = "FOOD_STEPS")
	public Integer getFoodSteps() {
		return foodSteps;
	}
	public void setFoodSteps(Integer foodSteps) {
		this.foodSteps = foodSteps;
	}
	
	@ManyToOne(targetEntity = User.class)
	@Cascade(value = {CascadeType.REFRESH })
	@JoinColumn(name = "USER_ID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(targetEntity = FileAttach.class)
	@Cascade(value = {CascadeType.REFRESH })
	@JoinColumn(name = "File_ID")
	public FileAttach getFile() {
		return file;
	}
	public void setFile(FileAttach file) {
		this.file = file;
	}
	
	
	
	
	
}
