package com.hongmeng.gcgyy.service.monitor;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;
import com.hongmeng.gcgyy.repository.monitor.NationalTaxRepository;

@Service
public class NationalTaxServiceImpl implements NationalTaxService {

	@Autowired
	NationalTaxRepository nationalTaxRepository;

	@Override
	public void save(NationalTaxEntity nationalTax) {
		nationalTaxRepository.save(nationalTax);
	}

	@Override
	public void update(NationalTaxEntity nationalTax, BaseEnterpriseEntity enterprise, String monthly, String sale,
			String taxes) {
		nationalTax.setEnterprise(enterprise);
		nationalTax.setMonthly(monthly);
		nationalTax.setSale(sale);
		nationalTax.setTaxes(taxes);
		nationalTaxRepository.save(nationalTax);
	}

	@Override
	public void delete(List<Long> nationalTaxIds) {
		Iterable<NationalTaxEntity> it = nationalTaxRepository.findByIdIn(nationalTaxIds);
		nationalTaxRepository.delete(it);
	}

	@Override
	public NationalTaxEntity findOne(Long nationalTaxId) {
		return nationalTaxRepository.findOne(nationalTaxId);
	}
	
	@Override
	public NationalTaxEntity findOne(String monthly, Long enterpriseId) {
		return nationalTaxRepository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);
	}

	public List<NationalTaxEntity> listByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list) {
		return nationalTaxRepository.findByMonthlyAndEnterpriseIn(monthly, list);
	}
	
	@Override
	public List<NationalTaxEntity> listByEnterprise(Long enterpriseId) {
		return nationalTaxRepository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId);
	}

	@Override
	public NationalTaxVO detail(NationalTaxEntity nationalTax) {
		NationalTaxEntity nationalTax_lastYear = getLastYearNational(nationalTax);
		NationalTaxVO ret = new NationalTaxVO(nationalTax, nationalTax_lastYear);

		if (nationalTax_lastYear != null) {
			String sale_yearGrowth = FormulaUtils.getGrowth(nationalTax.getSale(), nationalTax_lastYear.getSale());
			String taxes_yearGrowth = FormulaUtils.getGrowth(nationalTax.getTaxes(), nationalTax_lastYear.getTaxes());
			ret.setSale_yearGrowth(sale_yearGrowth);
			ret.setNationalTax_yearGrowth(taxes_yearGrowth);
		}
		return ret;
	}
	
	public NationalTaxEntity getLastYearNational(NationalTaxEntity nationalTax) {
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(nationalTax.getMonthly());
		return nationalTaxRepository.findByMonthlyAndEnterpriseId(monthly_lastYear,
				nationalTax.getEnterprise().getId());
	}
	
	

	@Override
	public NationalTaxVO detail(String monthly, BaseEnterpriseEntity enterprise) {
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		Long enterpriseId = enterprise.getId();
		
		NationalTaxEntity nationalTax_current = findOne(monthly, enterpriseId);
		NationalTaxEntity nationalTax_lastYear = findOne(monthly_lastYear, enterpriseId);
		NationalTaxEntity nationalTax_lastMonth = findOne(monthly_lastMonth, enterpriseId);
		
		
		NationalTaxVO tax = new NationalTaxVO(monthly, nationalTax_current, nationalTax_lastYear, nationalTax_lastMonth);
		tax.setEnterprise(enterprise);
		if (nationalTax_lastYear != null && nationalTax_current != null) {
			tax.setSale_yearGrowth(FormulaUtils.getGrowth(nationalTax_current.getSale(), nationalTax_lastYear.getSale()));
			tax.setNationalTax_yearGrowth(FormulaUtils.getGrowth(nationalTax_current.getTaxes(), nationalTax_lastYear.getTaxes()));
		}
		
		if (nationalTax_lastMonth != null && nationalTax_current != null) {
			tax.setSale_monthGrowth(FormulaUtils.getGrowth(nationalTax_current.getSale(), nationalTax_lastMonth.getSale()));
			tax.setNationalTax_monthGrowth(FormulaUtils.getGrowth(nationalTax_current.getTaxes(), nationalTax_lastMonth.getTaxes()));
		}
		
		return tax;
	}

	@Override
	public NationalTaxVO sumEnterpriseTax(String monthly, List<BaseEnterpriseEntity> enterpriseList) {
		// current
		double sale_current_totle = 0;
		double tax_current_totle = 0;
		List<NationalTaxEntity> nationalTaxList = listByMonthlyAndEnterpriseIn(monthly, enterpriseList);
		for (NationalTaxEntity nationalTax: nationalTaxList) {
			sale_current_totle += Double.valueOf(nationalTax.getSale());
			tax_current_totle += Double.valueOf(nationalTax.getTaxes());
		}
		NationalTaxEntity nationalTax_current_totle = new NationalTaxEntity(null, monthly, formatTax(sale_current_totle), formatTax(tax_current_totle));
		
		// last year
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		double sale_lastYear_totle = 0;
		double tax_lastYear_totle = 0;
		List<NationalTaxEntity> nationalTaxList_lastYear = listByMonthlyAndEnterpriseIn(monthly_lastYear, enterpriseList);
		for (NationalTaxEntity nationalTax: nationalTaxList_lastYear) {
			sale_lastYear_totle += Double.valueOf(nationalTax.getSale());
			tax_lastYear_totle += Double.valueOf(nationalTax.getTaxes());
		}
		NationalTaxEntity nationalTax_lastYear_totle = new NationalTaxEntity(null, monthly, formatTax(sale_lastYear_totle), formatTax(tax_lastYear_totle));
		
		// last month
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		double sale_lastMonth_totle = 0;
		double tax_lastMonth_totle = 0;
		List<NationalTaxEntity> nationalTaxList_lastMonth = listByMonthlyAndEnterpriseIn(monthly_lastMonth, enterpriseList);
		for (NationalTaxEntity nationalTax: nationalTaxList_lastMonth) {
			sale_lastMonth_totle += Double.valueOf(nationalTax.getSale());
			tax_lastMonth_totle += Double.valueOf(nationalTax.getTaxes());
		}
		NationalTaxEntity nationalTax_lastMonth_totle = new NationalTaxEntity(null, monthly, formatTax(sale_lastMonth_totle), formatTax(tax_lastMonth_totle));
		
		
		NationalTaxVO ret = new NationalTaxVO(monthly, nationalTax_current_totle, nationalTax_lastYear_totle, nationalTax_lastMonth_totle);
		
		ret.setSale_yearGrowth(FormulaUtils.getGrowth(nationalTax_current_totle.getSale(), nationalTax_lastYear_totle.getSale()));
		ret.setNationalTax_yearGrowth(FormulaUtils.getGrowth(nationalTax_current_totle.getTaxes(), nationalTax_lastYear_totle.getTaxes()));
		
		ret.setSale_monthGrowth(FormulaUtils.getGrowth(nationalTax_current_totle.getSale(), nationalTax_lastMonth_totle.getSale()));
		ret.setNationalTax_monthGrowth(FormulaUtils.getGrowth(nationalTax_current_totle.getTaxes(), nationalTax_lastMonth_totle.getTaxes()));
		
		return ret;
	}
	
	public String formatTax(double taxDouble) {
		DecimalFormat decimalFormat = new DecimalFormat("###0.00");  
        return decimalFormat.format(taxDouble);  
	}

}