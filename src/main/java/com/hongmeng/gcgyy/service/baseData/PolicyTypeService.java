package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import com.hongmeng.gcgyy.entity.baseData.PolicyTypeEntity;

public interface PolicyTypeService {
	
	PolicyTypeEntity findOne(Long policyTypeId);
	
	void save(PolicyTypeEntity policyType);
	
	void update(PolicyTypeEntity policyType, String name, String description);
	
	void delete(List<Long> policyTypeIds);
	
	List<PolicyTypeEntity> list();

}
