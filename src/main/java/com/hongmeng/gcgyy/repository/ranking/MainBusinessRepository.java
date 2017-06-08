package com.hongmeng.gcgyy.repository.ranking;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.ranking.MainBusinessEntity;

public interface MainBusinessRepository extends CrudRepository<MainBusinessEntity, Long> {

	Iterable<MainBusinessEntity> findByIdIn(List<Long> businessIds);
	
	MainBusinessEntity findByMonthlyAndCountyId(String monthly, Long countyId);
	
	Iterable<MainBusinessEntity> findByCountyId(Long countyId);
	
	List<MainBusinessEntity> findByMonthly(String monthly);
	
}
