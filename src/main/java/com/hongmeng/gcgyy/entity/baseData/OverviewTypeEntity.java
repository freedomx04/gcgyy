package com.hongmeng.gcgyy.entity.baseData;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "base_overview_type")
public class OverviewTypeEntity extends BaseEntity {

	private String name;	// 工业快报类型名称
	
	private String description;	// 工业快报类型描述
	
	public OverviewTypeEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public OverviewTypeEntity(String name, String description) {
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