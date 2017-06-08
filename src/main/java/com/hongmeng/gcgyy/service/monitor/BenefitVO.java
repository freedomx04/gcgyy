package com.hongmeng.gcgyy.service.monitor;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.monitor.BenefitEntity;

public class BenefitVO {

	private String monthly; // 月份

	private AreaEntity area; // 区域

	private ProductTypeEntity productType; // 产业类别

	private BaseEnterpriseEntity enterprise; // 企业

	private BenefitEntity benefit_current; // 当月效益指标

	private BenefitEntity benefit_lastYear; // 去年同月效益指标

	private BenefitEntity benefit_lastMonth; // 上月效益指标

	private String receivable_yearGrowth; // 应收账款同比增幅

	private String receivable_monthGrowth; // 应收账款环比增幅

	private String inventory_yearGrowth; // 产存品存货同比增幅

	private String inventory_monthGrowth; // 产存品存货环比增幅

	private String flowAssets_yearGrowth; // 流动资产同比增幅

	private String flowAssets_monthGrowth; // 流动资产环比增幅

	private String assets_yearGrowth; // 资产同比增幅

	private String assets_monthGrowth; // 资产环比增幅

	private String debt_yearGrowth; // 负债同比增幅

	private String debt_monthGrowth; // 负债环比增幅

	private String totleAssets_yearGrowth; // 两项资产同比增幅

	private String totleAssets_monthGrowth; // 两项资产环比增幅

	public BenefitVO() {
		// TODO Auto-generated constructor stub
	}

	public BenefitVO(String monthly, BenefitEntity benefit_current, BenefitEntity benefit_lastYear,
			BenefitEntity benefit_lastMonth) {
		this.monthly = monthly;
		this.benefit_current = benefit_current;
		this.benefit_lastYear = benefit_lastYear;
		this.benefit_lastMonth = benefit_lastMonth;
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

	public BenefitEntity getBenefit_current() {
		return benefit_current;
	}

	public void setBenefit_current(BenefitEntity benefit_current) {
		this.benefit_current = benefit_current;
	}

	public BenefitEntity getBenefit_lastYear() {
		return benefit_lastYear;
	}

	public void setBenefit_lastYear(BenefitEntity benefit_lastYear) {
		this.benefit_lastYear = benefit_lastYear;
	}

	public BenefitEntity getBenefit_lastMonth() {
		return benefit_lastMonth;
	}

	public void setBenefit_lastMonth(BenefitEntity benefit_lastMonth) {
		this.benefit_lastMonth = benefit_lastMonth;
	}

	public String getReceivable_yearGrowth() {
		return receivable_yearGrowth;
	}

	public void setReceivable_yearGrowth(String receivable_yearGrowth) {
		this.receivable_yearGrowth = receivable_yearGrowth;
	}

	public String getReceivable_monthGrowth() {
		return receivable_monthGrowth;
	}

	public void setReceivable_monthGrowth(String receivable_monthGrowth) {
		this.receivable_monthGrowth = receivable_monthGrowth;
	}

	public String getInventory_yearGrowth() {
		return inventory_yearGrowth;
	}

	public void setInventory_yearGrowth(String inventory_yearGrowth) {
		this.inventory_yearGrowth = inventory_yearGrowth;
	}

	public String getInventory_monthGrowth() {
		return inventory_monthGrowth;
	}

	public void setInventory_monthGrowth(String inventory_monthGrowth) {
		this.inventory_monthGrowth = inventory_monthGrowth;
	}

	public String getFlowAssets_yearGrowth() {
		return flowAssets_yearGrowth;
	}

	public void setFlowAssets_yearGrowth(String flowAssets_yearGrowth) {
		this.flowAssets_yearGrowth = flowAssets_yearGrowth;
	}

	public String getFlowAssets_monthGrowth() {
		return flowAssets_monthGrowth;
	}

	public void setFlowAssets_monthGrowth(String flowAssets_monthGrowth) {
		this.flowAssets_monthGrowth = flowAssets_monthGrowth;
	}

	public String getAssets_yearGrowth() {
		return assets_yearGrowth;
	}

	public void setAssets_yearGrowth(String assets_yearGrowth) {
		this.assets_yearGrowth = assets_yearGrowth;
	}

	public String getAssets_monthGrowth() {
		return assets_monthGrowth;
	}

	public void setAssets_monthGrowth(String assets_monthGrowth) {
		this.assets_monthGrowth = assets_monthGrowth;
	}

	public String getDebt_yearGrowth() {
		return debt_yearGrowth;
	}

	public void setDebt_yearGrowth(String debt_yearGrowth) {
		this.debt_yearGrowth = debt_yearGrowth;
	}

	public String getDebt_monthGrowth() {
		return debt_monthGrowth;
	}

	public void setDebt_monthGrowth(String debt_monthGrowth) {
		this.debt_monthGrowth = debt_monthGrowth;
	}

	public String getTotleAssets_yearGrowth() {
		return totleAssets_yearGrowth;
	}

	public void setTotleAssets_yearGrowth(String totleAssets_yearGrowth) {
		this.totleAssets_yearGrowth = totleAssets_yearGrowth;
	}

	public String getTotleAssets_monthGrowth() {
		return totleAssets_monthGrowth;
	}

	public void setTotleAssets_monthGrowth(String totleAssets_monthGrowth) {
		this.totleAssets_monthGrowth = totleAssets_monthGrowth;
	}

}