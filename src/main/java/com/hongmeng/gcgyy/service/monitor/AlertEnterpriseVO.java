package com.hongmeng.gcgyy.service.monitor;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicEntity;
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;

public class AlertEnterpriseVO {

	private String monthly; // 月报表时间

	private BaseEnterpriseEntity enterprise; // 企业

	// 同比，环比
	private String mainBusiness_yearGrowth; // 本月止主营业务收入的同比增幅

	private String mainBusiness_monthGrowth; // 本月止主营业务收入的环比增幅

	private String nationalTax_yearGrowth; // 本月止国税同比增幅

	private String nationalTax_monthGrowth; // 本月止国税环比增幅

	private String localTax_yearGrowth; // 本月止地税同比增幅

	private String localTax_monthGrowth; // 本月止地税环比增幅

	private String electricity_yearGrowth; // 本月用电量的同比增幅

	private String electricity_monthGrowth;// 本月用电量的环比增幅

	// 数据
	private EconomicEntity economic_current; // 当月经济运行

	private EconomicEntity economic_lastYear; // 去年同期经济运行

	private EconomicEntity economic_lastMonth; // 上个月经济运行

	private NationalTaxEntity nationalTax_current; // 当月国税

	private NationalTaxEntity nationalTax_lastYear;// 去年同期国税

	private NationalTaxEntity nationalTax_lastMonth;// 上个月国税

	private LocalTaxEntity localTax_current;// 当月地税

	private LocalTaxEntity localTax_lastYear;// 去年同期地税

	private LocalTaxEntity localTax_lastMonth;// 上个月地税

	private EnergyEntity energy_current; // 当月能源消耗

	private EnergyEntity energy_lastYear; // 去年同月能源消耗

	private EnergyEntity energy_lastMonth; // 上个月能源消耗
	
	public AlertEnterpriseVO() {
		// TODO Auto-generated constructor stub
	}

	public AlertEnterpriseVO(String monthly, BaseEnterpriseEntity enterprise) {
		this.monthly = monthly;
		this.enterprise = enterprise;
	}

	public String getMonthly() {
		return monthly;
	}

	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}

	public BaseEnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(BaseEnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public String getMainBusiness_yearGrowth() {
		return mainBusiness_yearGrowth;
	}

	public void setMainBusiness_yearGrowth(String mainBusiness_yearGrowth) {
		this.mainBusiness_yearGrowth = mainBusiness_yearGrowth;
	}

	public String getMainBusiness_monthGrowth() {
		return mainBusiness_monthGrowth;
	}

	public void setMainBusiness_monthGrowth(String mainBusiness_monthGrowth) {
		this.mainBusiness_monthGrowth = mainBusiness_monthGrowth;
	}

	public String getNationalTax_yearGrowth() {
		return nationalTax_yearGrowth;
	}

	public void setNationalTax_yearGrowth(String nationalTax_yearGrowth) {
		this.nationalTax_yearGrowth = nationalTax_yearGrowth;
	}

	public String getNationalTax_monthGrowth() {
		return nationalTax_monthGrowth;
	}

	public void setNationalTax_monthGrowth(String nationalTax_monthGrowth) {
		this.nationalTax_monthGrowth = nationalTax_monthGrowth;
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

	public NationalTaxEntity getNationalTax_lastMonth() {
		return nationalTax_lastMonth;
	}

	public void setNationalTax_lastMonth(NationalTaxEntity nationalTax_lastMonth) {
		this.nationalTax_lastMonth = nationalTax_lastMonth;
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
	
}