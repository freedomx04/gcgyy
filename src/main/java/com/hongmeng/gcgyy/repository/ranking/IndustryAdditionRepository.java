package com.hongmeng.gcgyy.repository.ranking;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.ranking.IndustryAdditionEntity;

public interface IndustryAdditionRepository extends CrudRepository<IndustryAdditionEntity, Long> {
	
	Iterable<IndustryAdditionEntity> findByIdIn(List<Long> additionIds);
	
	IndustryAdditionEntity findByMonthlyAndCountyId(String monthly, Long countyId);
	
	Iterable<IndustryAdditionEntity> findByCountyId(Long countyId);
	
	List<IndustryAdditionEntity> findByMonthly(String monthly);

}
