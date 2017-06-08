package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.BenefitEntity;

public interface BenefitService {

	BenefitEntity findOne(Long benefitId);

	BenefitEntity findOne(String monthly, Long enterpriseId);

	void save(BenefitEntity benefit);

	void update(BenefitEntity benefit, String monthly, BaseEnterpriseEntity enterprise, float receivable,
			float inventory, float assets, float debt);

	void delete(List<Long> benefitIds);

	List<BenefitEntity> list(String monthly);

	List<BenefitEntity> list(String monthly, int page, int size);

	List<BenefitEntity> list(Long enterpriseId);

	List<BenefitEntity> list(Long enterpriseId, int page, int size);
	
	BenefitVO detail(BenefitEntity benefit);
	
	BenefitVO detail(String monthly, BaseEnterpriseEntity enterprise);
	
	List<BenefitEntity> listByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list);
	
	BenefitVO sumEnterpriseBenefit(String monthly, List<BaseEnterpriseEntity> enterpriseList);

}
