package com.hongmeng.gcgyy.entity.industryService;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;

@Entity
@Table(name = "industry_service_job")
public class JobEntity extends BaseEntity {

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private BaseUserEntity user; // 姓名

	private Integer age; // 年龄

	private String telephone; // 个人电话

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "business_id")
	private BusinessEntity business; // 行业

	private String salary; // 资薪

	@Column(length = 4000)
	private String description; // 描述

	@Column(length = 4000)
	private String experience; // 工作经历

	public BaseUserEntity getUser() {
		return user;
	}

	public void setUser(BaseUserEntity user) {
		this.user = user;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public BusinessEntity getBusiness() {
		return business;
	}

	public void setBusiness(BusinessEntity business) {
		this.business = business;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public JobEntity(BaseUserEntity user, Integer age, String telephone, BusinessEntity business, String salary,
			String description, String experience) {
		super();
		this.user = user;
		this.age = age;
		this.telephone = telephone;
		this.business = business;
		this.salary = salary;
		this.description = description;
		this.experience = experience;
	}

	public JobEntity() {

	}
}
