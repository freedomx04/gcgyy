package com.hongmeng.gcgyy.repository.ranking;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.ranking.IndustryOutputEntity;

public interface IndustryOutputRepository extends CrudRepository<IndustryOutputEntity, Long> {

	Iterable<IndustryOutputEntity> findByIdIn(List<Long> outputIds);
	
	IndustryOutputEntity findByMonthlyAndCountyId(String monthly, Long countyId);
	
	Iterable<IndustryOutputEntity> findByCountyId(Long countyId);
	
	List<IndustryOutputEntity> findByMonthly(String monthly);
	
}
