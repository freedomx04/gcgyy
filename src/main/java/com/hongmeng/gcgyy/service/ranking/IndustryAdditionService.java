package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import com.hongmeng.gcgyy.entity.ranking.IndustryAdditionEntity;

public interface IndustryAdditionService {
	
	IndustryAdditionEntity findOne(Long additionId);
	
	IndustryAdditionEntity findOne(String monthly, Long countyId);
	
	void save(IndustryAdditionEntity addition);
	
	void delete(List<Long> additionIds);
	
	List<IndustryAdditionEntity> listByMonthly(String monthly); 

}
