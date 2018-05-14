package com.hongmeng.gcgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;

public interface DepartmentRepository extends CrudRepository<DepartmentEntity, Long> {

	Iterable<DepartmentEntity> findByIdIn(List<Long> departmentIds);
	
	DepartmentEntity findByName(String name);
	
}
