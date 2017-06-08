package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import com.hongmeng.gcgyy.entity.baseData.AreaEntity;

public interface AreaService {

	AreaEntity findOne(Long areaId);
	
	AreaEntity findByName(String name);
	
	void save(AreaEntity area);
	
	void update(AreaEntity area, String name, String description);
	
	void delete(List<Long> areaIds);
	
	List<AreaEntity> list();
	
}
