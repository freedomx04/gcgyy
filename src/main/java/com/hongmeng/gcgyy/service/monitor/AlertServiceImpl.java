package com.hongmeng.gcgyy.service.monitor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.BenefitEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicEntity;
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;
import com.hongmeng.gcgyy.service.monitor.AlertReportVO.ReportStatus;

@Service
public class AlertServiceImpl implements AlertService {

	@Autowired
	EconomicService economicService;

	@Autowired
	EnergyService energyService;

	@Autowired
	BenefitService benefitService;

	@Autowired
	NationalTaxService nationalTaxService;

	@Autowired
	LocalTaxService localTaxService;

	@Override
	public AlertEnterpriseVO detailEnterprise(String monthly, BaseEnterpriseEntity enterprise) {
		AlertEnterpriseVO alert = new AlertEnterpriseVO(monthly, enterprise);
		Long enterpriseId = enterprise.getId();
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);

		EconomicEntity economic_current = economicService.findOne(monthly, enterpriseId);
		EconomicEntity economic_lastYear = economicService.findOne(monthly_lastYear, enterpriseId);
		EconomicEntity economic_lastMonth = economicService.findOne(monthly_lastMonth, enterpriseId);
		alert.setEconomic_current(economic_current);
		alert.setEconomic_lastYear(economic_lastYear);
		alert.setEconomic_lastMonth(economic_lastMonth);
		if (economic_lastYear != null && economic_current != null) {
			alert.setIndustryAddition_yearGrowth(FormulaUtils.getGrowth(economic_current.getIndustryAddition(),
					economic_lastYear.getIndustryAddition()));
			alert.setMainBusiness_yearGrowth(
					FormulaUtils.getGrowth(economic_current.getMainBusiness(), economic_lastYear.getMainBusiness()));
		}
		if (economic_lastMonth != null && economic_current != null) {
			alert.setIndustryAddition_monthGrowth(FormulaUtils.getGrowth(economic_current.getIndustryAddition(),
					economic_lastMonth.getIndustryAddition()));
			alert.setMainBusiness_monthGrowth(
					FormulaUtils.getGrowth(economic_current.getMainBusiness(), economic_lastMonth.getMainBusiness()));
		}

		NationalTaxEntity nationalTax_current = nationalTaxService.findOne(monthly, enterpriseId);
		NationalTaxEntity nationalTax_lastYear = nationalTaxService.findOne(monthly_lastYear, enterpriseId);
		NationalTaxEntity nationalTax_lastMonth = nationalTaxService.findOne(monthly_lastMonth, enterpriseId);
		alert.setNationalTax_current(nationalTax_current);
		alert.setNationalTax_lastYear(nationalTax_lastYear);
		alert.setNationalTax_lastMonth(nationalTax_lastMonth);
		if (nationalTax_lastYear != null && nationalTax_current != null) {
			alert.setNationalTax_yearGrowth(
					FormulaUtils.getGrowth(nationalTax_current.getTaxes(), nationalTax_lastYear.getTaxes()));
		}
		if (nationalTax_lastMonth != null && nationalTax_current != null) {
			alert.setNationalTax_monthGrowth(
					FormulaUtils.getGrowth(nationalTax_current.getTaxes(), nationalTax_lastMonth.getTaxes()));
		}

		LocalTaxEntity localTax_current = localTaxService.findOne(monthly, enterpriseId);
		LocalTaxEntity localTax_lastYear = localTaxService.findOne(monthly_lastYear, enterpriseId);
		LocalTaxEntity localTax_lastMonth = localTaxService.findOne(monthly_lastMonth, enterpriseId);
		alert.setLocalTax_current(localTax_current);
		alert.setLocalTax_lastYear(localTax_lastYear);
		alert.setLocalTax_lastMonth(localTax_lastMonth);
		if (localTax_lastYear != null && localTax_current != null) {
			alert.setLocalTax_yearGrowth(
					FormulaUtils.getGrowth(localTax_current.getTaxes(), localTax_lastYear.getTaxes()));
		}
		if (localTax_lastMonth != null && localTax_current != null) {
			alert.setLocalTax_monthGrowth(
					FormulaUtils.getGrowth(localTax_current.getTaxes(), localTax_lastMonth.getTaxes()));
		}

		EnergyEntity energy_current = energyService.findOne(monthly, enterpriseId);
		EnergyEntity energy_lastYear = energyService.findOne(monthly_lastYear, enterpriseId);
		EnergyEntity energy_lastMonth = energyService.findOne(monthly_lastMonth, enterpriseId);
		alert.setEnergy_current(energy_current);
		alert.setEnergy_lastYear(energy_lastYear);
		alert.setEnergy_lastMonth(energy_lastMonth);
		if (energy_lastYear != null && energy_current != null) {
			alert.setElectricity_yearGrowth(
					FormulaUtils.getGrowth(energy_current.getElectricity(), energy_lastYear.getElectricity()));
			alert.setGas_yearGrowth(FormulaUtils.getGrowth(energy_current.getGas(), energy_lastYear.getGas()));
		}
		if (energy_lastMonth != null && energy_current != null) {
			alert.setElectricity_monthGrowth(
					FormulaUtils.getGrowth(energy_current.getElectricity(), energy_lastMonth.getElectricity()));
			alert.setGas_monthGrowth(FormulaUtils.getGrowth(energy_current.getGas(), energy_lastMonth.getGas()));
		}

		return alert;
	}

	@Override
	public AlertReportVO detailReport(String monthly, BaseEnterpriseEntity enterprise) {
		AlertReportVO alert = new AlertReportVO(monthly, enterprise);
		Long enterpriseId = enterprise.getId();

		// 国税
		NationalTaxEntity nationalTax = nationalTaxService.findOne(monthly, enterpriseId);
		if (nationalTax != null/*
								 * && nationalTax.getStatus() >=
								 * ApproveStatus.REPORT
								 */) {
			alert.setNationalTax(ReportStatus.REPORT);
		}
		// 地税
		LocalTaxEntity localTax = localTaxService.findOne(monthly, enterpriseId);
		if (localTax != null/*
							 * && localTax.getStatus() >= ApproveStatus.REPORT
							 */) {
			alert.setLocalTax(ReportStatus.REPORT);
		}
		// 经济运行
		EconomicEntity economic = economicService.findOne(monthly, enterpriseId);
		if (economic != null/*
							 * && economic.getStatus() >= ApproveStatus.REPORT
							 */) {
			alert.setEconomic(ReportStatus.REPORT);
		}
		// 能源消耗
		EnergyEntity energy = energyService.findOne(monthly, enterpriseId);
		if (energy != null/* && energy.getStatus() >= ApproveStatus.REPORT */) {
			alert.setEnergy(ReportStatus.REPORT);
		}
		// 效益指标
		BenefitEntity benefit = benefitService.findOne(monthly, enterpriseId);
		if (benefit != null/* && benefit.getStatus() >= ApproveStatus.REPORT */) {
			alert.setBenefit(ReportStatus.REPORT);
		}

		return alert;
	}

}