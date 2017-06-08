package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import com.hongmeng.gcgyy.entity.monitor.ScoreEntity;

public interface ScoreService {
	
	ScoreEntity findOne(Long scoreId);
	
	ScoreEntity findByEnterpriseId(Long enterpriseId);
	
	void save(ScoreEntity score);
	
	List<ScoreEntity> list();
	
	List<ScoreEntity> ranking();

}
