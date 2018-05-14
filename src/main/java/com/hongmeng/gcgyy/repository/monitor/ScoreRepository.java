package com.hongmeng.gcgyy.repository.monitor;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.monitor.ScoreEntity;

public interface ScoreRepository extends CrudRepository<ScoreEntity, Long> {
	
	ScoreEntity findByEnterpriseId(Long enterpriseId);
	
	List<ScoreEntity> findFirst5ByOrderByScoreDesc();

}
