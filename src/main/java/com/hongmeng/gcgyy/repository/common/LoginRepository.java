package com.hongmeng.gcgyy.repository.common;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.common.LoginEntity;

public interface LoginRepository extends CrudRepository<LoginEntity, Long> {
	
	LoginEntity findByUserAndLoginType(BaseUserEntity user, Integer loginType);
	
	List<LoginEntity> findByUserId(Long userId);

}
