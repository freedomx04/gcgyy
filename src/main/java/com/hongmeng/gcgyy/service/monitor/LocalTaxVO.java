package com.hongmeng.gcgyy.service.monitor;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;

public class LocalTaxVO {

	private String monthly; // 月份

	private AreaEntity area; // 区域

	private ProductTypeEntity productType; // 产业类别

	private BaseEnterpriseEntity enterprise; // 企业

	private LocalTaxEntity localTax_current;

	private LocalTaxEntity localTax_lastYear;

	private LocalTaxEntity localTax_lastMonth;

	private String localTax_yearGrowth;

	private String localTax_monthGrowth;

	public LocalTaxVO() {
		// TODO Auto-generated constructor stub
	}

	public LocalTaxVO(LocalTaxEntity localTax_current, LocalTaxEntity localTax_lastYear) {
		this.localTax_current = localTax_current;
		this.localTax_lastYear = localTax_lastYear;
	}

	public LocalTaxVO(String monthly, LocalTaxEntity localTax_current, LocalTaxEntity localTax_lastYear,
			LocalTaxEntity localTax_lastMonth) {
		this.monthly = monthly;
		this.localTax_current = localTax_current;
		this.localTax_lastYear = localTax_lastYear;
		this.localTax_lastMonth = localTax_lastMonth;
	}

	public String getMonthly() {
		return monthly;
	}

	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}

	public AreaEntity getArea() {
		return area;
	}

	public void setArea(AreaEntity area) {
		this.area = area;
	}

	public ProductTypeEntity getProductType() {
		return productType;
	}

	public void setProductType(ProductTypeEntity productType) {
		this.productType = productType;
	}

	public BaseEnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(BaseEnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public LocalTaxEntity getLocalTax_current() {
		return localTax_current;
	}

	public void setLocalTax_current(LocalTaxEntity localTax_current) {
		this.localTax_current = localTax_current;
	}

	public LocalTaxEntity getLocalTax_lastYear() {
		return localTax_lastYear;
	}

	public void setLocalTax_lastYear(LocalTaxEntity localTax_lastYear) {
		this.localTax_lastYear = localTax_lastYear;
	}

	public LocalTaxEntity getLocalTax_lastMonth() {
		return localTax_lastMonth;
	}

	public void setLocalTax_lastMonth(LocalTaxEntity localTax_lastMonth) {
		this.localTax_lastMonth = localTax_lastMonth;
	}

	public String getLocalTax_yearGrowth() {
		return localTax_yearGrowth;
	}

	public void setLocalTax_yearGrowth(String localTax_yearGrowth) {
		this.localTax_yearGrowth = localTax_yearGrowth;
	}

	public String getLocalTax_monthGrowth() {
		return localTax_monthGrowth;
	}

	public void setLocalTax_monthGrowth(String localTax_monthGrowth) {
		this.localTax_monthGrowth = localTax_monthGrowth;
	}
	
}