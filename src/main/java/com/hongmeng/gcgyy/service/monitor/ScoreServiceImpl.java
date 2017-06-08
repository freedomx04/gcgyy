package com.hongmeng.gcgyy.service.monitor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.monitor.ScoreEntity;
import com.hongmeng.gcgyy.repository.monitor.ScoreRepository;

@Service
public class ScoreServiceImpl implements ScoreService {
	
	@Autowired
	ScoreRepository scoreRepository;

	@Override
	public ScoreEntity findOne(Long scoreId) {
		return scoreRepository.findOne(scoreId);
	}

	@Override
	public ScoreEntity findByEnterpriseId(Long enterpriseId) {
		return scoreRepository.findByEnterpriseId(enterpriseId);
	}

	@Override
	public void save(ScoreEntity score) {
		scoreRepository.save(score);
	}

	@Override
	public List<ScoreEntity> list() {
		return (List<ScoreEntity>) scoreRepository.findAll();
	}

	@Override
	public List<ScoreEntity> ranking() {
		return scoreRepository.findFirst5ByOrderByScoreDesc();
	}

}
