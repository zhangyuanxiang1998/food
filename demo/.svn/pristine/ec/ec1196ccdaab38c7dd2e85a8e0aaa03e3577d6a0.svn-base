package edu.zstu.entity;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
@Table(name = "FOOD_STEPS")
public class FoodSteps extends BaseEntity {
	private Integer stepNo;
	private String stepDesc;
	private FileAttach file;
	
	
	@Column(name = "STEP_NO")
	public Integer getStepNo() {
		return stepNo;
	}
	public void setStepNo(Integer stepNo) {
		this.stepNo = stepNo;
	}
	@Column(name = "STEP_DESC")
	public String getStepDesc() {
		return stepDesc;
	}
	public void setStepDesc(String stepDesc) {
		this.stepDesc = stepDesc;
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
