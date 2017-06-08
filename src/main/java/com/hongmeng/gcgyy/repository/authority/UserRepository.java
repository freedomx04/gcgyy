package com.hongmeng.gcgyy.repository.authority;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.UserEntity;

public interface UserRepository extends PagingAndSortingRepository<UserEntity, Long> {
	
	UserEntity findByUsername(String username);
	
	Iterable<UserEntity> findByEnterpriseId(Long enterpriseId);
	
	UserEntity findByWxUserId(String wxUserId);

}
