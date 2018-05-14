package com.hongmeng.gcgyy.service.monitor;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;

public class AlertReportVO {

	/**
	 * 上报状态	1：未上报	2：已上报
	 */
	public class ReportStatus {
		public static final int UNREPORT = 0;
		public static final int REPORT = 1;
	}

	private String monthly; // 月报表时间

	private BaseEnterpriseEntity enterprise; // 企业

	private Integer nationalTax = ReportStatus.UNREPORT; // 国税上报状态

	private Integer localTax = ReportStatus.UNREPORT; // 地税上报状态

	private Integer economic = ReportStatus.UNREPORT; // 工业总产值上报状态

	private Integer energy = ReportStatus.UNREPORT; // 能源消耗上报状态

	private Integer benefit = ReportStatus.UNREPORT; // 效益指标月报表上报状态
	
	public AlertReportVO() {
		// TODO Auto-generated constructor stub
	}

	public AlertReportVO(String monthly, BaseEnterpriseEntity enterprise) {
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

	public Integer getNationalTax() {
		return nationalTax;
	}

	public void setNationalTax(Integer nationalTax) {
		this.nationalTax = nationalTax;
	}

	public Integer getLocalTax() {
		return localTax;
	}

	public void setLocalTax(Integer localTax) {
		this.localTax = localTax;
	}

	public Integer getEconomic() {
		return economic;
	}

	public void setEconomic(Integer economic) {
		this.economic = economic;
	}

	public Integer getEnergy() {
		return energy;
	}

	public void setEnergy(Integer energy) {
		this.energy = energy;
	}

	public Integer getBenefit() {
		return benefit;
	}

	public void setBenefit(Integer benefit) {
		this.benefit = benefit;
	}

}