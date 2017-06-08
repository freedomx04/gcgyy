package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import com.hongmeng.gcgyy.entity.ranking.ElectricityEntity;

public interface ElectricityService {
	
	ElectricityEntity findOne(Long electricityId);
	
	ElectricityEntity findOne(String monthly, Long countyId);
	
	void save(ElectricityEntity electricity);
	
	void delete(List<Long> electricityIds);
	
	List<ElectricityEntity> listByMonthly(String monthly);

}
