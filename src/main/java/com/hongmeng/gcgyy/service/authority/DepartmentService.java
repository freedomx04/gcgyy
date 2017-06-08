package com.hongmeng.gcgyy.service.authority;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;

public interface DepartmentService {

	DepartmentEntity findOne(Long departmentId);
	
	DepartmentEntity findByName(String name);
	
	void save(DepartmentEntity department);
	
	void update(DepartmentEntity department, String name, String description, String principal, AreaEntity area);
	
	void delete(List<Long> departmentIds);
	
	List<DepartmentEntity> list();
	
}
