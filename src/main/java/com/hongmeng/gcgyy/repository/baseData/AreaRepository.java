package com.hongmeng.gcgyy.repository.baseData;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.baseData.AreaEntity;

public interface AreaRepository extends CrudRepository<AreaEntity, Long> {
	
	Iterable<AreaEntity> findByIdIn(List<Long> areaIds);
	
	AreaEntity findByName(String name);

}
