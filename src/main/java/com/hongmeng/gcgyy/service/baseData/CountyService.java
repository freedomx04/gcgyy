package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import com.hongmeng.gcgyy.entity.baseData.CountyEntity;

public interface CountyService {
	
	CountyEntity findOne(Long countyId);
	
	CountyEntity findByName(String name);
	
	void save(CountyEntity county);
	
	void delete(List<Long> countyIds);
	
	List<CountyEntity> list();

}
