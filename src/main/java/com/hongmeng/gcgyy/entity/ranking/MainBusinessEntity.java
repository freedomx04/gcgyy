package com.hongmeng.gcgyy.entity.ranking;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.baseData.CountyEntity;

@Entity
@Table(name = "ranking_main_business")
public class MainBusinessEntity extends BaseEntity {
	
	private String monthly;	// 月报表时间
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "county_id")
	private CountyEntity county; // 县区
	
	private Double total; // 本月止累计

	private Double yearGrowth; // 同比增长

	private Integer sort; // 增幅排序
	
	public MainBusinessEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public MainBusinessEntity(String monthly, CountyEntity county) {
		super();
		this.monthly = monthly;
		this.county = county;
	}

	public MainBusinessEntity(String monthly, CountyEntity county, Double total, Double yearGrowth, Integer sort) {
		super();
		this.monthly = monthly;
		this.county = county;
		this.total = total;
		this.yearGrowth = yearGrowth;
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

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Double getYearGrowth() {
		return yearGrowth;
	}

	public void setYearGrowth(Double yearGrowth) {
		this.yearGrowth = yearGrowth;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

}