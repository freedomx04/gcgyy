package com.hongmeng.gcgyy.repository.baseData;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;

public interface BusinessRepository extends CrudRepository<BusinessEntity, Long> {

	Iterable<BusinessEntity> findByIdIn(List<Long> businessIds);
	
	BusinessEntity findByName(String name);

}
