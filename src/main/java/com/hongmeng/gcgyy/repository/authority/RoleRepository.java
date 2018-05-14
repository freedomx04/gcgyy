package com.hongmeng.gcgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.authority.RoleEntity;

public interface RoleRepository extends CrudRepository<RoleEntity, Long> {
	
	Iterable<RoleEntity> findByIdIn(List<Long> roleIds);
	
	RoleEntity findByName(String name);
	
	List<RoleEntity> findByResourceLike(String resource);

}
