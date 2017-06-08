package com.hongmeng.gcgyy.service.ranking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.ranking.MainBusinessEntity;
import com.hongmeng.gcgyy.repository.ranking.MainBusinessRepository;

@Service
public class MainBusinessServiceImpl implements MainBusinessService {

	@Autowired
	MainBusinessRepository businessRepository;
	
	@Override
	public MainBusinessEntity findOne(Long businessId) {
		return businessRepository.findOne(businessId);
	}

	@Override
	public MainBusinessEntity findOne(String monthly, Long countyId) {
		return businessRepository.findByMonthlyAndCountyId(monthly, countyId);
	}

	@Override
	public void save(MainBusinessEntity business) {
		businessRepository.save(business);
	}

	@Override
	public void delete(List<Long> businessIds) {
		Iterable<MainBusinessEntity> it = businessRepository.findByIdIn(businessIds);
		businessRepository.delete(it);
	}

	@Override
	public List<MainBusinessEntity> listByMonthly(String monthly) {
		return businessRepository.findByMonthly(monthly);
	}

}
