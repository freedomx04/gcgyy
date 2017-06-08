package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import com.hongmeng.gcgyy.entity.baseData.OverviewTypeEntity;

public interface OverviewTypeService {
	
	OverviewTypeEntity findOne(Long overviewTypeId);
	
	void save(OverviewTypeEntity overviewType);
	
	void update(OverviewTypeEntity overviewType, String name, String description);
	
	void delete(List<Long> overviewTypeIds);
	
	List<OverviewTypeEntity> list();

}
