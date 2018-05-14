package com.hongmeng.gcgyy.service.monitor;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;
import com.hongmeng.gcgyy.repository.monitor.LocalTaxRepository;

@Service
public class LocalTaxServiceImpl implements LocalTaxService {

	@Autowired
	LocalTaxRepository localTaxRespository;

	@Override
	public void save(LocalTaxEntity localTax) {
		localTaxRespository.save(localTax);
	}

	@Override
	public void update(LocalTaxEntity localTax, BaseEnterpriseEntity enterprise, String monthly, String taxes) {
		localTax.setEnterprise(enterprise);
		localTax.setMonthly(monthly);
		localTax.setTaxes(taxes);
		localTaxRespository.save(localTax);
	}

	@Override
	public void delete(List<Long> localTaxIds) {
		Iterable<LocalTaxEntity> it = localTaxRespository.findByIdIn(localTaxIds);
		localTaxRespository.delete(it);
	}

	@Override
	public LocalTaxEntity findOne(Long localTaxId) {
		return localTaxRespository.findOne(localTaxId);
	}

	@Override
	public LocalTaxEntity findOne(String monthly, Long enterpriseId) {
		return localTaxRespository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);
	}

	public List<LocalTaxEntity> listByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list) {
		return localTaxRespository.findByMonthlyAndEnterpriseIn(monthly, list);
	}
	
	@Override
	public List<LocalTaxEntity> listByEnterpriseId(Long enterpriseId) {
		return localTaxRespository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId);
	}

	@Override
	public LocalTaxVO detail(LocalTaxEntity localTax) {
		LocalTaxEntity localTax_lastYear = getLastYearNational(localTax);
		LocalTaxVO ret = new LocalTaxVO(localTax, localTax_lastYear);

		if (localTax_lastYear != null) {
			String taxes_yearGrowth = FormulaUtils.getGrowth(localTax.getTaxes(), localTax_lastYear.getTaxes());
			ret.setLocalTax_yearGrowth(taxes_yearGrowth);
		}
		return ret;
	}
	
	public LocalTaxEntity getLastYearNational(LocalTaxEntity localTax) {
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(localTax.getMonthly());
		return localTaxRespository.findByMonthlyAndEnterpriseId(monthly_lastYear, localTax.getEnterprise().getId());
	}
	
	

	@Override
	public LocalTaxVO detail(String monthly, BaseEnterpriseEntity enterprise) {
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		Long enterpriseId = enterprise.getId();
		
		LocalTaxEntity localTax_current = findOne(monthly, enterpriseId);
		LocalTaxEntity localTax_lastYear = findOne(monthly_lastYear, enterpriseId);
		LocalTaxEntity localTax_lastMonth = findOne(monthly_lastMonth, enterpriseId);
		
		LocalTaxVO tax = new LocalTaxVO(monthly, localTax_current, localTax_lastYear, localTax_lastMonth);
		tax.setEnterprise(enterprise);
		
		if (localTax_lastYear != null && localTax_current != null) {
			tax.setLocalTax_yearGrowth(FormulaUtils.getGrowth(localTax_current.getTaxes(), localTax_lastYear.getTaxes()));
		}
		
		if (localTax_lastMonth != null && localTax_current != null) {
			tax.setLocalTax_monthGrowth(FormulaUtils.getGrowth(localTax_current.getTaxes(), localTax_lastMonth.getTaxes()));
		}
		
		return tax;
	}

	@Override
	public LocalTaxVO sumEnterpriseTax(String monthly, List<BaseEnterpriseEntity> enterpriseList) {
		// current
		double tax_current_totle = 0;
		List<LocalTaxEntity> localTaxList = listByMonthlyAndEnterpriseIn(monthly, enterpriseList);
		for (LocalTaxEntity localTax: localTaxList) {
			tax_current_totle += Double.valueOf(localTax.getTaxes());
		}
		LocalTaxEntity localTax_current_totle = new LocalTaxEntity(null, monthly, formatTax(tax_current_totle));
		
		// last year
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		double tax_lastYear_totle = 0;
		List<LocalTaxEntity> localTaxList_lastYear = listByMonthlyAndEnterpriseIn(monthly_lastYear, enterpriseList);
		for (LocalTaxEntity localTax: localTaxList_lastYear) {
			tax_lastYear_totle += Double.valueOf(localTax.getTaxes());
		}
		LocalTaxEntity localTax_lastYear_totle = new LocalTaxEntity(null, monthly_lastYear, formatTax(tax_lastYear_totle));
		
		// last month
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		double tax_lastMonth_totle = 0;
		List<LocalTaxEntity> localTaxList_lastMonth = listByMonthlyAndEnterpriseIn(monthly_lastMonth, enterpriseList);
		for (LocalTaxEntity localTax: localTaxList_lastMonth) {
			tax_lastMonth_totle += Double.valueOf(localTax.getTaxes());
		}
		LocalTaxEntity localTax_lastMonth_totle = new LocalTaxEntity(null, monthly_lastMonth, formatTax(tax_lastMonth_totle));
		
		LocalTaxVO ret = new LocalTaxVO(monthly, localTax_current_totle, localTax_lastYear_totle, localTax_lastMonth_totle);
		ret.setLocalTax_yearGrowth(FormulaUtils.getGrowth(localTax_current_totle.getTaxes(), localTax_lastYear_totle.getTaxes()));
		ret.setLocalTax_monthGrowth(FormulaUtils.getGrowth(localTax_current_totle.getTaxes(), localTax_lastMonth_totle.getTaxes()));
		
		return ret;
	}
	
	public String formatTax(double taxDouble) {
		DecimalFormat decimalFormat = new DecimalFormat("###0.00");  
        return decimalFormat.format(taxDouble);  
	}

}
