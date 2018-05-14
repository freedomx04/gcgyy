package com.hongmeng.gcgyy.entity.industryService;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;

@Entity
@Table(name = "industry_service_hire")
public class HireEntity extends BaseEntity {

	private String imagePath; // 图片地址

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseEntity enterprise; // 企业名称

	private String position; // 职位名称

	private String telephone; // 联系方式

	private String salary; // 薪资

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "business_id")
	private BusinessEntity business; // 行业

	@Column(length = 4000)
	private String description; // 描述

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public EnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public BusinessEntity getBusiness() {
		return business;
	}

	public void setBusiness(BusinessEntity business) {
		this.business = business;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public HireEntity(String imagePath, EnterpriseEntity enterprise, String position, String telephone, String salary,
			BusinessEntity business, String description) {
		super();
		this.imagePath = imagePath;
		this.enterprise = enterprise;
		this.position = position;
		this.telephone = telephone;
		this.salary = salary;
		this.business = business;
		this.description = description;
	}

	public HireEntity() {

	}

}
