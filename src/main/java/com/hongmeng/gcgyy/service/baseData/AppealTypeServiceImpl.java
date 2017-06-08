package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;
import com.hongmeng.gcgyy.repository.baseData.AppealTypeRepository;

@Service
public class AppealTypeServiceImpl implements AppealTypeService {

	@Autowired
	AppealTypeRepository appealTypeRepository;

	@Override
	public AppealTypeEntity findOne(Long appealTypeId) {
		return appealTypeRepository.findOne(appealTypeId);
	}
	
	@Override
	public AppealTypeEntity findByName(String name) {
		return appealTypeRepository.findByName(name);
	}

	@Override
	public void save(AppealTypeEntity appealType) {
		appealTypeRepository.save(appealType);
	}

	@Override
	public void update(AppealTypeEntity appealType, String name, Integer acceptDays, Integer handleDays) {
		appealType.setName(name);
		appealType.setAcceptDays(acceptDays);
		appealType.setHandleDays(handleDays);
		appealTypeRepository.save(appealType);
	}

	@Override
	public void delete(List<Long> appealTypeIds) {
		Iterable<AppealTypeEntity> it = appealTypeRepository.findByIdIn(appealTypeIds);
		appealTypeRepository.delete(it);
	}

	@Override
	public List<AppealTypeEntity> list() {
		return (List<AppealTypeEntity>) appealTypeRepository.findAll();
	}
}