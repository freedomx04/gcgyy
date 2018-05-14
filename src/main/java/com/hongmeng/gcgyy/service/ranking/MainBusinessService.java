package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import com.hongmeng.gcgyy.entity.ranking.MainBusinessEntity;

public interface MainBusinessService {

	MainBusinessEntity findOne(Long businessId);
	
	MainBusinessEntity findOne(String monthly, Long countyId);
	
	void save(MainBusinessEntity business);
	
	void delete(List<Long> businessIds);
	
	List<MainBusinessEntity> listByMonthly(String monthly); 
	
}
