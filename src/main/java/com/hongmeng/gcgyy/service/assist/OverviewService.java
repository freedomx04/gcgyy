package com.hongmeng.gcgyy.service.assist;

import java.util.List;

import com.hongmeng.gcgyy.entity.assist.OverviewEntity;
import com.hongmeng.gcgyy.entity.baseData.OverviewTypeEntity;

public interface OverviewService {
	
	OverviewEntity findOne(Long overviewId);
	
	void save(OverviewEntity overview);
	
	void update(OverviewEntity overview, String title, OverviewTypeEntity overviewType, String linkPath);
	
	void delete(List<Long> overviewIds);
	
	List<OverviewEntity> list();
	
	List<OverviewEntity> listPaging(int page, int size);

}
