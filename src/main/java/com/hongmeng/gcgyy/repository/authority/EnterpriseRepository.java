package com.hongmeng.gcgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;

public interface EnterpriseRepository extends PagingAndSortingRepository<EnterpriseEntity, Long> {

	Iterable<EnterpriseEntity> findByIdIn(List<Long> enterpriseIds);
	
	@Query(value = "select user.enterprise_id from authority_user user where user.id = ?1", nativeQuery = true)
	Long findByUserId(Long userId);
	
	EnterpriseEntity findByName(String name);
	
	List<EnterpriseEntity> findByNameLike(String name);
	
	List<EnterpriseEntity> findByPointUser(BaseUserEntity pointUser);
	
	List<EnterpriseEntity> findByPointUserId(Long pointUserId);
	
	Page<EnterpriseEntity> findByPointUserId(Long pointUserId, Pageable pageable);
	
}
