package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;

public interface LocalTaxService {

	void save(LocalTaxEntity localTax);

	void update(LocalTaxEntity localTax, BaseEnterpriseEntity enterprise, String monthly, String taxes);

	void delete(List<Long> localTaxIds);

	LocalTaxEntity findOne(Long localTaxId);
	
	LocalTaxEntity findOne(String monthly, Long enterpriseId);
	
	List<LocalTaxEntity> listByEnterpriseId(Long enterpriseId);
	
	LocalTaxVO detail(LocalTaxEntity localTax);
	
	
	
	LocalTaxVO detail(String monthly, BaseEnterpriseEntity enterprise);
	
	LocalTaxVO sumEnterpriseTax(String monthly, List<BaseEnterpriseEntity> enterpriseList);

}
