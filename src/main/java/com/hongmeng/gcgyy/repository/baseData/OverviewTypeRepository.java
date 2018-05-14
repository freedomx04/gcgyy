package com.hongmeng.gcgyy.repository.baseData;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.baseData.OverviewTypeEntity;

public interface OverviewTypeRepository extends CrudRepository<OverviewTypeEntity, Long> {

	Iterable<OverviewTypeEntity> findByIdIn(List<Long> overviewTypeIds);
	
}
