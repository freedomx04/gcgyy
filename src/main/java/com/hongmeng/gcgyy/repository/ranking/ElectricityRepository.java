package com.hongmeng.gcgyy.repository.ranking;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.ranking.ElectricityEntity;

public interface ElectricityRepository extends CrudRepository<ElectricityEntity, Long> {
	
	Iterable<ElectricityEntity> findByIdIn(List<Long> electricityIds);
	
	ElectricityEntity findByMonthlyAndCountyId(String monthly, Long countyId);
	
	Iterable<ElectricityEntity> findByCountyId(Long countyId);
	
	List<ElectricityEntity> findByMonthly(String monthly);

}
