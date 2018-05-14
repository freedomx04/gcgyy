package com.hongmeng.gcgyy.entity.baseData;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "base_area", indexes = {
	@Index(name = "INDEX_AREA_NAME", columnList = "name")
})
public class AreaEntity extends BaseEntity {
	
	@Column(unique = true)
	private String name;	// 区域名称
	
	private String description;	// 区域描述
	
	public AreaEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public AreaEntity(String name, String description) {
		super();
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