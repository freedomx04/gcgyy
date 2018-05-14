package com.hongmeng.gcgyy.service.monitor;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;

public class TaxVO {
	
	private String monthly; // 月份

	private AreaEntity area; // 区域

	private ProductTypeEntity productType; // 产业类别
	
	private BaseEnterpriseEntity enterprise; // 企业

	private NationalTaxEntity nationalTax_current;

	private NationalTaxEntity nationalTax_lastYear;
	
	private NationalTaxEntity nationalTax_lastMonth;

	private LocalTaxEntity localTax_current;

	private LocalTaxEntity localTax_lastYear;
	
	private LocalTaxEntity localTax_lastMonth;
	
	private String sale_yearGrowth;
	
	private String sale_monthGrowth;
	
	private String nationalTax_yearGrowth;
	
	private String nationalTax_monthGrowth;
	
	private String localTax_yearGrowth;
	
	private String localTax_monthGrowth;

	public TaxVO() {
		// TODO Auto-generated constructor stub
	}
	
	public TaxVO(NationalTaxEntity nationalTax_current, NationalTaxEntity nationalTax_lastYear,
			LocalTaxEntity localTax_current, LocalTaxEntity localTax_lastYear) {
		this.nationalTax_current = nationalTax_current;
		this.nationalTax_lastYear = nationalTax_lastYear;
		this.localTax_current = localTax_current;
		this.localTax_lastYear = localTax_lastYear;
	}

	public TaxVO(String monthly, NationalTaxEntity nationalTax_current, NationalTaxEntity nationalTax_lastYear,
			NationalTaxEntity nationalTax_lastMonth, LocalTaxEntity localTax_current, LocalTaxEntity localTax_lastYear,
			LocalTaxEntity localTax_lastMonth) {
		this.monthly = monthly;
		this.nationalTax_current = nationalTax_current;
		this.nationalTax_lastYear = nationalTax_lastYear;
		this.nationalTax_lastMonth = nationalTax_lastMonth;
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

	public NationalTaxEntity getNationalTax_current() {
		return nationalTax_current;
	}

	public void setNationalTax_current(NationalTaxEntity nationalTax_current) {
		this.nationalTax_current = nationalTax_current;
	}

	public NationalTaxEntity getNationalTax_lastYear() {
		return nationalTax_lastYear;
	}

	public void setNationalTax_lastYear(NationalTaxEntity nationalTax_lastYear) {
		this.nationalTax_lastYear = nationalTax_lastYear;
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

	public String getSale_yearGrowth() {
		return sale_yearGrowth;
	}

	public void setSale_yearGrowth(String sale_yearGrowth) {
		this.sale_yearGrowth = sale_yearGrowth;
	}

	public String getNationalTax_yearGrowth() {
		return nationalTax_yearGrowth;
	}

	public void setNationalTax_yearGrowth(String nationalTax_yearGrowth) {
		this.nationalTax_yearGrowth = nationalTax_yearGrowth;
	}

	public String getLocalTax_yearGrowth() {
		return localTax_yearGrowth;
	}

	public void setLocalTax_yearGrowth(String localTax_yearGrowth) {
		this.localTax_yearGrowth = localTax_yearGrowth;
	}

	public NationalTaxEntity getNationalTax_lastMonth() {
		return nationalTax_lastMonth;
	}

	public void setNationalTax_lastMonth(NationalTaxEntity nationalTax_lastMonth) {
		this.nationalTax_lastMonth = nationalTax_lastMonth;
	}

	public LocalTaxEntity getLocalTax_lastMonth() {
		return localTax_lastMonth;
	}

	public void setLocalTax_lastMonth(LocalTaxEntity localTax_lastMonth) {
		this.localTax_lastMonth = localTax_lastMonth;
	}

	public String getSale_monthGrowth() {
		return sale_monthGrowth;
	}

	public void setSale_monthGrowth(String sale_monthGrowth) {
		this.sale_monthGrowth = sale_monthGrowth;
	}

	public String getNationalTax_monthGrowth() {
		return nationalTax_monthGrowth;
	}

	public void setNationalTax_monthGrowth(String nationalTax_monthGrowth) {
		this.nationalTax_monthGrowth = nationalTax_monthGrowth;
	}

	public String getLocalTax_monthGrowth() {
		return localTax_monthGrowth;
	}

	public void setLocalTax_monthGrowth(String localTax_monthGrowth) {
		this.localTax_monthGrowth = localTax_monthGrowth;
	}
	
}