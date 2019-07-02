package edu.zstu.entity;



import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
@Table(name = "ACTIVITY")
public class Activity extends BaseEntity {

	private User user;
	private String activityName;
	private String activityArea;
	private String activityAddress;
	private String activityTimeStart;
	private String activityTimeEnd;
	private String activityContent;
	
	private List<FileAttach> files;
	

	
	@ManyToOne(targetEntity = User.class)
	@Cascade(value = {CascadeType.REFRESH })
	@JoinColumn(name = "USER_ID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name="ACTIVITY_NAME")
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
	@Column(name="ACTIVITY_AREA")
	public String getActivityArea() {
		return activityArea;
	}
	public void setActivityArea(String activityArea) {
		this.activityArea = activityArea;
	}
	
	@Column(name="ACTIVITY_ADDRESS")
	public String getActivityAddress() {
		return activityAddress;
	}
	public void setActivityAddress(String activityAddress) {
		this.activityAddress = activityAddress;
	}
	
	@Column(name="ACTIVITY_TIME_START")
	public String getActivityTimeStart() {
		return activityTimeStart;
	}
	public void setActivityTimeStart(String activityTimeStart) {
		this.activityTimeStart = activityTimeStart;
	}
	
	@Column(name="ACTIVITY_TIME_END")
	public String getActivityTimeEnd() {
		return activityTimeEnd;
	}
	public void setActivityTimeEnd(String activityTimeEnd) {
		this.activityTimeEnd = activityTimeEnd;
	}
	
	@Column(name="ACTIVITY_CONTENT")
	public String getActivityContent() {
		return activityContent;
	}
	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}
	
	/*多对多的定义，@JoinTable为中间关系表，joinColumns为当前实体类对应外键ID,inverseJoinColumns为引用对象外键ID*/
	@ManyToMany
	@JoinTable(name = "ACTIVITY_FILE", joinColumns = @JoinColumn(name = "ACTIVITY_ID"), inverseJoinColumns = @JoinColumn(name = "FILE_ID"))
	@OrderBy("id ASC")
	public List<FileAttach> getFiles() {
		return files;
	}
	public void setFiles(List<FileAttach> files) {
		this.files = files;
	}
	
	
	

	
	
	
	
	
}
