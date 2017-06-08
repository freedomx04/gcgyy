package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.ranking.ProfitEntity;
import com.hongmeng.gcgyy.repository.ranking.ProfitRepository;

@Service
public class ProfitServiceImpl implements ProfitService {
	
	@Autowired
	ProfitRepository profitRepository;

	@Override
	public ProfitEntity findOne(Long profitId) {
		return profitRepository.findOne(profitId);
	}

	@Override
	public ProfitEntity findOne(String monthly, Long countyId) {
		return profitRepository.findByMonthlyAndCountyId(monthly, countyId);
	}

	@Override
	public void save(ProfitEntity profit) {
		profitRepository.save(profit);
	}

	@Override
	public void delete(List<Long> profitIds) {
		Iterable<ProfitEntity> it = profitRepository.findByIdIn(profitIds);
		profitRepository.delete(it);
	}

	@Override
	public List<ProfitEntity> listByMonthly(String monthly) {
		return profitRepository.findByMonthly(monthly);
	}

}
