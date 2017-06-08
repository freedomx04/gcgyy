package com.hongmeng.gcgyy.entity.baseData;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "base_county", indexes = {
	@Index(name = "INDEX_COUNTY_NAME", columnList = "name")
})
public class CountyEntity extends BaseEntity {
	
	/**
	 * 县区名称
	 */
	private String name;
	
	/**
	 * 县区备注
	 */
	private String remark;
	
	/**
	 * 县区排序
	 */
	private Integer sort;
	
	public CountyEntity() {
		// TODO Auto-generated constructor stub
	}

	public CountyEntity(String name, String remark) {
		super();
		this.name = name;
		this.remark = remark;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
}
