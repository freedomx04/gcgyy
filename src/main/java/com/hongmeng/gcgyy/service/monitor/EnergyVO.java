package com.hongmeng.gcgyy.service.monitor;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;

/**
 * 同比增长 同比增长率=（本年的指标值-去年同期的值） ÷ 去年同期的值 * 100%
 *
 */
public class EnergyVO {

	private String monthly; // 月份

	private AreaEntity area; // 区域

	private ProductTypeEntity productType; // 产业类别

	private BaseEnterpriseEntity enterprise; // 企业

	private EnergyEntity energy_current; // 当月能源消耗

	private EnergyEntity energy_lastYear; // 去年同月能源消耗

	private EnergyEntity energy_lastMonth; // 上个月能源消耗

	private String electricity_yearGrowth; // 电的同比增幅

	private String electricity_monthGrowth;// 电的环比增幅

	private String gas_yearGrowth; // 气的同比增幅

	private String gas_monthGrowth;// 气的环比增幅

	public EnergyVO() {
		// TODO Auto-generated constructor stub
	}

	public EnergyVO(String monthly, EnergyEntity energy_current, EnergyEntity energy_lastYear,
			EnergyEntity energy_lastMonth) {
		this.monthly = monthly;
		this.energy_current = energy_current;
		this.energy_lastYear = energy_lastYear;
		this.energy_lastMonth = energy_lastMonth;
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

	public EnergyEntity getEnergy_current() {
		return energy_current;
	}

	public void setEnergy_current(EnergyEntity energy_current) {
		this.energy_current = energy_current;
	}

	public EnergyEntity getEnergy_lastYear() {
		return energy_lastYear;
	}

	public void setEnergy_lastYear(EnergyEntity energy_lastYear) {
		this.energy_lastYear = energy_lastYear;
	}

	public EnergyEntity getEnergy_lastMonth() {
		return energy_lastMonth;
	}

	public void setEnergy_lastMonth(EnergyEntity energy_lastMonth) {
		this.energy_lastMonth = energy_lastMonth;
	}

	public String getElectricity_yearGrowth() {
		return electricity_yearGrowth;
	}

	public void setElectricity_yearGrowth(String electricity_yearGrowth) {
		this.electricity_yearGrowth = electricity_yearGrowth;
	}

	public String getElectricity_monthGrowth() {
		return electricity_monthGrowth;
	}

	public void setElectricity_monthGrowth(String electricity_monthGrowth) {
		this.electricity_monthGrowth = electricity_monthGrowth;
	}

	public String getGas_yearGrowth() {
		return gas_yearGrowth;
	}

	public void setGas_yearGrowth(String gas_yearGrowth) {
		this.gas_yearGrowth = gas_yearGrowth;
	}

	public String getGas_monthGrowth() {
		return gas_monthGrowth;
	}

	public void setGas_monthGrowth(String gas_monthGrowth) {
		this.gas_monthGrowth = gas_monthGrowth;
	}

}