package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.ranking.IndustryOutputEntity;
import com.hongmeng.gcgyy.repository.ranking.IndustryOutputRepository;

@Service
public class IndustryOutputServiceImpl implements IndustryOutputService {
	
	@Autowired
	IndustryOutputRepository outputRepository;

	@Override
	public IndustryOutputEntity findOne(Long outputId) {
		return outputRepository.findOne(outputId);
	}

	@Override
	public IndustryOutputEntity findOne(String monthly, Long countyId) {
		return outputRepository.findByMonthlyAndCountyId(monthly, countyId);
	}

	@Override
	public void save(IndustryOutputEntity output) {
		outputRepository.save(output);
	}

	@Override
	public void delete(List<Long> outputIds) {
		Iterable<IndustryOutputEntity> it = outputRepository.findByIdIn(outputIds);
		outputRepository.delete(it);
	}

	@Override
	public List<IndustryOutputEntity> listByMonthly(String monthly) {
		return outputRepository.findByMonthly(monthly);
	}

}
