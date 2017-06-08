package com.hongmeng.gcgyy.entity.baseData;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "base_business")
public class BusinessEntity extends BaseEntity {

	private String name; // 行业名称

	private String description; // 行业描述
	
	public BusinessEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public BusinessEntity(String name, String description) {
		this.name = name;
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}