package com.hongmeng.gcgyy.entity.industryService;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;

@Entity
@Table(name = "service_declare_apply", indexes = { 
	@Index(name = "service_declare_apply_enterprise_id", columnList = "enterprise_id"),
	@Index(name = "service_declare_apply_declare_id", columnList = "declare_id"),
	@Index(name = "service_declare_apply_declare_id_enterprise_id", columnList = "declare_id, enterprise_id"),
})
public class DeclareApplyEntity extends BaseEntity {

	/**
	 * 审核状态 0： 未申请 1：未审批 2：审批通过 3：审批未通过
	 */
	public class DeclareApproveStatus {
		public static final int NEW = 0;
		public static final int UNAPPROVE = 1;
		public static final int PASS = 2;
		public static final int REJECT = 3;
	}

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "declare_id")
	private BaseDeclareEntity declare;	// 申报

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private BaseEnterpriseEntity enterprise; // 企业

	private Integer status = DeclareApproveStatus.NEW; // 审核状态

	private String opinion; // 审批意见

	private String description; // 申报描述

	private String attachName; // 申报文件名称

	private String attachPath; // 申报文件路径
	
	public DeclareApplyEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public DeclareApplyEntity(BaseDeclareEntity declare, BaseEnterpriseEntity enterprise, String description,
			String attachName, String attachPath) {
		this.declare = declare;
		this.enterprise = enterprise;
		this.description = description;
		this.attachName = attachName;
		this.attachPath = attachPath;
	}

	public BaseDeclareEntity getDeclare() {
		return declare;
	}

	public void setDeclare(BaseDeclareEntity declare) {
		this.declare = declare;
	}
	
	public BaseEnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(BaseEnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

}