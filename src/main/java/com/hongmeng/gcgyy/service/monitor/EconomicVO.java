package com.hongmeng.gcgyy.service.monitor;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicTargetEntity;

public class EconomicVO {
	
	private String monthly; // 月报表

	private AreaEntity area; // 区域

	private ProductTypeEntity productType; // 产业类别
	
	private BaseEnterpriseEntity enterprise; // 企业

	private EconomicEntity economic_current; // 当月经济运行

	private EconomicEntity economic_lastYear; // 去年同期经济运行

	private EconomicEntity economic_lastMonth; // 上个月经济运行

	// 同比增幅
	private String industryAddition_yearGrowth; // 工业总产值的同比增幅

	private String mainBusiness_yearGrowth; // 主营业务收入的同比增幅

	private String profit_yearGrowth; // 利润总额的同比增幅

	private String tax_yearGrowth; // 税金总额的同比增幅

	// 环比增幅
	private String industryAddition_monthGrowth; // 工业总产值的环比增幅

	private String mainBusiness_monthGrowth; // 主营业务收入的环比增幅

	private String profit_monthGrowth; // 利润总额的环比增幅

	private String tax_monthGrowth; // 税金总额的环比增幅

	// 本月止
	private float industryAddition_current_endMonth = 0; // 本月止工业总产值

	private float industryAddition_lastYear_endMonth = 0; // 去年同月止工业总产值

	private String industryAddition_endMonth_yearGrowth; // 同比增幅

	private float mainBusiness_current_endMonth = 0; // 本月止主营业务收入

	private float mainBusiness_lastYear_endMonth = 0; // 去年同月止主营业务收入

	private String mainBusiness_endMonth_yearGrowth; // 同比增幅

	private EconomicTargetEntity industryAddition_Target; // 工业总产值年度目标数

	private String industryAddition_complete; // 工业总产值完成比

	public EconomicVO() {
		// TODO Auto-generated constructor stub
	}

	public EconomicVO(String monthly, EconomicEntity economic_current, EconomicEntity economic_lastYear) {
		this.monthly = monthly;
		this.economic_current = economic_current;
		this.economic_lastYear = economic_lastYear;
	}

	public EconomicVO(String monthly, EconomicEntity economic_current, EconomicEntity economic_lastYear,
			EconomicEntity economic_lastMonth) {
		this.monthly = monthly;
		this.economic_current = economic_current;
		this.economic_lastYear = economic_lastYear;
		this.economic_lastMonth = economic_lastMonth;
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

	public EconomicEntity getEconomic_current() {
		return economic_current;
	}

	public void setEconomic_current(EconomicEntity economic_current) {
		this.economic_current = economic_current;
	}

	public EconomicEntity getEconomic_lastYear() {
		return economic_lastYear;
	}

	public void setEconomic_lastYear(EconomicEntity economic_lastYear) {
		this.economic_lastYear = economic_lastYear;
	}

	public EconomicEntity getEconomic_lastMonth() {
		return economic_lastMonth;
	}

	public void setEconomic_lastMonth(EconomicEntity economic_lastMonth) {
		this.economic_lastMonth = economic_lastMonth;
	}

	public String getIndustryAddition_yearGrowth() {
		return industryAddition_yearGrowth;
	}

	public void setIndustryAddition_yearGrowth(String industryAddition_yearGrowth) {
		this.industryAddition_yearGrowth = industryAddition_yearGrowth;
	}

	public String getMainBusiness_yearGrowth() {
		return mainBusiness_yearGrowth;
	}

	public void setMainBusiness_yearGrowth(String mainBusiness_yearGrowth) {
		this.mainBusiness_yearGrowth = mainBusiness_yearGrowth;
	}

	public String getProfit_yearGrowth() {
		return profit_yearGrowth;
	}

	public void setProfit_yearGrowth(String profit_yearGrowth) {
		this.profit_yearGrowth = profit_yearGrowth;
	}

	public String getTax_yearGrowth() {
		return tax_yearGrowth;
	}

	public void setTax_yearGrowth(String tax_yearGrowth) {
		this.tax_yearGrowth = tax_yearGrowth;
	}

	public float getIndustryAddition_current_endMonth() {
		return industryAddition_current_endMonth;
	}

	public void setIndustryAddition_current_endMonth(float industryAddition_current_endMonth) {
		this.industryAddition_current_endMonth = industryAddition_current_endMonth;
	}

	public float getIndustryAddition_lastYear_endMonth() {
		return industryAddition_lastYear_endMonth;
	}

	public void setIndustryAddition_lastYear_endMonth(float industryAddition_lastYear_endMonth) {
		this.industryAddition_lastYear_endMonth = industryAddition_lastYear_endMonth;
	}

	public String getIndustryAddition_endMonth_yearGrowth() {
		return industryAddition_endMonth_yearGrowth;
	}

	public void setIndustryAddition_endMonth_yearGrowth(String industryAddition_endMonth_yearGrowth) {
		this.industryAddition_endMonth_yearGrowth = industryAddition_endMonth_yearGrowth;
	}

	public float getMainBusiness_current_endMonth() {
		return mainBusiness_current_endMonth;
	}

	public void setMainBusiness_current_endMonth(float mainBusiness_current_endMonth) {
		this.mainBusiness_current_endMonth = mainBusiness_current_endMonth;
	}

	public float getMainBusiness_lastYear_endMonth() {
		return mainBusiness_lastYear_endMonth;
	}

	public void setMainBusiness_lastYear_endMonth(float mainBusiness_lastYear_endMonth) {
		this.mainBusiness_lastYear_endMonth = mainBusiness_lastYear_endMonth;
	}

	public String getMainBusiness_endMonth_yearGrowth() {
		return mainBusiness_endMonth_yearGrowth;
	}

	public void setMainBusiness_endMonth_yearGrowth(String mainBusiness_endMonth_yearGrowth) {
		this.mainBusiness_endMonth_yearGrowth = mainBusiness_endMonth_yearGrowth;
	}

	public EconomicTargetEntity getIndustryAddition_Target() {
		return industryAddition_Target;
	}

	public void setIndustryAddition_Target(EconomicTargetEntity industryAddition_Target) {
		this.industryAddition_Target = industryAddition_Target;
	}

	public String getIndustryAddition_complete() {
		return industryAddition_complete;
	}

	public void setIndustryAddition_complete(String industryAddition_complete) {
		this.industryAddition_complete = industryAddition_complete;
	}

	public String getIndustryAddition_monthGrowth() {
		return industryAddition_monthGrowth;
	}

	public void setIndustryAddition_monthGrowth(String industryAddition_monthGrowth) {
		this.industryAddition_monthGrowth = industryAddition_monthGrowth;
	}

	public String getMainBusiness_monthGrowth() {
		return mainBusiness_monthGrowth;
	}

	public void setMainBusiness_monthGrowth(String mainBusiness_monthGrowth) {
		this.mainBusiness_monthGrowth = mainBusiness_monthGrowth;
	}

	public String getProfit_monthGrowth() {
		return profit_monthGrowth;
	}

	public void setProfit_monthGrowth(String profit_monthGrowth) {
		this.profit_monthGrowth = profit_monthGrowth;
	}

	public String getTax_monthGrowth() {
		return tax_monthGrowth;
	}

	public void setTax_monthGrowth(String tax_monthGrowth) {
		this.tax_monthGrowth = tax_monthGrowth;
	}

}