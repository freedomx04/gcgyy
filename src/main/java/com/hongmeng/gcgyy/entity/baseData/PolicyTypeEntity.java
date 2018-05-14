package com.hongmeng.gcgyy.entity.baseData;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "base_policy_type")
public class PolicyTypeEntity extends BaseEntity {
	
	private String name;	// 政策类型名称
	
	private String description;	// 政策类型描述
	
	public PolicyTypeEntity() {
		// TODO Auto-generated constructor stub
	}

	public PolicyTypeEntity(String name, String description) {
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