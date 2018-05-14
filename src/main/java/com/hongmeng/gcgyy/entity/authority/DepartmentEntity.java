package com.hongmeng.gcgyy.entity.authority;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;

@Entity
@Table(name = "authority_department", indexes = {
	@Index(name = "index_department_name", columnList = "name")
})
public class DepartmentEntity extends BaseEntity {

	@Column(unique = true)
	private String name; // 部门名称

	private String description; // 部门信息

	@OneToOne
	@JoinColumn(name = "area_id")
	private AreaEntity area; // 所属园区

	private String principal; // 部门负责人
	
	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "department_id")
	private List<BaseUserEntity> users = new LinkedList<>(); // 部门联系人
	
	public DepartmentEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public DepartmentEntity(String name, String description, String principal, AreaEntity area) {
		this.name = name;
		this.description = description;
		this.principal = principal;
		this.area = area;
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

	public AreaEntity getArea() {
		return area;
	}

	public void setArea(AreaEntity area) {
		this.area = area;
	}

	public List<BaseUserEntity> getUsers() {
		return users;
	}

	public void setUsers(List<BaseUserEntity> users) {
		this.users = users;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	
}