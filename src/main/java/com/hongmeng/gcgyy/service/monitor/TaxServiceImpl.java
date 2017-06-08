package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;

@Service
public class TaxServiceImpl implements TaxService {
	
	static Logger log = LoggerFactory.getLogger(TaxServiceImpl.class);
	
	@Autowired
	NationalTaxService nationalTaxService;
	
	@Autowired
	LocalTaxService localTaxService;

	@Override
	public TaxVO detail(String monthly, BaseEnterpriseEntity enterprise) {
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		Long enterpriseId = enterprise.getId();
		
		NationalTaxEntity nationalTax_current = nationalTaxService.findOne(monthly, enterpriseId);
		NationalTaxEntity nationalTax_lastYear = nationalTaxService.findOne(monthly_lastYear, enterpriseId);
		NationalTaxEntity nationalTax_lastMonth = nationalTaxService.findOne(monthly_lastMonth, enterpriseId);
		
		LocalTaxEntity localTax_current = localTaxService.findOne(monthly, enterpriseId);
		LocalTaxEntity localTax_lastYear = localTaxService.findOne(monthly_lastYear, enterpriseId);
		LocalTaxEntity localTax_lastMonth = localTaxService.findOne(monthly_lastMonth, enterpriseId);
		
		TaxVO tax = new TaxVO(monthly, nationalTax_current, nationalTax_lastYear, nationalTax_lastMonth, localTax_current, localTax_lastYear, localTax_lastMonth);
		tax.setEnterprise(enterprise);
		if (nationalTax_lastYear != null && nationalTax_current != null) {
			tax.setSale_yearGrowth(FormulaUtils.getGrowth(nationalTax_current.getSale(), nationalTax_lastYear.getSale()));
			tax.setNationalTax_yearGrowth(FormulaUtils.getGrowth(nationalTax_current.getTaxes(), nationalTax_lastYear.getTaxes()));
		}
		
		if (nationalTax_lastMonth != null && nationalTax_current != null) {
			tax.setSale_monthGrowth(FormulaUtils.getGrowth(nationalTax_current.getSale(), nationalTax_lastMonth.getSale()));
			tax.setNationalTax_monthGrowth(FormulaUtils.getGrowth(nationalTax_current.getTaxes(), nationalTax_lastMonth.getTaxes()));
		}
		
		if (localTax_lastYear != null && localTax_current != null) {
			tax.setLocalTax_yearGrowth(FormulaUtils.getGrowth(localTax_current.getTaxes(), localTax_lastYear.getTaxes()));
		}
		
		if (localTax_lastMonth != null && localTax_current != null) {
			tax.setLocalTax_monthGrowth(FormulaUtils.getGrowth(localTax_current.getTaxes(), localTax_lastMonth.getTaxes()));
		}
		
		return tax;
	}

	@Override
	public TaxVO sumEnterpriseTax(String monthly, List<BaseEnterpriseEntity> enterpriseList) {
		NationalTaxVO nationalTax = nationalTaxService.sumEnterpriseTax(monthly, enterpriseList);
		LocalTaxVO localTax = localTaxService.sumEnterpriseTax(monthly, enterpriseList);
		
		TaxVO tax = new TaxVO();
		tax.setMonthly(monthly);
		
		// national tax
		tax.setNationalTax_current(nationalTax.getNationalTax_current());
		tax.setNationalTax_lastYear(nationalTax.getNationalTax_lastYear());
		tax.setNationalTax_lastMonth(nationalTax.getNationalTax_lastMonth());
		
		tax.setSale_yearGrowth(nationalTax.getSale_yearGrowth());
		tax.setSale_monthGrowth(nationalTax.getSale_monthGrowth());
		tax.setNationalTax_yearGrowth(nationalTax.getNationalTax_yearGrowth());
		tax.setNationalTax_monthGrowth(nationalTax.getNationalTax_monthGrowth());
		
		// local tax
		tax.setLocalTax_current(localTax.getLocalTax_current());
		tax.setLocalTax_lastYear(localTax.getLocalTax_lastYear());
		tax.setLocalTax_lastMonth(localTax.getLocalTax_lastMonth());
		
		tax.setLocalTax_yearGrowth(localTax.getLocalTax_yearGrowth());
		tax.setLocalTax_monthGrowth(localTax.getLocalTax_monthGrowth());
		
		return tax;
	}
	
}