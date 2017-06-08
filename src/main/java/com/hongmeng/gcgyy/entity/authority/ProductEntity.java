package com.hongmeng.gcgyy.entity.authority;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_enterprise_product", indexes = { 
	@Index(name = "index_product_name", columnList = "name")
})
public class ProductEntity extends BaseEntity {

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private BaseEnterpriseEntity enterprise; // 企业

	private String imagePath; // 产品图片

	private String name; // 产品名称

	@Column(length = 4000)
	private String introduction; // 产品介绍
	
	@Column(length = 1000)
	private String specification; // 规格参数

	private String telephone; // 联系电话

	public ProductEntity() {
		// TODO Auto-generated constructor stub
	}

	public ProductEntity(BaseEnterpriseEntity enterprise, String imagePath, String name, String introduction,
			String specification, String telephone) {
		this.enterprise = enterprise;
		this.imagePath = imagePath;
		this.name = name;
		this.introduction = introduction;
		this.specification = specification;
		this.telephone = telephone;
	}

	public BaseEnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(BaseEnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}
	
}