package com.hongmeng.gcgyy.entity.baseData;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "base_appeal_type", indexes = {
	@Index(name = "index_appeal_type_name", columnList = "name")
})
public class AppealTypeEntity extends BaseEntity {

	@Column(unique = true)
	private String name; // 诉求类型名称

	private Integer acceptDays; // 受理天数

	private Integer handleDays; // 处理天数
	
	public AppealTypeEntity() {
		// TODO Auto-generated constructor stub
	}

	public AppealTypeEntity(String name, Integer acceptDays, Integer handleDays) {
		this.name = name;
		this.acceptDays = acceptDays;
		this.handleDays = handleDays;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAcceptDays() {
		return acceptDays;
	}

	public void setAcceptDays(Integer acceptDays) {
		this.acceptDays = acceptDays;
	}

	public Integer getHandleDays() {
		return handleDays;
	}

	public void setHandleDays(Integer handleDays) {
		this.handleDays = handleDays;
	}

}