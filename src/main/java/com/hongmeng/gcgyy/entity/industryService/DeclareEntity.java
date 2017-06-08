package com.hongmeng.gcgyy.entity.industryService;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;

@Entity
@Table(name = "service_declare", indexes = { 
	@Index(name = "service_declare_create_time", columnList = "createTime"),
	@Index(name = "service_declare_status_create_time", columnList = "status, createTime"),
})
public class DeclareEntity extends BaseEntity {

	/**
	 * 申报状态 1:新增 2:展示中 3:下架
	 */
	public class DeclareStatus {
		public static final int NEW = 0;
		public static final int ONLINE = 1;
		public static final int DOWNLINE = 2;
	}
	
	public class ApplyStatus {
		public static final int UNAPPLY = 0;
		public static final int APPLY = 1;
	}

	private String itemName; // 申报项目名称

	private String description; // 申报简介

	private Date startTime; // 申报开始时间

	private Date endTime; // 申报结束时间

	private Integer status = DeclareStatus.NEW; // 申报状态

	private String attachName; // 文件名称

	private String attachPath; // 文件路径

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private BaseUserEntity user; // 发布人

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "declare_id")
	List<DeclareApplyEntity> declareApplys = new LinkedList<>(); // 申报企业
	
	private Integer applyStatus = ApplyStatus.UNAPPLY;

	public DeclareEntity() {
		// TODO Auto-generated constructor stub
	}

	public DeclareEntity(String itemName, String description, Date startTime, Date endTime, String attachName,
			String attachPath, BaseUserEntity user) {
		this.itemName = itemName;
		this.description = description;
		this.startTime = startTime;
		this.endTime = endTime;
		this.attachName = attachName;
		this.attachPath = attachPath;
		this.user = user;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}

	public String getAttachPath() {
		return attachPath;
	}

	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}

	public BaseUserEntity getUser() {
		return user;
	}

	public void setUser(BaseUserEntity user) {
		this.user = user;
	}

	public List<DeclareApplyEntity> getDeclareApplys() {
		return declareApplys;
	}

	public void setDeclareApplys(List<DeclareApplyEntity> declareApplys) {
		this.declareApplys = declareApplys;
	}

	public Integer getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(Integer applyStatus) {
		this.applyStatus = applyStatus;
	}

}