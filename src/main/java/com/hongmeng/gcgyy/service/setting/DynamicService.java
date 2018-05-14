package com.hongmeng.gcgyy.service.setting;

import java.util.List;

import com.hongmeng.gcgyy.entity.setting.DynamicEntity;

public interface DynamicService {
	
	DynamicEntity findOne(Long dynamicId);
	
	void save(DynamicEntity dynamic);
	
	void update(DynamicEntity dynamic, String title, Integer type, String imagePath, String linkPath);
	
	void delete(List<Long> dynamicIds);
	
	List<DynamicEntity> list();
	
	List<DynamicEntity> listPaging(int page, int size);
	
	List<DynamicEntity> listByType(Integer type);
	
	List<DynamicEntity> listByTypePaging(Integer type, int page, int size);

}
