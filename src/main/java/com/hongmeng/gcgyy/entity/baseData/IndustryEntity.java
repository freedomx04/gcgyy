package com.hongmeng.gcgyy.entity.baseData;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "base_industry")
public class IndustryEntity extends BaseEntity {

	private String name; // 行业名称

	public IndustryEntity() {
		// TODO Auto-generated constructor stub
	}

	public IndustryEntity(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
