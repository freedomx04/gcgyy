package com.hongmeng.gcgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.RoleEntity;

public interface BaseUserRepository extends CrudRepository<BaseUserEntity, Long> {
	
	List<BaseUserEntity> findByRoleIn(List<RoleEntity> list);

}
