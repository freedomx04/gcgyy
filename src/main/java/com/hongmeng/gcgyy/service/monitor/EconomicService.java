package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicTargetEntity;

public interface EconomicService {

	EconomicEntity findOne(Long economicId);

	EconomicEntity findOne(String monthly, Long enterpriseId);

	void save(EconomicEntity economic);

	void update(EconomicEntity economic, String monthly, BaseEnterpriseEntity enterprise, float industryAddition,
			float mainBusiness, float profit, float tax);

	void delete(List<Long> economicIds);

	List<EconomicEntity> list(String monthly);

	List<EconomicEntity> list(String monthly, int page, int size);

	List<EconomicEntity> list(Long enterpriseId);

	List<EconomicEntity> list(Long enterpriseId, int page, int size);

	EconomicVO detail(EconomicEntity economic);
	
	EconomicVO detail(String monthly, BaseEnterpriseEntity enterprise);

	List<EconomicEntity> listByMonthlyAndEnterpriseIn(String monthly, List<BaseEnterpriseEntity> list);

	List<EconomicEntity> listByMonthlyInAndEnterpriseId(List<String> monthlyList, Long enterpriseId);

	EconomicVO sumEnterpriseEconomic(String monthly, List<BaseEnterpriseEntity> enterpriseList);
	
	EconomicVO sumEnterpriseEconomic2(String monthly, List<BaseEnterpriseEntity> enterpriseList);
	
	// economic year target
	EconomicTargetEntity findOneTarget(Long economicTargetId);
	
	void saveTarget(EconomicTargetEntity target);
	
	void update(EconomicTargetEntity target, String year, float value);
	
	// economic ranking
	List<EconomicVO> listIndustryDesc(String monthly);

}
