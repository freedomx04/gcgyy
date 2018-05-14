package com.hongmeng.gcgyy.entity.authority;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_role", indexes = {
	@Index(name = "index_role_name", columnList = "name"),
	@Index(name = "index_role_resource", columnList = "resource")
})
public class RoleEntity extends BaseEntity {

	@Column(unique = true)
	private String name; // 角色名称

	private String code; // 角色码

	private String description; // 角色描述

	@Column(length = 500)
	private String resource; // 关联资源, 以','隔开

	public RoleEntity() {
		// TODO Auto-generated constructor stub
	}

	public RoleEntity(String name, String code, String description, String resource) {
		this.name = name;
		this.code = code;
		this.description = description;
		this.resource = resource;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

}