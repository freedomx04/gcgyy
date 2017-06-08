package com.hongmeng.gcgyy.repository.baseData;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.baseData.IndustryEntity;

public interface IndustryRepository extends CrudRepository<IndustryEntity, Long> {
	
	Iterable<IndustryEntity> findByIdIn(List<Long> industryIds);

}
