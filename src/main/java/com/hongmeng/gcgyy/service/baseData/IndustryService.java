package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import com.hongmeng.gcgyy.entity.baseData.IndustryEntity;

public interface IndustryService {
	
	IndustryEntity findOne(Long industryId);
	
	void save(IndustryEntity industry);
	
	void update(IndustryEntity industry, String name);
	
	void delete(List<Long> industryIds);
	
	List<IndustryEntity> list();

}
