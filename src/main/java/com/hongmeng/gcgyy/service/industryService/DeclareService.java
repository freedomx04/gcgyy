package com.hongmeng.gcgyy.service.industryService;

import java.util.Date;
import java.util.List;

import com.hongmeng.gcgyy.entity.industryService.BaseDeclareEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareEntity;

public interface DeclareService {

	DeclareEntity findOne(Long declareId);
	
	BaseDeclareEntity findOneBase(Long declareId);

	void save(DeclareEntity declare);

	void update(DeclareEntity declare, String itemName, String description, Date startTime, Date endTime,
			String attachName, String attachPath);
	
	void delete(DeclareEntity declare);

	void delete(List<Long> declareIds);

	List<DeclareEntity> list();

	List<DeclareEntity> list(int page, int size);
	
	List<DeclareEntity> listByUserId(Long userId);
	
	List<DeclareEntity> listByUserId(Long userId, int page, int size);
	
	List<DeclareEntity> listOnline();
	
	List<DeclareEntity> listOnline(int page, int size);

}
