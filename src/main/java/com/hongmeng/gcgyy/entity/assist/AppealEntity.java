package com.hongmeng.gcgyy.entity.assist;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;

@Entity
@Table(name = "assist_appeal", indexes = {
	@Index(name = "index_appeal_status_createTime", columnList = "status, createTime"),
	@Index(name = "index_appeal_enterprise_status_createTime", columnList = "enterprise_id, status, createTime"),
	@Index(name = "index_appeal_department_status_createTime", columnList = "department_id, status, createTime"),
	@Index(name = "index_appeal_appealType_status", columnList = "appeal_type_id, status"),
	@Index(name = "index_appeal_appealType_status_department", columnList = "appeal_type_id, status, department_id"),
	@Index(name = "index_appeal_department_enterprise_createTime", columnList = "department_id, enterprise_id, createTime")
})
public class AppealEntity extends BaseEntity {

	/**
	 * 诉求状态 0: 新增 1: 待派发 2: 待受理 3: 处理中 4: 待确认 5: 办结 6: 驳回
	 */
	public class AppealStatus {
		public static final int NEW = 0;
		public static final int SENDING = 1;
		public static final int PENDING = 2;
		public static final int PROCESSING = 3;
		public static final int UNCONFIRM = 4;
		public static final int CONFIRMED = 5;
		public static final int REJECT = 6;
	}

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseEntity enterprise; // 企业

	private String title; // 诉求名称

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "appeal_type_id")
	private AppealTypeEntity appealType; // 诉求类别

	@Column(length = 4000)
	private String description; // 诉求描述

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "department_id")
	private DepartmentEntity department; // 派发部门

	private Integer status = AppealStatus.NEW; // 诉求状态

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "evaluate_id")
	public EvaluateEntity evaluate; // 评价

	private Date sendTime; // 发送时间

	private Date dispatchTime; // 派发时间

	private Date acceptTime; // 受理时间

	private Date handleTime; // 处理时间

	private String dispatchOpinion; // 派发意见

	private String rejectOpinion; // 驳回意见

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "appeal_id")
	@OrderBy("createTime DESC")
	private List<UrgeEntity> urges = new LinkedList<>(); // 催办信息

	public AppealEntity() {
		// TODO Auto-generated constructor stub
	}

	public AppealEntity(EnterpriseEntity enterprise, String title, AppealTypeEntity appealType, String description) {
		this.enterprise = enterprise;
		this.title = title;
		this.appealType = appealType;
		this.description = description;
	}

	public EnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public AppealTypeEntity getAppealType() {
		return appealType;
	}

	public void setAppealType(AppealTypeEntity appealType) {
		this.appealType = appealType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public EvaluateEntity getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(EvaluateEntity evaluate) {
		this.evaluate = evaluate;
	}

	public String getRejectOpinion() {
		return rejectOpinion;
	}

	public void setRejectOpinion(String rejectOpinion) {
		this.rejectOpinion = rejectOpinion;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public DepartmentEntity getDepartment() {
		return department;
	}

	public void setDepartment(DepartmentEntity department) {
		this.department = department;
	}

	public Date getDispatchTime() {
		return dispatchTime;
	}

	public void setDispatchTime(Date dispatchTime) {
		this.dispatchTime = dispatchTime;
	}

	public Date getAcceptTime() {
		return acceptTime;
	}

	public void setAcceptTime(Date acceptTime) {
		this.acceptTime = acceptTime;
	}

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}

	public String getDispatchOpinion() {
		return dispatchOpinion;
	}

	public void setDispatchOpinion(String dispatchOpinion) {
		this.dispatchOpinion = dispatchOpinion;
	}

	public List<UrgeEntity> getUrges() {
		return urges;
	}

	public void setUrges(List<UrgeEntity> urges) {
		this.urges = urges;
	}

}