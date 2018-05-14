package com.hongmeng.gcgyy.entity.authority;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity.PointStatus;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;

@Entity
@Table(name = "authority_enterprise")
public class BaseEnterpriseEntity extends BaseEntity {

	private String imagePath; // 企业图片

	private String name;// 企业名称
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "area_id")
	private AreaEntity area; // 区域
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "product_type_id")
	private ProductTypeEntity productType; // 产品类别
	
	@Column(name = "point_status")
	private Integer pointStatus = PointStatus.UNPOINT; // 重点企业
	
	public BaseEnterpriseEntity() {
		// TODO Auto-generated constructor stub
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

	public AreaEntity getArea() {
		return area;
	}

	public void setArea(AreaEntity area) {
		this.area = area;
	}

	public ProductTypeEntity getProductType() {
		return productType;
	}

	public void setProductType(ProductTypeEntity productType) {
		this.productType = productType;
	}

	public Integer getPointStatus() {
		return pointStatus;
	}

	public void setPointStatus(Integer pointStatus) {
		this.pointStatus = pointStatus;
	}

}