package com.hongmeng.gcgyy.service.authority;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.RoleEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;

public interface UserService {

	UserEntity findOne(Long userId);

	BaseUserEntity findOneBase(Long userId);

	UserEntity findByUsername(String username);

	void save(UserEntity user);
	
	void delete(Long userId);
	
	List<BaseUserEntity> listBase();

	List<UserEntity> list();

	List<UserEntity> list(int page, int size);
	
	void update(UserEntity user, String name, String officephone, String telephone, Integer sex, String email,
			String address, DepartmentEntity department, EnterpriseEntity enterprise, RoleEntity role, String description);
	
	void update(UserEntity user, Integer sex, String name, String description, String position, String officephone);
	
	List<BaseUserEntity> listDispatcher();
	
	List<BaseUserEntity> listMonitor();
	
	UserEntity findByWxUserId(String wxUserId);
	
}
