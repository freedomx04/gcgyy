package com.hongmeng.gcgyy.service.assist;

import java.util.List;

import com.hongmeng.gcgyy.entity.assist.PolicyEntity;
import com.hongmeng.gcgyy.entity.baseData.PolicyTypeEntity;

public interface PolicyService {
	
	PolicyEntity findOne(Long policyId);
	
	void save(PolicyEntity policy);
	
	void update(PolicyEntity policy, String title, PolicyTypeEntity policyType, String linkPath);
	
	void delete(List<Long> policyIds);
	
	List<PolicyEntity> list();
	
	List<PolicyEntity> listPaging(int page, int size);

}
