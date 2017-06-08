package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.baseData.OverviewTypeEntity;
import com.hongmeng.gcgyy.repository.baseData.OverviewTypeRepository;

@Service
public class OverviewTypeServiceImpl implements OverviewTypeService {
	
	@Autowired
	OverviewTypeRepository overviewTypeRepository;

	@Override
	public OverviewTypeEntity findOne(Long overviewTypeId) {
		return overviewTypeRepository.findOne(overviewTypeId);
	}

	@Override
	public void save(OverviewTypeEntity overviewType) {
		overviewTypeRepository.save(overviewType);
	}

	@Override
	public void update(OverviewTypeEntity overviewType, String name, String description) {
		overviewType.setName(name);
		overviewType.setDescription(description);
		overviewTypeRepository.save(overviewType);
	}

	@Override
	public void delete(List<Long> overviewTypeIds) {
		Iterable<OverviewTypeEntity> it = overviewTypeRepository.findByIdIn(overviewTypeIds);
		overviewTypeRepository.delete(it);
	}

	@Override
	public List<OverviewTypeEntity> list() {
		return (List<OverviewTypeEntity>) overviewTypeRepository.findAll();
	}

}