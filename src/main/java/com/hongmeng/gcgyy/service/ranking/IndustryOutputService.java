package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import com.hongmeng.gcgyy.entity.ranking.IndustryOutputEntity;

public interface IndustryOutputService {
	
	IndustryOutputEntity findOne(Long outputId);
	
	IndustryOutputEntity findOne(String monthly, Long countyId);
	
	void save(IndustryOutputEntity output);
	
	void delete(List<Long> outputIds);
	
	List<IndustryOutputEntity> listByMonthly(String monthly);

}
