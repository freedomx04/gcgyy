package com.hongmeng.gcgyy.repository.ranking;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.ranking.ProfitEntity;

public interface ProfitRepository extends CrudRepository<ProfitEntity, Long> {
	
	Iterable<ProfitEntity> findByIdIn(List<Long> taxIds);
	
	ProfitEntity findByMonthlyAndCountyId(String monthly, Long countyId);
	
	Iterable<ProfitEntity> findByCountyId(Long countyId);
	
	List<ProfitEntity> findByMonthly(String monthly);

}
