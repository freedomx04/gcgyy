package com.hongmeng.gcgyy.entity.baseData;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "base_report")
public class ReportEntity extends BaseEntity {
	
	public class ReportType {
		public static final int ECONOMIC = 1;
		public static final int BENEFIT = 2;
	}
	
	@Column(unique = true)
	private Integer type;
	
	private Integer days;
	
	public ReportEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public ReportEntity(Integer type, Integer days) {
		this.type = type;
		this.days = days;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getDays() {
		return days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

}
