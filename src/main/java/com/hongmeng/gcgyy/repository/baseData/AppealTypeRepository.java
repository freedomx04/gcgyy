package com.hongmeng.gcgyy.repository.baseData;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;

public interface AppealTypeRepository extends CrudRepository<AppealTypeEntity, Long> {
	
	Iterable<AppealTypeEntity> findByIdIn(List<Long> appealTypeIds);
	
	AppealTypeEntity findByName(String name);
	
}
