package com.hongmeng.gcgyy.service.baseData;

import java.util.List;

import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;

public interface BusinessService {

	BusinessEntity findOne(Long businessId);
	
	BusinessEntity findByName(String name);

	void save(BusinessEntity business);

	void update(BusinessEntity business, String name, String description);

	void delete(List<Long> businessIds);

	List<BusinessEntity> list();

}
