package com.hongmeng.gcgyy.repository.baseData;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.baseData.CountyEntity;

public interface CountyRepository extends CrudRepository<CountyEntity, Long> {
	
	Iterable<CountyEntity> findByIdIn(List<Long> countyIds);

	CountyEntity findByName(String name);
	
	List<CountyEntity> findAllByOrderBySortAsc();
	
}
