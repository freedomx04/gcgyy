package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.ranking.IndustryAdditionEntity;
import com.hongmeng.gcgyy.repository.ranking.IndustryAdditionRepository;

@Service

public class IndustryAdditionServiceImpl implements IndustryAdditionService {
	
	@Autowired
	IndustryAdditionRepository additionRepository;

	@Override
	public IndustryAdditionEntity findOne(Long additionId) {
		return additionRepository.findOne(additionId);
	}

	@Override
	public IndustryAdditionEntity findOne(String monthly, Long countyId) {
		return additionRepository.findByMonthlyAndCountyId(monthly, countyId);
	}
	
	@Override
	public void save(IndustryAdditionEntity addition) {
		additionRepository.save(addition);
	}

	@Override
	public void delete(List<Long> additionIds) {
		Iterable<IndustryAdditionEntity> it = additionRepository.findByIdIn(additionIds);
		additionRepository.delete(it);
	}
	
	@Override
	public List<IndustryAdditionEntity> listByMonthly(String monthly) {
		return additionRepository.findByMonthly(monthly);
	}

}
