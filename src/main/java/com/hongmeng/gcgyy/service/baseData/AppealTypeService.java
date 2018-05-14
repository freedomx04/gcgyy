package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;

public interface AppealTypeService {

	AppealTypeEntity findOne(Long appealTypeId);
	
	AppealTypeEntity findByName(String name);

	void save(AppealTypeEntity appealType);

	void update(AppealTypeEntity appealType, String name, Integer acceptDays, Integer handleDays);

	void delete(List<Long> appealTypeIds);

	List<AppealTypeEntity> list();

}
