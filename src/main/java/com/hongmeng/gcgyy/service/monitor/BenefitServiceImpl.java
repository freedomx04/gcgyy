package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.BenefitEntity;
import com.hongmeng.gcgyy.repository.monitor.BenefitRepository;

@Service
public class BenefitServiceImpl implements BenefitService {

	@Autowired
	BenefitRepository benefitRepository;

	@Override
	public BenefitEntity findOne(Long benefitId) {
		return benefitRepository.findOne(benefitId);
	}

	@Override
	public BenefitEntity findOne(String monthly, Long enterpriseId) {
		return benefitRepository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);
	}

	@Override
	public void save(BenefitEntity benefit) {
		benefitRepository.save(benefit);
	}

	@Override
	public void update(BenefitEntity benefit, String monthly, BaseEnterpriseEntity enterprise, float receivable,
			float inventory, float assets, float debt) {
		benefit.setMonthly(monthly);
		benefit.setEnterprise(enterprise);
		benefit.setReceivable(receivable);
		benefit.setInventory(inventory);
		benefit.setFlowAssets(receivable + inventory);
		benefit.setAssets(assets);
		benefit.setDebt(debt);
		benefit.setTotleAssets(assets + debt);
		benefitRepository.save(benefit);
	}

	@Override
	public void delete(List<Long> benefitIds) {
		Iterable<BenefitEntity> it = benefitRepository.findByIdIn(benefitIds);
		benefitRepository.delete(it);
	}

	@Override
	public List<BenefitEntity> list(String monthly) {
		return benefitRepository.findByMonthly(monthly);
	}

	@Override
	public List<BenefitEntity> list(String monthly, int page, int size) {
		Page<BenefitEntity> benefitPage = benefitRepository.findByMonthly(monthly, new PageRequest(page, size));
		return benefitPage.getContent();
	}

	@Override
	public List<BenefitEntity> list(Long enterpriseId) {
		return benefitRepository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId);
	}

	@Override
	public List<BenefitEntity> list(Long enterpriseId, int page, int size) {
		Page<BenefitEntity> benefitPage = benefitRepository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId,
				new PageRequest(page, size));
		return benefitPage.getContent();
	}

	@Override
	public BenefitVO detail(BenefitEntity benefit) {
		BenefitEntity benefit_lastYear = getLastYearBenefit(benefit);
		BenefitEntity benefit_lastMonth = getLastMonthBenefit(benefit);
		BenefitVO ret = new BenefitVO(benefit.getMonthly(), benefit, benefit_lastYear, benefit_lastMonth);

		if (benefit_lastYear != null) {
			ret.setReceivable_yearGrowth(
					FormulaUtils.getGrowth(benefit.getReceivable(), benefit_lastYear.getReceivable()));
			ret.setInventory_yearGrowth(
					FormulaUtils.getGrowth(benefit.getInventory(), benefit_lastYear.getInventory()));
			ret.setFlowAssets_yearGrowth(
					FormulaUtils.getGrowth(benefit.getFlowAssets(), benefit_lastYear.getFlowAssets()));
			ret.setAssets_yearGrowth(FormulaUtils.getGrowth(benefit.getFlowAssets(), benefit_lastYear.getFlowAssets()));
			ret.setDebt_yearGrowth(FormulaUtils.getGrowth(benefit.getDebt(), benefit_lastYear.getDebt()));
			ret.setTotleAssets_yearGrowth(
					FormulaUtils.getGrowth(benefit.getTotleAssets(), benefit_lastYear.getTotleAssets()));
		}

		if (benefit_lastMonth != null) {
			ret.setReceivable_monthGrowth(
					FormulaUtils.getGrowth(benefit.getReceivable(), benefit_lastMonth.getReceivable()));
			ret.setInventory_monthGrowth(
					FormulaUtils.getGrowth(benefit.getInventory(), benefit_lastMonth.getInventory()));
			ret.setFlowAssets_monthGrowth(
					FormulaUtils.getGrowth(benefit.getFlowAssets(), benefit_lastMonth.getFlowAssets()));
			ret.setAssets_monthGrowth(
					FormulaUtils.getGrowth(benefit.getFlowAssets(), benefit_lastMonth.getFlowAssets()));
			ret.setDebt_monthGrowth(FormulaUtils.getGrowth(benefit.getDebt(), benefit_lastMonth.getDebt()));
			ret.setTotleAssets_monthGrowth(
					FormulaUtils.getGrowth(benefit.getTotleAssets(), benefit_lastMonth.getTotleAssets()));
		}

		return ret;
	}

	@Override
	public BenefitVO detail(String monthly, BaseEnterpriseEntity enterprise) {
		BenefitVO ret = null;
		Long enterpriseId = enterprise.getId();

		BenefitEntity benefit_current = benefitRepository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);
/*		if (benefit_current != null && benefit_current.getStatus() < ApproveStatus.REPORT) {
			ret = new BenefitVO(monthly, null, null, null);
			ret.setEnterprise(enterprise);
			return ret;
		}*/
		
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		BenefitEntity benefit_lastYear = benefitRepository.findByMonthlyAndEnterpriseId(monthly_lastYear, enterpriseId);
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		BenefitEntity benefit_lastMonth = benefitRepository.findByMonthlyAndEnterpriseId(monthly_lastMonth,
				enterpriseId);

		ret = new BenefitVO(monthly, benefit_current, benefit_lastYear, benefit_lastMonth);
		ret.setEnterprise(enterprise);

		if (benefit_current != null && benefit_lastYear != null) {
			ret.setReceivable_yearGrowth(
					FormulaUtils.getGrowth(benefit_current.getReceivable(), benefit_lastYear.getReceivable()));
			ret.setInventory_yearGrowth(
					FormulaUtils.getGrowth(benefit_current.getInventory(), benefit_lastYear.getInventory()));
			ret.setFlowAssets_yearGrowth(
					FormulaUtils.getGrowth(benefit_current.getFlowAssets(), benefit_lastYear.getFlowAssets()));
			ret.setAssets_yearGrowth(
					FormulaUtils.getGrowth(benefit_current.getFlowAssets(), benefit_lastYear.getFlowAssets()));
			ret.setDebt_yearGrowth(FormulaUtils.getGrowth(benefit_current.getDebt(), benefit_lastYear.getDebt()));
			ret.setTotleAssets_yearGrowth(
					FormulaUtils.getGrowth(benefit_current.getTotleAssets(), benefit_lastYear.getTotleAssets()));
		}

		if (benefit_current != null && benefit_lastMonth != null) {
			ret.setReceivable_monthGrowth(
					FormulaUtils.getGrowth(benefit_current.getReceivable(), benefit_lastMonth.getReceivable()));
			ret.setInventory_monthGrowth(
					FormulaUtils.getGrowth(benefit_current.getInventory(), benefit_lastMonth.getInventory()));
			ret.setFlowAssets_monthGrowth(
					FormulaUtils.getGrowth(benefit_current.getFlowAssets(), benefit_lastMonth.getFlowAssets()));
			ret.setAssets_monthGrowth(
					FormulaUtils.getGrowth(benefit_current.getFlowAssets(), benefit_lastMonth.getFlowAssets()));
			ret.setDebt_monthGrowth(FormulaUtils.getGrowth(benefit_current.getDebt(), benefit_lastMonth.getDebt()));
			ret.setTotleAssets_monthGrowth(
					FormulaUtils.getGrowth(benefit_current.getTotleAssets(), benefit_lastMonth.getTotleAssets()));
		}

		return ret;
	}

	public BenefitEntity getLastYearBenefit(BenefitEntity benefit) {
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(benefit.getMonthly());
		return benefitRepository.findByMonthlyAndEnterpriseId(monthly_lastYear, benefit.getEnterprise().getId());
	}

	public BenefitEntity getLastMonthBenefit(BenefitEntity benefit) {
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(benefit.getMonthly());
		return benefitRepository.findByMonthlyAndEnterpriseId(monthly_lastMonth, benefit.getEnterprise().getId());
	}

	@Override
	public List<BenefitEntity> listByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list) {
		return benefitRepository.findByMonthlyAndEnterpriseIn(monthly, list);
	}

	@Override
	public BenefitVO sumEnterpriseBenefit(String monthly, List<BaseEnterpriseEntity> enterpriseList) {
		// current
		float receivable_current_totle = 0;
		float inventory_current_totle = 0;
		float assets_current_totle = 0;
		float debt_current_totle = 0;
		List<BenefitEntity> benefitList = listByMonthlyAndEnterpriseIn(monthly, enterpriseList);
		for (BenefitEntity benefit : benefitList) {
//			if (benefit.getStatus() == ApproveStatus.PASS) {
				receivable_current_totle += benefit.getReceivable();
				inventory_current_totle += benefit.getInventory();
				assets_current_totle += benefit.getAssets();
				debt_current_totle += benefit.getDebt();
//			}
		}
		BenefitEntity benefit_current_totle = new BenefitEntity(monthly, null, receivable_current_totle,
				inventory_current_totle, assets_current_totle, debt_current_totle);

		// last year
		String lastYearMonthly = FormulaUtils.getLastYearMonthly(monthly);
		float receivable_lastYear_totle = 0;
		float inventory_lastYear_totle = 0;
		float assets_lastYear_totle = 0;
		float debt_lastYear_totle = 0;
		List<BenefitEntity> benefitList_lastYear = listByMonthlyAndEnterpriseIn(lastYearMonthly, enterpriseList);
		for (BenefitEntity benefit : benefitList_lastYear) {
//			if (benefit.getStatus() == ApproveStatus.PASS) {
				receivable_lastYear_totle += benefit.getReceivable();
				inventory_lastYear_totle += benefit.getInventory();
				assets_lastYear_totle += benefit.getAssets();
				debt_lastYear_totle += benefit.getDebt();
//			}
		}
		BenefitEntity benefit_lastYear_totle = new BenefitEntity(lastYearMonthly, null, receivable_lastYear_totle,
				inventory_lastYear_totle, assets_lastYear_totle, debt_lastYear_totle);

		// last month
		String lastMonthMonthly = FormulaUtils.getLastMonthMonthly(monthly);
		float receivable_lastMonth_totle = 0;
		float inventory_lastMonth_totle = 0;
		float assets_lastMonth_totle = 0;
		float debt_lastMonth_totle = 0;
		List<BenefitEntity> benefitList_lastMonth = listByMonthlyAndEnterpriseIn(lastMonthMonthly, enterpriseList);
		for (BenefitEntity benefit : benefitList_lastMonth) {
//			if (benefit.getStatus() == ApproveStatus.PASS) {
				receivable_lastMonth_totle += benefit.getReceivable();
				inventory_lastMonth_totle += benefit.getInventory();
				assets_lastMonth_totle += benefit.getAssets();
				debt_lastMonth_totle += benefit.getDebt();
//			}
		}
		BenefitEntity benefit_lastMonth_totle = new BenefitEntity(lastMonthMonthly, null, receivable_lastMonth_totle,
				inventory_lastMonth_totle, assets_lastMonth_totle, debt_lastMonth_totle);

		BenefitVO ret = new BenefitVO(monthly, benefit_current_totle, benefit_lastYear_totle, benefit_lastMonth_totle);

		// 同比
		ret.setReceivable_yearGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getReceivable(), benefit_lastYear_totle.getReceivable()));
		ret.setInventory_yearGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getInventory(), benefit_lastYear_totle.getInventory()));
		ret.setFlowAssets_yearGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getFlowAssets(), benefit_lastYear_totle.getFlowAssets()));
		ret.setAssets_yearGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getAssets(), benefit_lastYear_totle.getAssets()));
		ret.setDebt_yearGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getDebt(), benefit_lastYear_totle.getDebt()));
		ret.setTotleAssets_yearGrowth(FormulaUtils.getGrowth(benefit_current_totle.getTotleAssets(),
				benefit_lastYear_totle.getTotleAssets()));

		// 环比
		ret.setReceivable_monthGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getReceivable(), benefit_lastMonth_totle.getReceivable()));
		ret.setInventory_monthGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getInventory(), benefit_lastMonth_totle.getInventory()));
		ret.setFlowAssets_monthGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getFlowAssets(), benefit_lastMonth_totle.getFlowAssets()));
		ret.setAssets_monthGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getAssets(), benefit_lastMonth_totle.getAssets()));
		ret.setDebt_monthGrowth(
				FormulaUtils.getGrowth(benefit_current_totle.getDebt(), benefit_lastMonth_totle.getDebt()));
		ret.setTotleAssets_monthGrowth(FormulaUtils.getGrowth(benefit_current_totle.getTotleAssets(),
				benefit_lastMonth_totle.getTotleAssets()));

		return ret;
	}

}