package com.hongmeng.gcgyy.service.monitor;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicTargetEntity;
import com.hongmeng.gcgyy.repository.monitor.EconomicRepository;
import com.hongmeng.gcgyy.repository.monitor.EconomicTargetRepository;

@Service
public class EconomicServiceImpl implements EconomicService {

	@Autowired
	EconomicRepository economicRepository;

	@Autowired
	EconomicTargetRepository targetRepository;

	@Override
	public EconomicEntity findOne(Long economicId) {
		return economicRepository.findOne(economicId);
	}

	@Override
	public EconomicEntity findOne(String monthly, Long enterpriseId) {
		return economicRepository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);
	}

	@Override
	public void save(EconomicEntity economic) {
		economicRepository.save(economic);
	}

	@Override
	public void update(EconomicEntity economic, String monthly, BaseEnterpriseEntity enterprise, float industryAddition,
			float mainBusiness, float profit, float tax) {
		economic.setMonthly(monthly);
		economic.setEnterprise(enterprise);
		economic.setIndustryAddition(industryAddition);
		economic.setMainBusiness(mainBusiness);
		economic.setProfit(profit);
		economic.setTax(tax);
		economicRepository.save(economic);
	}

	@Override
	public void delete(List<Long> economicIds) {
		Iterable<EconomicEntity> it = economicRepository.findByIdIn(economicIds);
		economicRepository.delete(it);
	}

	@Override
	public List<EconomicEntity> list(String monthly) {
		return economicRepository.findByMonthly(monthly);
	}

	@Override
	public List<EconomicEntity> list(String monthly, int page, int size) {
		Page<EconomicEntity> economicPage = economicRepository.findByMonthly(monthly, new PageRequest(page, size));
		return economicPage.getContent();
	}

	@Override
	public List<EconomicEntity> list(Long enterpriseId) {
		return economicRepository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId);
	}

	@Override
	public List<EconomicEntity> list(Long enterpriseId, int page, int size) {
		Page<EconomicEntity> economicPage = economicRepository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId,
				new PageRequest(page, size));
		return economicPage.getContent();
	}

	@Override
	public EconomicVO detail(EconomicEntity economic) {
		String monthly = economic.getMonthly();
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(economic.getMonthly());
		EconomicEntity economic_lastYear = economicRepository.findByMonthlyAndEnterpriseId(monthly_lastYear,
				economic.getEnterprise().getId());
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(economic.getMonthly());
		EconomicEntity economic_lastMonth = economicRepository.findByMonthlyAndEnterpriseId(monthly_lastMonth,
				economic.getEnterprise().getId());

		EconomicVO ret = new EconomicVO(monthly, economic, economic_lastYear, economic_lastMonth);

		EconomicEntity economic_current_endMonth = sumEndMonthEconomic(economic.getMonthly(), economic.getEnterprise());
		ret.setIndustryAddition_current_endMonth(economic_current_endMonth.getIndustryAddition());
		ret.setMainBusiness_current_endMonth(economic_current_endMonth.getMainBusiness());

		String year = FormulaUtils.getYear(economic.getMonthly());
		EconomicTargetEntity target = targetRepository.findByEnterpriseIdAndYear(economic.getEnterprise().getId(),
				year);
		if (target != null) {
			ret.setIndustryAddition_Target(target);
			ret.setIndustryAddition_complete(
					FormulaUtils.getPercent(economic_current_endMonth.getIndustryAddition(), target.getValue()));
		}

		if (economic_lastYear != null) {
			ret.setIndustryAddition_yearGrowth(
					FormulaUtils.getGrowth(economic.getIndustryAddition(), economic_lastYear.getIndustryAddition()));
			ret.setMainBusiness_yearGrowth(
					FormulaUtils.getGrowth(economic.getMainBusiness(), economic_lastYear.getMainBusiness()));
			ret.setProfit_yearGrowth(FormulaUtils.getGrowth(economic.getProfit(), economic_lastYear.getProfit()));
			ret.setTax_yearGrowth(FormulaUtils.getGrowth(economic.getTax(), economic_lastYear.getTax()));

			EconomicEntity economic_lastYear_endMonth = sumEndMonthEconomic(monthly_lastYear, economic.getEnterprise());
			ret.setIndustryAddition_lastYear_endMonth(economic_lastYear_endMonth.getIndustryAddition());
			ret.setMainBusiness_lastYear_endMonth(economic_lastYear_endMonth.getMainBusiness());

			ret.setIndustryAddition_endMonth_yearGrowth(FormulaUtils.getGrowth(
					ret.getIndustryAddition_current_endMonth(), ret.getIndustryAddition_lastYear_endMonth()));
			ret.setMainBusiness_endMonth_yearGrowth(FormulaUtils.getGrowth(ret.getMainBusiness_current_endMonth(),
					ret.getMainBusiness_lastYear_endMonth()));
		}

		if (economic_lastMonth != null) {
			ret.setIndustryAddition_monthGrowth(
					FormulaUtils.getGrowth(economic.getIndustryAddition(), economic_lastMonth.getIndustryAddition()));
			ret.setMainBusiness_monthGrowth(
					FormulaUtils.getGrowth(economic.getMainBusiness(), economic_lastMonth.getMainBusiness()));
			ret.setProfit_monthGrowth(FormulaUtils.getGrowth(economic.getProfit(), economic_lastMonth.getProfit()));
			ret.setTax_monthGrowth(FormulaUtils.getGrowth(economic.getTax(), economic_lastMonth.getTax()));
		}

		return ret;
	}

	@Override
	public EconomicVO detail(String monthly, BaseEnterpriseEntity enterprise) {
		EconomicVO ret = null;
		Long enterpriseId = enterprise.getId();

		EconomicEntity economic_current = economicRepository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);
/*		if (economic_current != null && economic_current.getStatus() < ApproveStatus.REPORT) {
			ret = new EconomicVO(monthly, null, null, null);
			ret.setEnterprise(enterprise);
			return ret;
		}*/
		
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		EconomicEntity economic_lastYear = economicRepository.findByMonthlyAndEnterpriseId(monthly_lastYear,
				enterpriseId);
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		EconomicEntity economic_lastMonth = economicRepository.findByMonthlyAndEnterpriseId(monthly_lastMonth,
				enterpriseId);

		ret = new EconomicVO(monthly, economic_current, economic_lastYear, economic_lastMonth);
		ret.setEnterprise(enterprise);

		EconomicEntity economic_current_endMonth = sumEndMonthEconomic(monthly, enterprise);
		ret.setIndustryAddition_current_endMonth(economic_current_endMonth.getIndustryAddition());
		ret.setMainBusiness_current_endMonth(economic_current_endMonth.getMainBusiness());

		String year = FormulaUtils.getYear(monthly);
		EconomicTargetEntity target = targetRepository.findByEnterpriseIdAndYear(enterpriseId, year);
		if (target != null) {
			ret.setIndustryAddition_Target(target);
			ret.setIndustryAddition_complete(
					FormulaUtils.getPercent(economic_current_endMonth.getIndustryAddition(), target.getValue()));
		}

		if (economic_current != null && economic_lastYear != null) {
			ret.setIndustryAddition_yearGrowth(FormulaUtils.getGrowth(economic_current.getIndustryAddition(),
					economic_lastYear.getIndustryAddition()));
			ret.setMainBusiness_yearGrowth(
					FormulaUtils.getGrowth(economic_current.getMainBusiness(), economic_lastYear.getMainBusiness()));
			ret.setProfit_yearGrowth(
					FormulaUtils.getGrowth(economic_current.getProfit(), economic_lastYear.getProfit()));
			ret.setTax_yearGrowth(FormulaUtils.getGrowth(economic_current.getTax(), economic_lastYear.getTax()));

			EconomicEntity economic_lastYear_endMonth = sumEndMonthEconomic(monthly_lastYear, enterprise);
			ret.setIndustryAddition_lastYear_endMonth(economic_lastYear_endMonth.getIndustryAddition());
			ret.setMainBusiness_lastYear_endMonth(economic_lastYear_endMonth.getMainBusiness());

			ret.setIndustryAddition_endMonth_yearGrowth(FormulaUtils.getGrowth(
					ret.getIndustryAddition_current_endMonth(), ret.getIndustryAddition_lastYear_endMonth()));
			ret.setMainBusiness_endMonth_yearGrowth(FormulaUtils.getGrowth(ret.getMainBusiness_current_endMonth(),
					ret.getMainBusiness_lastYear_endMonth()));
		}

		if (economic_current != null && economic_lastMonth != null) {
			ret.setIndustryAddition_monthGrowth(FormulaUtils.getGrowth(economic_current.getIndustryAddition(),
					economic_lastMonth.getIndustryAddition()));
			ret.setMainBusiness_monthGrowth(
					FormulaUtils.getGrowth(economic_current.getMainBusiness(), economic_lastMonth.getMainBusiness()));
			ret.setProfit_monthGrowth(
					FormulaUtils.getGrowth(economic_current.getProfit(), economic_lastMonth.getProfit()));
			ret.setTax_monthGrowth(FormulaUtils.getGrowth(economic_current.getTax(), economic_lastMonth.getTax()));
		}

		return ret;
	}

	public EconomicEntity sumEndMonthEconomic(String monthly, BaseEnterpriseEntity enterprise) {
		List<String> monthlys = FormulaUtils.getEndMonthList(monthly);
		List<EconomicEntity> economics = economicRepository.findByMonthlyInAndEnterpriseId(monthlys,
				enterprise.getId());

		String totle_monthly = "";
		float industryAddition_totle = 0;
		float mainBusiness_totle = 0;
		for (EconomicEntity econ : economics) {
			totle_monthly += econ.getMonthly() + ",";
			industryAddition_totle += econ.getIndustryAddition();
			mainBusiness_totle += econ.getMainBusiness();
		}
		EconomicEntity ret = new EconomicEntity(totle_monthly, enterprise, industryAddition_totle, mainBusiness_totle);
		return ret;
	}

	@Override
	public List<EconomicEntity> listByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list) {
		return economicRepository.findByMonthlyAndEnterpriseIn(monthly, list);
	}

	@Override
	public List<EconomicEntity> listByMonthlyInAndEnterpriseId(List<String> monthlyList, Long enterpriseId) {
		return economicRepository.findByMonthlyInAndEnterpriseId(monthlyList, enterpriseId);
	}

	@Override
	public EconomicVO sumEnterpriseEconomic(String monthly, List<BaseEnterpriseEntity> enterpriseList) {
		// current
		float industryAddition_current_totle = 0;
		float mainBusiness_current_totle = 0;
		float profit_current_totle = 0;
		float tax_current_totle = 0;
		float industryAddition_endMonth_current_totle = 0;
		float mainBusiness_endMonth_current_totle = 0;
		float industryAddition_target_totle = 0;

		String year = FormulaUtils.getYear(monthly);
		List<EconomicEntity> economicList = listByMonthlyAndEnterpriseIn(monthly, enterpriseList);
		for (EconomicEntity economic : economicList) {
//			if (economic.getStatus() == ApproveStatus.PASS) {
				industryAddition_current_totle += economic.getIndustryAddition();
				mainBusiness_current_totle += economic.getMainBusiness();
				profit_current_totle += economic.getProfit();
				tax_current_totle += economic.getTax();
//			}

			EconomicEntity economic_endMonth = sumEndMonthEconomic(monthly, economic.getEnterprise());
			industryAddition_endMonth_current_totle += economic_endMonth.getIndustryAddition();
			mainBusiness_endMonth_current_totle += economic_endMonth.getMainBusiness();

			EconomicTargetEntity target = targetRepository.findByEnterpriseIdAndYear(economic.getEnterprise().getId(), year);
			if (target != null) {
				industryAddition_target_totle += target.getValue();
			}
		}
		EconomicEntity economic_current_totle = new EconomicEntity(monthly, null, industryAddition_current_totle,
				mainBusiness_current_totle, profit_current_totle, tax_current_totle);

		// last year
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		float industryAddition_lastYear_totle = 0;
		float mainBusiness_lastYear_totle = 0;
		float profit_lastYear_totle = 0;
		float tax_lastYear_totle = 0;
		float industryAddition_endMonth_lastYear_totle = 0;
		float mainBusiness_endMonth_lastYear_totle = 0;
		List<EconomicEntity> economicList_lastYear = listByMonthlyAndEnterpriseIn(monthly_lastYear, enterpriseList);
		for (EconomicEntity economic : economicList_lastYear) {
//			if (economic.getStatus() == ApproveStatus.PASS) {
				industryAddition_lastYear_totle += economic.getIndustryAddition();
				mainBusiness_lastYear_totle += economic.getMainBusiness();
				profit_lastYear_totle += economic.getProfit();
				tax_lastYear_totle += economic.getTax();
//			}

			EconomicEntity economic_endMonth = sumEndMonthEconomic(monthly_lastYear, economic.getEnterprise());
			industryAddition_endMonth_lastYear_totle += economic_endMonth.getIndustryAddition();
			mainBusiness_endMonth_lastYear_totle += economic_endMonth.getMainBusiness();
		}
		EconomicEntity economic_lastYear_totle = new EconomicEntity(monthly_lastYear, null,
				industryAddition_lastYear_totle, mainBusiness_lastYear_totle, profit_lastYear_totle,
				tax_lastYear_totle);

		EconomicVO ret = new EconomicVO(monthly, economic_current_totle, economic_lastYear_totle);

		// 同比
		ret.setIndustryAddition_yearGrowth(FormulaUtils.getGrowth(economic_current_totle.getIndustryAddition(),
				economic_lastYear_totle.getIndustryAddition()));
		ret.setMainBusiness_yearGrowth(FormulaUtils.getGrowth(economic_current_totle.getMainBusiness(),
				economic_lastYear_totle.getMainBusiness()));
		ret.setProfit_yearGrowth(
				FormulaUtils.getGrowth(economic_current_totle.getProfit(), economic_lastYear_totle.getProfit()));
		ret.setTax_yearGrowth(
				FormulaUtils.getGrowth(economic_current_totle.getTax(), economic_lastYear_totle.getTax()));

		// 本月止
		ret.setIndustryAddition_current_endMonth(industryAddition_endMonth_current_totle);
		ret.setMainBusiness_current_endMonth(mainBusiness_endMonth_current_totle);

		// 去年同期本月止
		ret.setIndustryAddition_lastYear_endMonth(industryAddition_endMonth_lastYear_totle);
		ret.setMainBusiness_lastYear_endMonth(mainBusiness_endMonth_lastYear_totle);

		ret.setIndustryAddition_endMonth_yearGrowth(FormulaUtils.getGrowth(ret.getIndustryAddition_current_endMonth(),
				ret.getIndustryAddition_lastYear_endMonth()));
		ret.setMainBusiness_endMonth_yearGrowth(FormulaUtils.getGrowth(ret.getMainBusiness_current_endMonth(),
				ret.getMainBusiness_lastYear_endMonth()));

		EconomicTargetEntity target = new EconomicTargetEntity(null, year, industryAddition_target_totle);
		ret.setIndustryAddition_Target(target);
		ret.setIndustryAddition_complete(
				FormulaUtils.getPercent(industryAddition_endMonth_current_totle, industryAddition_target_totle));

		return ret;
	}

	@Override
	public EconomicVO sumEnterpriseEconomic2(String monthly, List<BaseEnterpriseEntity> enterpriseList) {
		// current
		float industryAddition_current_totle = 0;
		float mainBusiness_current_totle = 0;
		float profit_current_totle = 0;
		float tax_current_totle = 0;
		List<EconomicEntity> economicList = listByMonthlyAndEnterpriseIn(monthly, enterpriseList);
		for (EconomicEntity economic : economicList) {
//			if (economic.getStatus() == ApproveStatus.PASS) {
				industryAddition_current_totle += economic.getIndustryAddition();
				mainBusiness_current_totle += economic.getMainBusiness();
				profit_current_totle += economic.getProfit();
				tax_current_totle += economic.getTax();
//			}
		}
		EconomicEntity economic_current_totle = new EconomicEntity(monthly, null, industryAddition_current_totle,
				mainBusiness_current_totle, profit_current_totle, tax_current_totle);

		// last year
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		float industryAddition_lastYear_totle = 0;
		float mainBusiness_lastYear_totle = 0;
		float profit_lastYear_totle = 0;
		float tax_lastYear_totle = 0;
		List<EconomicEntity> economicList_lastYear = listByMonthlyAndEnterpriseIn(monthly_lastYear, enterpriseList);
		for (EconomicEntity economic : economicList_lastYear) {
//			if (economic.getStatus() == ApproveStatus.PASS) {
				industryAddition_lastYear_totle += economic.getIndustryAddition();
				mainBusiness_lastYear_totle += economic.getMainBusiness();
				profit_lastYear_totle += economic.getProfit();
				tax_lastYear_totle += economic.getTax();
//			}
		}
		EconomicEntity economic_lastYear_totle = new EconomicEntity(monthly_lastYear, null,
				industryAddition_lastYear_totle, mainBusiness_lastYear_totle, profit_lastYear_totle,
				tax_lastYear_totle);

		// last month
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		float industryAddition_lastMonth_totle = 0;
		float mainBusiness_lastMonth_totle = 0;
		float profit_lastMonth_totle = 0;
		float tax_lastMonth_totle = 0;
		List<EconomicEntity> economicList_lastMonth = listByMonthlyAndEnterpriseIn(monthly_lastMonth, enterpriseList);
		for (EconomicEntity economic : economicList_lastMonth) {
//			if (economic.getStatus() == ApproveStatus.PASS) {
				industryAddition_lastMonth_totle += economic.getIndustryAddition();
				mainBusiness_lastMonth_totle += economic.getMainBusiness();
				profit_lastMonth_totle += economic.getProfit();
				tax_lastMonth_totle += economic.getTax();
//			}
		}
		EconomicEntity economic_lastMonth_totle = new EconomicEntity(monthly_lastMonth, null,
				industryAddition_lastMonth_totle, mainBusiness_lastMonth_totle, profit_lastMonth_totle,
				tax_lastMonth_totle);

		EconomicVO ret = new EconomicVO(monthly, economic_current_totle, economic_lastYear_totle, economic_lastMonth_totle);

		// 同比增幅
		ret.setIndustryAddition_yearGrowth(FormulaUtils.getGrowth(economic_current_totle.getIndustryAddition(),
				economic_lastYear_totle.getIndustryAddition()));
		ret.setMainBusiness_yearGrowth(FormulaUtils.getGrowth(economic_current_totle.getMainBusiness(),
				economic_lastYear_totle.getMainBusiness()));
		ret.setProfit_yearGrowth(
				FormulaUtils.getGrowth(economic_current_totle.getProfit(), economic_lastYear_totle.getProfit()));
		ret.setTax_yearGrowth(
				FormulaUtils.getGrowth(economic_current_totle.getTax(), economic_lastYear_totle.getTax()));

		// 环比增幅
		ret.setIndustryAddition_monthGrowth(FormulaUtils.getGrowth(economic_current_totle.getIndustryAddition(),
				economic_lastMonth_totle.getIndustryAddition()));
		ret.setMainBusiness_monthGrowth(FormulaUtils.getGrowth(economic_current_totle.getMainBusiness(),
				economic_lastMonth_totle.getMainBusiness()));
		ret.setProfit_monthGrowth(
				FormulaUtils.getGrowth(economic_current_totle.getProfit(), economic_lastMonth_totle.getProfit()));
		ret.setTax_monthGrowth(
				FormulaUtils.getGrowth(economic_current_totle.getTax(), economic_lastMonth_totle.getTax()));

		return ret;
	}

	@Override
	public EconomicTargetEntity findOneTarget(Long economicTargetId) {
		return targetRepository.findOne(economicTargetId);
	}

	@Override
	public void saveTarget(EconomicTargetEntity target) {
		targetRepository.save(target);
	}

	@Override
	public void update(EconomicTargetEntity target, String year, float value) {
		target.setYear(year);
		target.setValue(value);
		targetRepository.save(target);
	}

	@Override
	public List<EconomicVO> listIndustryDesc(String monthly) {
		List<EconomicVO> ret = new LinkedList<>();

		List<EconomicEntity> list = list(monthly);
		for (EconomicEntity economic : list) {
			ret.add(getIndustryGrowth(economic));
		}

		Comparator<EconomicVO> comparator = new Comparator<EconomicVO>() {
			public int compare(EconomicVO v1, EconomicVO v2) {
				float f1 = (v1.getIndustryAddition_monthGrowth() == null) ? 0
						: Float.parseFloat(v1.getIndustryAddition_monthGrowth());
				float f2 = (v2.getIndustryAddition_monthGrowth() == null) ? 0
						: Float.parseFloat(v2.getIndustryAddition_monthGrowth());
				if (f1 < f2) {
					return 1;
				} else if (f1 == f2) {
					return 0;
				}
				return -1;
			}
		};

		Collections.sort(ret, comparator);
		return ret;
	}

	public EconomicVO getIndustryGrowth(EconomicEntity economic) {
		String monthly = economic.getMonthly();
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(economic.getMonthly());
		EconomicEntity economic_lastMonth = economicRepository.findByMonthlyAndEnterpriseId(monthly_lastMonth,
				economic.getEnterprise().getId());
		EconomicVO ret = new EconomicVO(monthly, economic, null, economic_lastMonth);

		if (economic_lastMonth != null) {
			ret.setIndustryAddition_monthGrowth(
					FormulaUtils.getGrowth(economic.getIndustryAddition(), economic_lastMonth.getIndustryAddition()));
		}
		return ret;
	}

}