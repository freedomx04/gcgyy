package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.ranking.ElectricityEntity;
import com.hongmeng.gcgyy.repository.ranking.ElectricityRepository;

@Service
public class ElectricityServiceImpl implements ElectricityService {
	
	@Autowired
	ElectricityRepository electricityRepository;

	@Override
	public ElectricityEntity findOne(Long electricityId) {
		return electricityRepository.findOne(electricityId);
	}

	@Override
	public ElectricityEntity findOne(String monthly, Long countyId) {
		return electricityRepository.findByMonthlyAndCountyId(monthly, countyId);
	}

	@Override
	public void save(ElectricityEntity electricity) {
		electricityRepository.save(electricity);
	}

	@Override
	public void delete(List<Long> electricityIds) {
		Iterable<ElectricityEntity> it = electricityRepository.findByIdIn(electricityIds);
		electricityRepository.delete(it);
	}

	@Override
	public List<ElectricityEntity> listByMonthly(String monthly) {
		return electricityRepository.findByMonthly(monthly);
	}

}
