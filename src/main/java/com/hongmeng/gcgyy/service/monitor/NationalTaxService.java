package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;

public interface NationalTaxService {

	void save(NationalTaxEntity nationalTax);

	void update(NationalTaxEntity nationalTax, BaseEnterpriseEntity enterprise, String monthly, String sale,
			String taxes);

	void delete(List<Long> nationalTaxIds);

	NationalTaxEntity findOne(Long nationalTaxId);

	NationalTaxEntity findOne(String monthly, Long enterpriseId);

	List<NationalTaxEntity> listByEnterprise(Long enterpriseId);

	NationalTaxVO detail(NationalTaxEntity nationalTax);
	

	NationalTaxVO detail(String monthly, BaseEnterpriseEntity enterprise);

	NationalTaxVO sumEnterpriseTax(String monthly, List<BaseEnterpriseEntity> enterpriseList);

}
