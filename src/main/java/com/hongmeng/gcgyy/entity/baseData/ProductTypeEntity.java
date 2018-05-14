package com.hongmeng.gcgyy.entity.baseData;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "base_product_type", indexes = {
	@Index(name = "INDEX_PRODUCT_TYPE_NAME", columnList = "name")
})
public class ProductTypeEntity extends BaseEntity {

	@Column(unique = true)
	private String name;

	public ProductTypeEntity() {
		// TODO Auto-generated constructor stub
	}

	public ProductTypeEntity(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
