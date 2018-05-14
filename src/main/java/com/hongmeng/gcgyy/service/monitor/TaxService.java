package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;

public interface TaxService {
	
	TaxVO detail(String monthly, BaseEnterpriseEntity enterprise);
	
	TaxVO sumEnterpriseTax(String monthly, List<BaseEnterpriseEntity> enterpriseList);

}
