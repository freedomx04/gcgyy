package com.hongmeng.gcgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.repository.authority.DepartmentRepository;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Autowired
	DepartmentRepository departmentRepository;

	@Override
	public DepartmentEntity findOne(Long departmentId) {
		return departmentRepository.findOne(departmentId);
	}
	
	@Override
	public DepartmentEntity findByName(String name) {
		return departmentRepository.findByName(name);
	}

	@Override
	public void save(DepartmentEntity department) {
		departmentRepository.save(department);
	}

	@Override
	public void update(DepartmentEntity department, String name, String description, String principal, 
			AreaEntity area) {
		department.setName(name);
		department.setDescription(description);
		department.setPrincipal(principal);
		department.setArea(area);
		departmentRepository.save(department);
	}

	@Override
	public void delete(List<Long> departmentIds) {
		Iterable<DepartmentEntity> it = departmentRepository.findByIdIn(departmentIds);
		departmentRepository.delete(it);
	}

	@Override
	public List<DepartmentEntity> list() {
		return (List<DepartmentEntity>) departmentRepository.findAll();
	}
}