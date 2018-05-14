package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.baseData.PolicyTypeEntity;
import com.hongmeng.gcgyy.repository.baseData.PolicyTypeRepository;

@Service
public class PolicyTypeServiceImpl implements PolicyTypeService {
	
	@Autowired
	PolicyTypeRepository policyTypeRepository;

	@Override
	public PolicyTypeEntity findOne(Long policyTypeId) {
		return policyTypeRepository.findOne(policyTypeId);
	}

	@Override
	public void save(PolicyTypeEntity policyType) {
		policyTypeRepository.save(policyType);
	}

	@Override
	public void update(PolicyTypeEntity policyType, String name, String description) {
		policyType.setName(name);
		policyType.setDescription(description);
		policyTypeRepository.save(policyType);
	}

	@Override
	public void delete(List<Long> policyTypeIds) {
		Iterable<PolicyTypeEntity> it = policyTypeRepository.findByIdIn(policyTypeIds);
		policyTypeRepository.delete(it);
	}

	@Override
	public List<PolicyTypeEntity> list() {
		return (List<PolicyTypeEntity>) policyTypeRepository.findAll();
	}

}