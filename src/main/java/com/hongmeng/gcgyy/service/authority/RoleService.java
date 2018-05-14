package com.hongmeng.gcgyy.service.authority;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.RoleEntity;

public interface RoleService {
	
	RoleEntity findOne(Long roleId);
	
	RoleEntity findByName(String name);
	
	void save(RoleEntity role);
	
	void update(RoleEntity role, String name, String code, String description, String resource);
	
	void delete(List<Long> roleIds);
	
	List<RoleEntity> list();
	
	List<RoleEntity> searchByResource(String resource);

}
