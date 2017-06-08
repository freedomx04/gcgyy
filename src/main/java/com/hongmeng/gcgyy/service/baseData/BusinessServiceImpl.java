package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;
import com.hongmeng.gcgyy.repository.baseData.BusinessRepository;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	BusinessRepository businessRepository;

	@Override
	public BusinessEntity findOne(Long businessId) {
		return businessRepository.findOne(businessId);
	}
	
	@Override
	public BusinessEntity findByName(String name) {
		return businessRepository.findByName(name);
	}

	@Override
	public void save(BusinessEntity business) {
		businessRepository.save(business);
	}

	@Override
	public void update(BusinessEntity business, String name, String description) {
		business.setName(name);
		business.setDescription(description);
		businessRepository.save(business);
	}

	@Override
	public void delete(List<Long> businessIds) {
		Iterable<BusinessEntity> it = businessRepository.findByIdIn(businessIds);
		businessRepository.delete(it);
	}

	@Override
	public List<BusinessEntity> list(){
		return (List<BusinessEntity>) businessRepository.findAll();
	}
	
}
