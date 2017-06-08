package com.hongmeng.gcgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.authority.RoleEntity;
import com.hongmeng.gcgyy.repository.authority.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	RoleRepository roleRepository;

	@Override
	public RoleEntity findOne(Long roleId) {
		return roleRepository.findOne(roleId);
	}
	
	@Override
	public RoleEntity findByName(String name) {
		return roleRepository.findByName(name);
	}

	@Override
	public void save(RoleEntity role) {
		roleRepository.save(role);
	}

	@Override
	public void update(RoleEntity role, String name, String code, String description, String resource) {
		role.setName(name);
		role.setCode(code);
		role.setDescription(description);
		role.setResource(resource);
		roleRepository.save(role);
	}

	@Override
	public void delete(List<Long> roleIds) {
		Iterable<RoleEntity> it = roleRepository.findByIdIn(roleIds);
		roleRepository.delete(it);
	}

	@Override
	public List<RoleEntity> list() {
		return (List<RoleEntity>) roleRepository.findAll();
	}

	@Override
	public List<RoleEntity> searchByResource(String resource) {
		List<RoleEntity> list = roleRepository.findByResourceLike("%" + resource + "%");
		return list;
	}

}