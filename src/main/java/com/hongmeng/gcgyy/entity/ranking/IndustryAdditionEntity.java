package com.hongmeng.gcgyy.entity.ranking;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.baseData.CountyEntity;

@Entity
@Table(name = "ranking_industry_addition")
public class IndustryAdditionEntity extends BaseEntity {

	private String monthly; // 月报表时间

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "county_id")
	private CountyEntity county; // 县区

	private Double monthGrowth; // 当月增幅

	private Double totalGrowth; // 累计增幅

	private Integer sort; // 增幅排序

	public IndustryAdditionEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public IndustryAdditionEntity(String monthly, CountyEntity county) {
		super();
		this.monthly = monthly;
		this.county = county;
	}

	public IndustryAdditionEntity(String monthly, CountyEntity county, Double monthGrowth, Double totalGrowth, Integer sort) {
		super();
		this.monthly = monthly;
		this.county = county;
		this.monthGrowth = monthGrowth;
		this.totalGrowth = totalGrowth;
		this.sort = sort;
	}

	public String getMonthly() {
		return monthly;
	}

	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}

	public CountyEntity getCounty() {
		return county;
	}

	public void setCounty(CountyEntity county) {
		this.county = county;
	}

	public Double getMonthGrowth() {
		return monthGrowth;
	}

	public void setMonthGrowth(Double monthGrowth) {
		this.monthGrowth = monthGrowth;
	}

	public Double getTotalGrowth() {
		return totalGrowth;
	}

	public void setTotalGrowth(Double totalGrowth) {
		this.totalGrowth = totalGrowth;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

}