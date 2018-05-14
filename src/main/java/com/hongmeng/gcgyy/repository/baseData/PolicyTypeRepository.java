package com.hongmeng.gcgyy.repository.baseData;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.baseData.PolicyTypeEntity;

public interface PolicyTypeRepository extends CrudRepository<PolicyTypeEntity, Long> {

	Iterable<PolicyTypeEntity> findByIdIn(List<Long> policyTypeIds);
	
}
